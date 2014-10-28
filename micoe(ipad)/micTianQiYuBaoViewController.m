//
//  micTianQiYuBaoViewController.m
//  micoe(ipad)
//
//  Created by Simon on 14-1-20.
//  Copyright (c) 2014年 Simon. All rights reserved.
//

#import "micTianQiYuBaoViewController.h"

@interface micTianQiYuBaoViewController ()
{
    NSString *cityId;
    NSString *cityShishiTem;
    
    UIImageView *titleImgv;
    UIImageView *xiaImageView;
    UILabel *lab_city;
    UILabel *lab_temp;
    UILabel *lab_date;
    
    UIImageView *imageV_w;
    UILabel *lab_w ;
    UIScrollView *scrollVc;
    UIImageView *imgv_wltqbg;
    UIImageView *imv_xiabiao;
    
    UIInterfaceOrientation or;
}

@end

@implementation micTianQiYuBaoViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void)postData
{
    [self.hud1 show:YES];
    RbtWebManager *tqybweb = [[RbtWebManager alloc] init];
    tqybweb.name = @"tqybweb";
    tqybweb.delegate =self;
//    [tqybweb getWeatherInfo:[RbtProjectModel sharedInstance].citycode];
    [tqybweb getNewWeatherWithLocation:[RbtProjectModel sharedInstance].citycode];
    NSLog(@"--%@", [RbtProjectModel sharedInstance].citycode);
    cityId = [RbtProjectModel sharedInstance].citycode;
    
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = NO;
    [self setItemsFrame:self.interfaceOrientation];
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    if (self.isShouYe) {
        [self getCityCode];
    }
    else
    {
        
        
    }
}

- (void)getCityCode{
    
    
    
    if ([CLLocationManager locationServicesEnabled]) {
        [self.hud1 show:YES];
        locationManager = [[CLLocationManager alloc] init];
        locationManager.delegate=self;
        locationManager.desiredAccuracy=kCLLocationAccuracyBest;
        locationManager.distanceFilter=1000.0f;
        if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0) {
            [locationManager requestAlwaysAuthorization];
        }
        
        [locationManager startUpdatingLocation];
    }
    else{
        [RbtCommonTool showInfoAlert:@"未开启定位服务，请到设置-> 隐私-> 定位服务中开启"];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.isFirstJia = YES;
    _isShouYe = YES;
    self.title = @"天气预报";
    imgv = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"tq_jzsb"]];
    imgv.frame = CGRectMake(768, (1024-320)/2+32, 768, 768);
    imgv.hidden = YES;
    [self.view addSubview:imgv];
    
}

