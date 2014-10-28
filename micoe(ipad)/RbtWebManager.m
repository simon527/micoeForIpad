//
//  RbtWebManager.m
//  RedBudTek
//
//  Created by 黄川 on 13-11-10.
//  Copyright (c) 2013年 redbudtek. All rights reserved.
//

#import "RbtWebManager.h"
#import "RbtOnlineManager.h"
#import "RbtOfflineManager.h"
#import "NSString+MyExtensions.h"
#import "JSONKit.h"

@interface RbtWebManager()

@end

@implementation RbtWebManager

+ (RbtWebManager *)getRbtManager:(BOOL) isOnLine{
    if (isOnLine) {
        id one = [[RbtOnlineManager alloc] init];
        return one;
    }
    else{
        id one = [[RbtOfflineManager alloc] init];
        return one;
    }
}

- (void)getResponseDataWithDic:(NSDictionary *)info andUrlString:(NSString *)urlString{
    NSLog(@"urlString  = %@",urlString);
    NSLog(@"info  = %@",info);
    
    NSError *error2 = nil;
    NSData *postData = [NSJSONSerialization dataWithJSONObject:info options:NSJSONWritingPrettyPrinted error:&error2];
    //计算POST提交数据的长度
    NSString *postLength = [NSString stringWithFormat:@"%d",[postData length]];
//    NSLog(@"postLength=%@",postLength);
    //定义NSMutableURLRequest
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    //设置提交目的url
    [request setURL:[NSURL URLWithString:urlString]];
        //设置提交方式为 POST
        [request setHTTPMethod:@"POST"];
    
   
    //设置http-header:Content-Type
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    //设置http-header:Content-Length
    [request setValue:postLength forHTTPHeaderField:@"Content-Length"];
    //设置需要post提交的内容
    [request setHTTPBody:postData];

    [request setTimeoutInterval:30];

    if ([self.name isEqualToString:@"sbweb"]||[self.name isEqualToString:@"ss_auto"]||[self.name isEqualToString:@"ss_time"]||[self.name isEqualToString:@"ss_stop"]||[self.name isEqualToString:@"jr_auto"]||[self.name isEqualToString:@"jr_time"]||[self.name isEqualToString:@"jr_stop"]) {
        [request setTimeoutInterval:40];
    }
    //同步提交:POST提交并等待返回值（同步），返回值是NSData类型。
//    NSData *responseData = [NSURLConnection sendSynchronousRequest:request returningResponse:&urlResponse error:&error];
    
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
 
    [NSURLConnection sendAsynchronousRequest:request queue:queue completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
       dispatch_async(dispatch_get_main_queue(), ^{
            if (connectionError) {
                NSLog(@"error = %@",connectionError);
                
                if (![self.name hasSuffix:@"shuaxin"]) {
                    [RbtCommonTool showInfoAlert:@"连接超时"];
                }
                if (self.delegate) {
                    [self.delegate webServicefailed:self];
                }
                else{
                    NSLog(@"web has no delegate");
                }
            }
            else{
                //将NSData类型的返回值转换成NSString类型
                NSString *responseDataString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
                NSLog(@"responseDataString :%@",responseDataString);
                [self handleData:data];
            }
        });
    }];
}

- (void)handleData:(NSData *)responseData{
    if (responseData) {
        NSDictionary *responseDic = [self jsonDersialized:responseData];
        if (responseDic) {
            if (self.delegate) {
                [self.delegate onDataLoadWithService:self andResponse:responseDic];
            }
            else{
                NSLog(@"web has no delegate");
            }
        }
        else{
            NSLog(@"download error data");
            if (self.delegate) {
                [self.delegate webServicefailed:self];
            }
            else{
                NSLog(@"web has no delegate");
            }
            if (!([self.name isEqualToString:@"tqybweb"]||[self.name hasSuffix:@"shuaxin"])) {
                [RbtCommonTool showInfoAlert:@"数据出错"];
            }
        }
    }
    else{
        if (![self.name hasSuffix:@"shuaxin"]) {
            [RbtCommonTool showInfoAlert:@"获取服务器数据失败"];
        }
        if (self.delegate) {
            [self.delegate webServicefailed:self];
        }
        else{
            NSLog(@"web has no delegate");
        }
    }
}

