//
//  RbtWebManager.h
//  RedBudTek
//
//  Created by 黄川 on 13-11-10.
//  Copyright (c) 2013年 redbudtek. All rights reserved.
//

#import <Foundation/Foundation.h>


@class RbtWebManager;
@protocol RbtWebManagerDelegate <NSObject>
- (void)onDataLoadWithService:(RbtWebManager *)webService
                  andResponse:(NSDictionary *)responseDic;

- (void)webServicefailed:(RbtWebManager *)webService;

@end

@interface RbtWebManager : NSObject

@property (nonatomic, assign) id<RbtWebManagerDelegate> delegate;
@property (nonatomic, strong) NSString *name;


+ (RbtWebManager *)getRbtManager:(BOOL)isOnLine;

- (void)getResponseDataWithDic:(NSDictionary *)info andUrlString:(NSString *)urlString;
- (NSDictionary *)jsonDersialized:(NSData *)responseData;


//获取天气接口
- (void)getWeatherInfo:(NSString *)cityCode;
- (void)getWeatherInfoshishi:(NSString *)cityCode;


//百度天气接口
- (void)getWeatherInfowithBaidu:(NSString *)city;

#pragma mark- userhandle
//login
- (void)loginName:(NSString *)userName passWord:(NSString *)passWord;

//loginOut
- (void)loginOut:(NSString *)u;

//忘记密码
- (void)getpassowrd:(NSString *)u;

//修改用户密码
- (void)updatepassword:(NSString *)u withOldPassword:(NSString *)p andNewPasswork:(NSString *)np;

#pragma mark- onLine
//获取公共工程列表
- (void)getpublicprojectWithUser:(NSString *)userName andH:(NSString *)h;

//获取我的工程列表
- (void)getMyProjectWithUser:(NSString *)userName andH:(NSString *)h;

//获取用户相关系统公告
- (void)getannouncement:(NSString *)u;

//获取对热水工程进行远程控制的权限
- (void)getgetpermissionWithU:(NSString *)u andP:(NSString *)p;

//对热水工程进行远程控制。
- (void)controlWithU:(NSString *)u withP:(NSString *)p andC:(NSDictionary *)c;

//获取热水工程节能视图
- (void)getJieNengInfoWithU:(NSString *)u withP:(NSString *)p andT:(NSString *)t;

//查询历史数据
- (void)gethisdataitemvalue:(NSString *)p withD:(NSString *)d andT:(NSString *)t;

//问题反馈
- (void)commitquestion:(NSString *)u withP:(NSString *)p WithQ:(NSString *)q AndI:(NSString *)i;

//获取问题反馈列表
- (void)getquestionWith:(NSString *)u;

#pragma mark- offLine
//获取离线工程
- (void)getLiXianProject;

- (NSString *)getCityWeatherid:(NSString *)sqlString;

#pragma mark- both on and off line
// 获取工程信息
- (void)getProjectInfo:(NSString *)pid;
//获取运行原理图实时数据
- (void)getrunprincipleWithP:(NSString *)p;
//获取热水工程当前远程控制状态
- (void)getcontrolmodeandstatusWithU:(NSString *)u andP:(NSString *)p;

//天气附加
-(void)getTheDayWeather;


-(void)getNewWeatherWithLocation:(NSString *)location;

-(void)getXiTongGongGaoWithLocationImageNameArray:(NSDictionary *)imageDic;

@end