- (void)initViews{
    self.isFirstJia = NO;
    imgv.hidden = YES;
    self.weatherInfo  = [self.weatherInfo objectForKey:@"weatherinfo"];
    NSLog(@"ww= %@", self.weatherInfo);
    
    NSString *weather1 = [self getWeatherInfo:[self.weatherInfo objectForKey:@"weather1"]];
    
//    NSString *temp1 = [self.weatherInfo objectForKey:@"temp1"];
    NSString *temp1 = [NSString stringWithFormat:@"%@℃",cityShishiTem];
//    NSString *temp1 = cityShishiTem;
    
    UIImage *imagev = [UIImage imageNamed:[NSString stringWithFormat:@"tq_%@_big",weather1]];
    if (!imagev) {
        imagev = [UIImage imageNamed:[NSString stringWithFormat:@"tq_xiaoxue_big"]];
    }
    titleImgv = [[UIImageView alloc] initWithImage:imagev];
//    titleImgv.frame = CGRectMake(0, 64, ww, 415);
    [self.view addSubview:titleImgv];
    
    xiaImageView = [[UIImageView alloc] init];
    [xiaImageView setImage:[UIImage imageNamed:@"tq_xiabiao"]];
    [self.view addSubview:xiaImageView];
    
    lab_city = [[UILabel alloc] init];
    lab_city.font = [UIFont fontWithName:kFontName size:22];
    lab_city.textAlignment = NSTextAlignmentLeft;
    lab_city.textColor = [UIColor whiteColor];
    NSString *weather_h = [self.weatherInfo objectForKey:@"weather1"];
    lab_city.text = [NSString stringWithFormat:@"%@|%@", [self.weatherInfo objectForKey:@"city"], weather_h];
    //    lab_city.backgroundColor = [UIColor blueColor];
    [self.view addSubview:lab_city];
    
    lab_temp = [[UILabel alloc] init];
    lab_temp.font = [UIFont fontWithName:@"Helvetica" size:45];
    lab_temp.textAlignment = NSTextAlignmentLeft;
    lab_temp.textColor = [UIColor whiteColor];
    lab_temp.text = temp1;
    //    lab_city.backgroundColor = [UIColor blueColor];
    [self.view addSubview:lab_temp];
    
    lab_date = [[UILabel alloc] init];
    lab_date.font = [UIFont fontWithName:@"Helvetica" size:18];
    lab_date.textAlignment = NSTextAlignmentLeft;
    lab_date.textColor = [UIColor whiteColor];
    lab_date.text = [(NSString *)[self.weatherInfo objectForKey:@"date_y"] stringByAppendingString:[NSString stringWithFormat:@" ｜ %@",[self.weatherInfo objectForKey:@"week"]]];
    //    lab_city.backgroundColor = [UIColor blueColor];
    [self.view addSubview:lab_date];
    

    
    NSArray *arr_week = [[NSArray alloc] initWithObjects:@"星期一",@"星期二",@"星期三",@"星期四",@"星期五",@"星期六",@"星期日", nil];
    int int_week = [arr_week indexOfObject:[self.weatherInfo objectForKey:@"week"]];
    
    for (int i = 0; i<6; i++) {
        int m = i/3;
        UIView *biaogeView = [[UIView alloc] initWithFrame:CGRectMake(0+(i%3)*(768/3),  m*xiaImageView.height/2, 768/3, xiaImageView.height/2)];
        [xiaImageView addSubview:biaogeView];
        
        NSDate *date = [NSDate dateWithTimeIntervalSinceNow:i*3600*24];
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"MM月dd日 "];
        NSString *strDate = [dateFormatter stringFromDate:date];
        
        UILabel *lab_week = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, biaogeView.width-20, 40)];
        lab_week.font = [UIFont fontWithName:kFontName size:16];
        lab_week.textAlignment = NSTextAlignmentRight;
        lab_week.textColor = [UIColor blackColor];
        if (int_week>6) {
            int_week = 0;
        }
        lab_week.text = [NSString stringWithFormat:@"%@|%@", strDate, [arr_week objectAtIndex:int_week]];
        int_week = int_week +1;
        //    lab_city.backgroundColor = [UIColor blueColor];
        [biaogeView addSubview:lab_week];
        
        NSString *weather = [self getWeatherInfo:[self.weatherInfo objectForKey:[NSString stringWithFormat:@"weather%d",(i+1)]]];
        UIImageView *imv_ws = [[UIImageView alloc] initWithImage:[UIImage imageNamed:[NSString stringWithFormat:@"tq_%@",weather]]];
//        [imv_ws setSize:CGSizeMake(74, 65)];
        CGPoint ce;
        ce.x = biaogeView.width/2;
        ce.y = biaogeView.height/2-40;
        imv_ws.center = ce;
        [biaogeView addSubview:imv_ws];
        
        UILabel *lab_tem = [[UILabel alloc] init];
        lab_tem.font = [UIFont fontWithName:@"Helvetica" size:24];
        lab_tem.textAlignment = NSTextAlignmentCenter;
        lab_tem.textColor = [UIColor blackColor];
        lab_tem.text =[self.weatherInfo objectForKey:[NSString stringWithFormat:@"temp%d",(i+1)]];
        [lab_tem setSize:CGSizeMake(biaogeView.width, 40)];
        CGPoint ce1;
        ce1.x = ce.x;
        ce1.y = ce.y + 90;
        NSLog(@"xx = %f", ce.x);
        lab_temp.center = ce1;
        [biaogeView addSubview:lab_tem];
        
       imv_xiabiao = [[UIImageView alloc] initWithImage:[UIImage imageNamed:[NSString stringWithFormat:@"tq_%@",self.xiaBiao]]];
        imv_xiabiao.size = CGSizeMake(103, 14);
        CGPoint ce2;
        ce2.x = ce.x;
        ce2.y = ce.y + 50;
        imv_xiabiao.center = ce2;
        [biaogeView addSubview:imv_xiabiao];
    }
}