- (NSDictionary *)jsonDersialized:(NSData *)responseData{
    NSError *jsonerror = nil;
    NSDictionary *deserializedDictionary = nil;
    id jsonObject = [NSJSONSerialization
                     JSONObjectWithData:responseData options:NSJSONReadingAllowFragments error:&jsonerror];
    if (jsonObject != nil && jsonerror == nil){
        if ([jsonObject isKindOfClass:[NSDictionary class]]){
            deserializedDictionary = (NSDictionary *)jsonObject;
            //NSLog(@"Dersialized JSON Dictionary = %@", deserializedDictionary);
        }
        else if ([jsonObject isKindOfClass:[NSArray class]]){
            NSArray *deserializedArray = (NSArray *)jsonObject; NSLog(@"Dersialized JSON Array = %@", deserializedArray);
            NSLog(@"json array object was returned");
        }
        else {
            NSLog(@"json Some other object was returned");
            /* Some other object was returned. We don't know how to deal
             with this situation as the deserializer only returns dictionaries or arrays */
        }
    }
    else if (jsonerror != nil){
        NSLog(@"An error happened while deserializing the JSON data. error = %@",jsonerror);
        
    }
    return deserializedDictionary;
}

- (void)getWeatherInfo:(NSString *)cityCode{
    //中国天气网解析地址；
    NSString *path=@"http://m.weather.com.cn/data/cityNumber.html";
    //将城市代码替换到天气解析网址cityNumber 部分！
    path=[path stringByReplacingOccurrencesOfString:@"cityNumber" withString:cityCode];
    NSLog(@"weather path = %@",path);
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
     NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:path]];
    [NSURLConnection sendAsynchronousRequest:request queue:queue completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        dispatch_async(dispatch_get_main_queue(), ^{
            if (connectionError) {
                NSLog(@"error = %@",connectionError);
                NSLog(@"连接服务器超时");
                if (self.delegate) {
                    [self.delegate webServicefailed:self];
                }
                else{
                    NSLog(@"web has no delegate");
                }
            }
            else{
                //将NSData类型的返回值转换成NSString类型
                NSString *responseDataString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
                NSLog(@"responseDataString :%@",responseDataString);
                [self handleData:data];
            }
        });
    }];
}

- (void)getWeatherInfoshishi:(NSString *)cityCode{
    //中国天气网解析地址；
    NSString *path=@"http://www.weather.com.cn/data/sk/cityNumber.html";
    //将城市代码替换到天气解析网址cityNumber 部分！
    path=[path stringByReplacingOccurrencesOfString:@"cityNumber" withString:cityCode];
    NSLog(@"weather path = %@",path);
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:path]];
    [NSURLConnection sendAsynchronousRequest:request queue:queue completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        dispatch_async(dispatch_get_main_queue(), ^{
            if (connectionError) {
                NSLog(@"error = %@",connectionError);
                NSLog(@"连接服务器超时");
                if (self.delegate) {
                    [self.delegate webServicefailed:self];
                }
                else{
                    NSLog(@"web has no delegate");
                }
            }
            else{
                //将NSData类型的返回值转换成NSString类型
                NSString *responseDataString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
                NSLog(@"responseDataString :%@",responseDataString);
                [self handleData:data];
            }
        });
    }];
}

//百度天气接口
- (void)getWeatherInfowithBaidu:(NSString *)city{
    //百度天气解析地址；
//    NSString *path=@"http://api.map.baidu.com/telematics/v3/weather?location=city&output=json&ak=pkZtCTsOdeiX1uawYXmepioT";
    
//    NSString *urlString = [RbtCommonTool getServerUrl];
//    urlString = [urlString stringByAppendingString:@"/weather"]
    NSString *path = [RbtCommonTool getServerUrl];
    path = [path stringByAppendingString:[NSString stringWithFormat:@"/weather?location=%@",city]];
    path = [path stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    //将城市代码替换到天气解析网址cityNumber 部分！
//    path=[path stringByReplacingOccurrencesOfString:@"city" withString:city];
    NSLog(@"weather path = %@",path);
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:path]];
    [request setHTTPMethod:@"get"];
    [NSURLConnection sendAsynchronousRequest:request queue:queue completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        dispatch_async(dispatch_get_main_queue(), ^{
            if (connectionError) {
                NSLog(@"error = %@",connectionError);
                NSLog(@"连接服务器超时");
                if (self.delegate) {
                    [self.delegate webServicefailed:self];
                }
                else{
                    NSLog(@"web has no delegate");
                }
            }
            else{
                //将NSData类型的返回值转换成NSString类型
                NSString *responseDataString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
                NSLog(@"responseDataString :%@",responseDataString);
                [self handleData:data];
            }
        });
    }];
}



- (void)loginName:(NSString *)userName passWord:(NSString *)passWord{
    passWord = [passWord md5];
    NSDictionary *info = [NSDictionary dictionaryWithObjectsAndKeys:userName,@"u",passWord,@"p", nil];
    NSString *urlString = [RbtCommonTool getServerUrl];
    urlString = [urlString stringByAppendingString:@"/user/login"];
    
    [self getResponseDataWithDic:info andUrlString:urlString];
}