- (NSString *)getWeatherInfo:(NSString *)weatherString{
    NSString *result = @"yintian";
    if ([weatherString isEqualToString:@"晴"]) {
        result = @"sunny";
        self.xiaBiao = @"hong";
        return result;
    }
    else if([weatherString rangeOfString:@"阴"].length>0){
        result = @"yintian";
        self.xiaBiao = @"lv";
        return result;
    }
    else if([weatherString rangeOfString:@"多云"].length>0){
        result = @"duoyun";
        self.xiaBiao = @"cheng";
        return result;
    }
    else if([weatherString rangeOfString:@"雾"].length>0){
        result = @"wu";
        self.xiaBiao = @"lv";
        return result;
    }
    else if([weatherString rangeOfString:@"雷阵雨"].length>0){
        result = @"leizhenyu";
        self.xiaBiao = @"lv";
        return result;
    }
    else if([weatherString rangeOfString:@"雷"].length>0){
        result = @"lei";
        self.xiaBiao = @"lv";
        return result;
    }
    else if([weatherString rangeOfString:@"大暴雨"].length>0){
        result = @"dabaoyu";
        self.xiaBiao = @"lan";
        return result;
    }
    else if([weatherString rangeOfString:@"暴雨"].length>0){
        result = @"baoyu";
        self.xiaBiao = @"lan";
        return result;
    }
    else if([weatherString rangeOfString:@"大雨"].length>0){
        result = @"dayu";
        self.xiaBiao = @"lan";
        return result;
    }
    else if([weatherString rangeOfString:@"中雨"].length>0){
        result = @"zhongyu";
        self.xiaBiao = @"lan";
        return result;
    }
    else if([weatherString rangeOfString:@"小雨"].length>0){
        result = @"xiaoyu";
        self.xiaBiao = @"lan";
        return result;
    }
    else if([weatherString rangeOfString:@"暴雪"].length>0){
        result = @"baoxue";
        self.xiaBiao = @"lan";
        return result;
    }
    else if([weatherString rangeOfString:@"大雪"].length>0){
        result = @"daxue";
        self.xiaBiao = @"lan";
        return result;
    }
    else if([weatherString rangeOfString:@"中雪"].length>0){
        result = @"zhongxue";
        self.xiaBiao = @"lan";
        return result;
    }
    else if([weatherString rangeOfString:@"小雪"].length>0){
        result = @"xiaoxue";
        self.xiaBiao = @"lan";
        return result;
    }
    else if([weatherString rangeOfString:@"阵雪"].length>0){
        result = @"zhenxue";
        self.xiaBiao = @"lan";
        return result;
    }
    else if([weatherString rangeOfString:@"雨夹雪"].length>0){
        result = @"yujiaxue";
        self.xiaBiao = @"lan";
        return result;
    }
    else if([weatherString rangeOfString:@"沙尘暴"].length>0){
        result = @"shachenbao";
        self.xiaBiao = @"lan";
        return result;
    }
    return result;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark- CLLocationManagerDelegate
-(void)locationManager:(CLLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status
{
    switch (status) {
        case kCLAuthorizationStatusNotDetermined:
            if ([manager respondsToSelector:@selector(requestAlwaysAuthorization)]) {
                [manager requestWhenInUseAuthorization];
            }
            break;
        default:
            break;
    }
}

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations{
    CLLocation *newLocation = [locations lastObject];
    NSLog(@"newLocation  = %@",newLocation);
    RbtWebManager *tqybweb = [[RbtWebManager alloc] init];
    tqybweb.name = @"tqybwebwithBaidu";
    tqybweb.delegate =self;
//    NSString *stringCityLocation = [NSString stringWithFormat:@"%f,%f",newLocation.coordinate.longitude,newLocation.coordinate.latitude];
//    [tqybweb getWeatherInfowithBaidu:stringCityLocation];
//    [tqybweb getWeatherInfowithBaidu:@"无锡"];
    
    
    
    __block NSString *cityName;
    
    // 获取当前所在的城市名
    
    CLGeocoder *geocoder = [[CLGeocoder alloc] init];
    
    //根据经纬度反向地理编译出地址信息
    
    [geocoder reverseGeocodeLocation:newLocation completionHandler:^(NSArray *array, NSError *error)
     
    {
        
        if (array.count > 0)
            
        {
            
            CLPlacemark *placemark = [array objectAtIndex:0];
            
            //将获得的所有信息显示到label上
            
//            NSLog(@"%@",placemark.name);
            NSLog(@"===>%@=======>=====>%@=======》%@=======》%@",placemark.country,placemark.locality,placemark.subLocality,placemark.administrativeArea);
            
            //获取城市
            
            NSString *city = placemark.locality;
            
            if ([city rangeOfString:@"上海"].length != 0) {
                cityName = @"上海";
            }
            else if ([city rangeOfString:@"北京"].length != 0) {
                cityName = @"北京";
            }
            else if ([city rangeOfString:@"天津"].length!= 0) {
                cityName = @"天津";
            }
            else if ([city rangeOfString:@"重庆"].length != 0) {
                cityName = @"重庆";
            }
            else
            {
                NSArray *cityArr = [city componentsSeparatedByString:@"市"];
                cityName = [cityArr objectAtIndex:0];
            }
            
            
//            if (!city) {
//                
//                //四大直辖市的城市信息无法通过locality获得，只能通过获取省份的方法来获得（如果city为空，则可知为直辖市）
//                
//                city = placemark.administrativeArea;
//                
//            }
//            NSArray *cityArr = [city componentsSeparatedByString:@"市"];
//            cityName = [cityArr objectAtIndex:0];
//            cityName = @"无锡";
            NSLog(@"city = %@", cityName);
            [tqybweb getWeatherInfowithBaidu:cityName];
            
        }
        
        else if (error == nil && [array count] == 0)
            
        {
            
            NSLog(@"No results were returned.");
            [self showTheInfo];
            
        }
        
        else if (error != nil)
            
        {
            
            NSLog(@"An error occurred = %@", error);
            [self showTheInfo];
            
        }
        
    }];
    
    [locationManager stopUpdatingLocation];
    
    //系统会一直更新数据，直到选择停止更新，因为我们只需要获得一次经纬度即可，所以获取之后就停止更新
    
    
//    NSString *cityStr = [RbtProjectModel sharedInstance].city;
//    NSString *ccity;
//    NSArray *cityArr = [cityStr componentsSeparatedByString:@","];
//    if (cityArr.count == 1) {
//        ccity = cityStr;
//    }
//    else
//    {
//        ccity = [cityArr objectAtIndex:1];
//    }
//    [tqybweb getWeatherInfowithBaidu:cityName];
    
    
    
     

}

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error{
    NSString *errorString;
    [manager stopUpdatingLocation];
    NSLog(@"Error: %@",[error localizedDescription]);
    switch([error code]) {
        case kCLErrorDenied:
            //Access denied by user
        {
            errorString = @"Access to Location Services denied by user";
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.hud1 hide:YES];
                [RbtCommonTool showInfoAlert:@"未开启本应用的定位服务，请到设置-> 隐私-> 定位服务中开启本应用的定位服务"];
            });
        }
            //Do something...
            break;
        case kCLErrorLocationUnknown:
            //Probably temporary...
            errorString = @"Location data unavailable";
            [self showTheInfo];
            //Do something else...
            break;
        default:
            errorString = @"An unknown error has occurred";
            [self showTheInfo];
            break;
    }
}

- (void)showTheInfo{
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.hud1 hide:YES];
        [RbtCommonTool showInfoAlert:@"无法解析你的地址，请稍后再试"];
    });
}

- (void)initViewswithBaidu{
    
    for (UIView *subView in [self.view subviews]) {
        [subView removeFromSuperview];
    }
    if (!or) {
        or = self.interfaceOrientation;
    }
    
    float ww;
    float hh;
    float dd;
    if (or  == UIInterfaceOrientationLandscapeLeft || or == UIInterfaceOrientationLandscapeRight) {
        ww = 1024;
        hh = 768;
        dd = 0;
    }
    else
    {
        ww = 768;
        hh = 1024;
        dd = 49;
    }
    
//    self.isFirstJia = NO;
    imgv.hidden = YES;
    NSArray *weather_data = [self.weatherInfo objectForKey:@"weather_data"];
    NSDictionary *day1 = [weather_data objectAtIndex:0];
    
    NSString *weather1 = [self getWeatherInfo:[day1 objectForKey:@"weather"]];
    
    NSString *temp1 = [day1 objectForKey:@"temperature"];
    
    UIImage *imagev = [UIImage imageNamed:[NSString stringWithFormat:@"tq_%@_big",weather1]];
    if (!imagev) {
        imagev = [UIImage imageNamed:[NSString stringWithFormat:@"tq_xiaoxue_big"]];
    }
    titleImgv = [[UIImageView alloc] initWithImage:imagev];
    titleImgv.frame = CGRectMake(0, 64, ww, 415);
    [self.view addSubview:titleImgv];
    
    lab_city = [[UILabel alloc] initWithFrame:CGRectMake(ww/2-140, 355, 280, 20)];
    lab_city.font = [UIFont fontWithName:kFontName size:18];
    lab_city.textAlignment = NSTextAlignmentCenter;
    lab_city.textColor = [UIColor whiteColor];
    lab_city.text = [NSString stringWithFormat:@"%@|%@", [self.weatherInfo objectForKey:@"city"], [day1 objectForKey:@"weather"]];
    //    lab_city.backgroundColor = [UIColor blueColor];
    [self.view addSubview:lab_city];
    
    UILabel* lab_d1 = [[UILabel alloc] initWithFrame:CGRectMake(15, 64+15, 280, 40)];
    lab_d1.font = [UIFont fontWithName:kFontName size:18];
    lab_d1.textAlignment = NSTextAlignmentLeft;
    lab_d1.textColor = [UIColor whiteColor];
    lab_d1.text = [NSString stringWithFormat:@"%@|%@", [day1 objectForKey:@"date"], [day1 objectForKey:@"week"]];
    [self.view addSubview:lab_d1];
    
//    UILabel* lab_w1 = [[UILabel alloc] initWithFrame:CGRectMake(15, 355, 80, 20)];
//    lab_w1.font = [UIFont fontWithName:kFontName size:18];
//    lab_w1.textAlignment = NSTextAlignmentRight;
//    lab_w1.textColor = [UIColor whiteColor];
//    lab_w1.text = [self.weatherInfo objectForKey:@"city"];
//    //    lab_city.backgroundColor = [UIColor blueColor];
//    [self.view addSubview:lab_w1];
    
    lab_temp = [[UILabel alloc] initWithFrame:CGRectMake(15, 64+50, 120, 30)];
    lab_temp.font = [UIFont fontWithName:@"Helvetica_Bold" size:18];
    lab_temp.textAlignment = NSTextAlignmentLeft;
    lab_temp.textColor = [UIColor whiteColor];
    lab_temp.text = temp1;
    //    lab_city.backgroundColor = [UIColor blueColor];
    [self.view addSubview:lab_temp];
    
    lab_date = [[UILabel alloc] initWithFrame:CGRectMake(ww-165, 175, 140, 20)];
    lab_date.font = [UIFont fontWithName:@"Helvetica" size:10];
    lab_date.textAlignment = NSTextAlignmentRight;
    lab_date.textColor = [UIColor whiteColor];
    lab_date.text = [(NSString *)[self.weatherInfo objectForKey:@"date"] stringByAppendingString:[NSString stringWithFormat:@" ｜ %@",[day1 objectForKey:@"weather"]]];
    //    lab_city.backgroundColor = [UIColor blueColor];
    [self.view addSubview:lab_date];
    
    imageV_w = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"tq_wbg"]];
    imageV_w.frame = CGRectMake(0, 64+415, ww, 50);
    [self.view addSubview:imageV_w];
    
    lab_w = [[UILabel alloc] initWithFrame:CGRectMake(25, 64+416+15, 300, 20)];
    lab_w.font = [UIFont fontWithName:kFontName size:18];
    lab_w.textAlignment = NSTextAlignmentLeft;
    lab_w.textColor = [UIColor blackColor];
    lab_w.text = @"未来几天天气预报";
    //    lab_city.backgroundColor = [UIColor blueColor];
    [self.view addSubview:lab_w];
    
    
    if (self.isShouYe) {
        scrollVc = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 64+415+50, ww, hh-(64+415+50))];
    }
    else{
        scrollVc = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 64+415+50, ww, hh-(64+415+50)-dd)];
    }
    scrollVc.contentSize = CGSizeMake(ww, 100*weather_data.count);
    [self.view addSubview:scrollVc];
    
    imgv_wltqbg = [[UIImageView alloc] init];
    [imgv_wltqbg setBackgroundColor:[UIColor lightGrayColor]];
    [imgv_wltqbg setAlpha:0.3];
    imgv_wltqbg.frame = CGRectMake(0, 0, ww, 700);
    [scrollVc addSubview:imgv_wltqbg];
    
    NSArray *arr_week = [[NSArray alloc] initWithObjects:@"星期一",@"星期二",@"星期三",@"星期四",@"星期五",@"星期六",@"星期日", nil];