- (void)getpassowrd:(NSString *)u{
    NSDictionary *info = [NSDictionary dictionaryWithObjectsAndKeys:u,@"u",nil];
    NSString *urlString = [RbtCommonTool getServerUrl];
    urlString = [urlString stringByAppendingString:@"/user/getpassword"];
    
    [self getResponseDataWithDic:info andUrlString:urlString];
}

- (void)loginOut:(NSString *)u{
    NSDictionary *info = [NSDictionary dictionaryWithObjectsAndKeys:u,@"u",nil];
    NSString *urlString = [RbtCommonTool getServerUrl];
    urlString = [urlString stringByAppendingString:@"/user/logout"];
    
    [self getResponseDataWithDic:info andUrlString:urlString];
}

- (void)updatepassword:(NSString *)u withOldPassword:(NSString *)p andNewPasswork:(NSString *)np{
    p = [p md5];
    np = [np md5];
    NSDictionary *info = [NSDictionary dictionaryWithObjectsAndKeys:u,@"u",p,@"p",np,@"np",nil];
    NSString *urlString = [RbtCommonTool getServerUrl];
    urlString = [urlString stringByAppendingString:@"/user/updatepassword"];
    
    [self getResponseDataWithDic:info andUrlString:urlString];
}

- (void)getannouncement:(NSString *)u{
    NSDictionary *info = [NSDictionary dictionaryWithObjectsAndKeys:u,@"u",nil];
    NSString *urlString = [RbtCommonTool getServerUrl];
    urlString = [urlString stringByAppendingString:@"/system/getannouncement"];
    
    [self getResponseDataWithDic:info andUrlString:urlString];
}

-(void)getNewWeatherWithLocation:(NSString *)location
{
    NSDictionary *info = [NSDictionary dictionaryWithObjectsAndKeys:location,@"location",nil];
    NSString *urlString = [RbtCommonTool getServerUrl];
    urlString = [urlString stringByAppendingString:@"/weather"];
    [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"isGetWeather"];
    [self getResponseDataWithDic:info andUrlString:urlString];
}


- (void)getpublicprojectWithUser:(NSString *)userName andH:(NSString *)h{}

- (void)getMyProjectWithUser:(NSString *)userName andH:(NSString *)h{}

- (void)getLiXianProject{}

- (void)getProjectInfo:(NSString *)pid{}

- (void)getrunprincipleWithP:(NSString *)p{}

- (void)getgetpermissionWithU:(NSString *)u andP:(NSString *)p{}
- (void)getcontrolmodeandstatusWithU:(NSString *)u andP:(NSString *)p{}
- (void)controlWithU:(NSString *)u withP:(NSString *)p andC:(NSString *)c{}
- (void)getJieNengInfoWithU:(NSString *)u withP:(NSString *)p andT:(NSString *)t{}
- (void)commitquestion:(NSString *)u withP:(NSString *)p WithQ:(NSString *)q AndI:(NSString *)i{}
- (void)getquestionWith:(NSString *)u{}
- (void)gethisdataitemvalue:(NSString *)p withD:(NSString *)d andT:(NSString *)t{}
- (NSString *)getCityWeatherid:(NSString *)sqlString{return nil;}

-(void)getTheDayWeather{
    NSString *str =  @"{\"weatherinfo\":{\"city\":\"连云港\",\"city_en\":\"lianyungang\",\"date_y\":\"2013年12月15日\",\"date\":\"\",\"week\":\"星期日\",\"fchh\":\"08\",\"cityid\":\"101191001\",\"temp1\":\"9℃~2℃\",\"temp2\":\"8℃~-1℃\",\"temp3\":\"7℃~-3℃\",\"temp4\":\"6℃~-4℃\",\"temp5\":\"5℃~-4℃\",\"temp6\":\"6℃~-4℃\",\"tempF1\":\"48.2℉~35.6℉\",\"tempF2\":\"46.4℉~30.2℉\",\"tempF3\":\"44.6℉~26.6℉\",\"tempF4\":\"42.8℉~24.8℉\",\"tempF5\":\"41℉~24.8℉\",\"tempF6\":\"42.8℉~24.8℉\",\"weather1\":\"晴转多云\",\"weather2\":\"多云转小雨\",\"weather3\":\"阴转多云\",\"weather4\":\"多云转晴\",\"weather5\":\"多云转晴\",\"weather6\":\"多云转晴\"}}";
    NSData *data = [str dataUsingEncoding:NSUTF8StringEncoding];
    NSDictionary *dicweather = [data objectFromJSONData];
    [self.delegate onDataLoadWithService:self andResponse:dicweather];
}

-(void)getXiTongGongGaoWithLocationImageNameArray:(NSDictionary *)imageDic
{
    NSString *urlString = [RbtCommonTool getServerUrl];
    urlString = [urlString stringByAppendingString:@"/system/getversion"];
    
    [self getResponseDataWithDic:imageDic andUrlString:urlString];
}

@end