//    NSArray *arr_week2 =[[NSArray alloc] initWithObjects:@"周一",@"周二",@"周三",@"周四",@"周五",@"周六",@"周日", nil];
    NSString *weekString = [day1 objectForKey:@"week"];
//    weekString = [weekString substringToIndex:2];
    int int_week = [arr_week indexOfObject:weekString];
    
    
    for (int i = 0; i<weather_data.count; i++) {
        NSDate *date = [NSDate dateWithTimeIntervalSinceNow:i*3600*24];
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"MM月dd日 "];
        NSString *strDate = [dateFormatter stringFromDate:date];
        
        UILabel *lab_dates = [[UILabel alloc] initWithFrame:CGRectMake(100 , 10+100*i, 80, 20)];
        lab_dates.font = [UIFont fontWithName:kFontName size:18];
        lab_dates.textAlignment = NSTextAlignmentLeft;
        lab_dates.textColor = [UIColor blackColor];
        lab_dates.text =strDate;
        //    lab_city.backgroundColor = [UIColor blueColor];
        [scrollVc addSubview:lab_dates];
        
        UILabel *lab_week = [[UILabel alloc] initWithFrame:CGRectMake(100 , 50+100*i, 80, 20)];
        lab_week.font = [UIFont fontWithName:kFontName size:18];
        lab_week.textAlignment = NSTextAlignmentLeft;
        lab_week.textColor = [UIColor blackColor];
        if (int_week>6) {
            int_week = 0;
        }
        lab_week.text =[arr_week objectAtIndex:int_week];
        int_week = int_week +1;
        //    lab_city.backgroundColor = [UIColor blueColor];
        [scrollVc addSubview:lab_week];
        NSString *weather = [self getWeatherInfo:[self.weatherInfo objectForKey:[NSString stringWithFormat:@"weather%d",(i+1)]]];
        NSDictionary *day =[weather_data objectAtIndex:i];
        weather = [self getWeatherInfo:[day objectForKey:@"weather"]];
        UIImageView *imv_ws = [[UIImageView alloc] initWithImage:[UIImage imageNamed:[NSString stringWithFormat:@"tq_%@",weather]]];
        imv_ws.frame = CGRectMake(250, 20+100*i, 84, 60);
        [scrollVc addSubview:imv_ws];
        
        lab_temp = [[UILabel alloc] initWithFrame:CGRectMake(ww-178-80 , 15+100*i, 160, 20)];
        lab_temp.font = [UIFont fontWithName:@"Helvetica" size:18];
        lab_temp.textAlignment = NSTextAlignmentRight;
        lab_temp.textColor = [UIColor blackColor];
        lab_temp.text =[day objectForKey:@"temperature"];
        //    lab_city.backgroundColor = [UIColor blueColor];
        [scrollVc addSubview:lab_temp];
        
        imv_xiabiao = [[UIImageView alloc] initWithImage:[UIImage imageNamed:[NSString stringWithFormat:@"tq_%@",self.xiaBiao]]];
        imv_xiabiao.frame = CGRectMake(ww-203-80, 52+100*i, 203, 24);
        [scrollVc addSubview:imv_xiabiao];
        
        UIView *aaView = [[UIView alloc] initWithFrame:CGRectMake(0, 100*i+95, scrollVc.width, 5)];
        [aaView setBackgroundColor:[UIColor whiteColor]];
        [scrollVc addSubview:aaView];
    }
}

#pragma mark- request delegate
- (void)onDataLoadWithService:(RbtWebManager *)webService
                  andResponse:(NSDictionary *)responseDic
{
    [super onDataLoadWithService:webService andResponse:responseDic];
    
    if ([webService.name isEqualToString:@"tqybwebwithBaidu"]){
        if ([[responseDic objectForKey:@"status"] integerValue] == 1) {
            self.isShouYe = YES;
            self.weatherInfo = responseDic;
            if (self.isFirstJia) {
                self.isFirstJia = NO;
                [self initViewswithBaidu];
            }
        } else {
            [RbtCommonTool showInfoAlert:[responseDic objectForKey:@"message"]];
        }
    }
    else if ([webService.name isEqualToString:@"tqybweb"]){
        self.isShouYe = YES;
        self.weatherInfo = responseDic;
        RbtWebManager *tqybweb = [[RbtWebManager alloc] init];
        tqybweb.name = @"shishi";
        tqybweb.delegate =self;
        [tqybweb getWeatherInfoshishi:cityId];

    }
    else if([webService.name isEqualToString:@"stringday"]){
        self.weatherInfo = responseDic;
        if (self.isFirstJia) {
            [self initViews];
        }
    }
    else if([webService.name isEqualToString:@"shishi"]){
        
        NSLog(@"res=%@", responseDic);
        cityShishiTem = [[responseDic objectForKey:@"weatherinfo"] objectForKey:@"temp"];
        if (self.isFirstJia) {
            [self initViews];
        }
        NSLog(@"tt=%@", cityShishiTem);
        
        
    }
}

- (void)webServicefailed:(RbtWebManager *) webService{
    [super webServicefailed:webService];
    if ([webService.name isEqualToString:@"tqybweb"]) {
        RbtWebManager *manager = [[RbtWebManager alloc] init];
        manager.name = @"stringday";
        manager.delegate = self;
        [manager getTheDayWeather];
    }
}


-(void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
{
    [super willRotateToInterfaceOrientation:toInterfaceOrientation duration:duration];
    [self setItemsFrame:toInterfaceOrientation];
}


-(void)setItemsFrame:(UIInterfaceOrientation)orientation
{
    if (orientation == UIInterfaceOrientationLandscapeLeft || orientation == UIInterfaceOrientationLandscapeRight)
    {
        
    }
    else
    {
    }
    or = orientation;
    [self initViewswithBaidu];
}

@end
