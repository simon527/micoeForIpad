//
//  RbtOnlineManager.m
//  RedBudTek
//
//  Created by 黄川 on 13-11-10.
//  Copyright (c) 2013年 redbudtek. All rights reserved.
//

#import "RbtOnlineManager.h"

@implementation RbtOnlineManager

//获取公共工程列表
- (void)getpublicprojectWithUser:(NSString *)userName andH:(NSString *)h
{
    NSDictionary *info = [NSDictionary dictionaryWithObjectsAndKeys:userName,@"u",h,@"h", nil];
    NSString *urlString = [RbtCommonTool getServerUrl];
    urlString = [urlString stringByAppendingString:@"/project/getpublicproject"];
    
    [self getResponseDataWithDic:info andUrlString:urlString];
}

- (void)getMyProjectWithUser:(NSString *)userName andH:(NSString *)h{
    NSDictionary *info = [NSDictionary dictionaryWithObjectsAndKeys:userName,@"u",h,@"h", nil];
    NSString *urlString = [RbtCommonTool getServerUrl];
    urlString = [urlString stringByAppendingString:@"/project/getmyproject"];
    
   [self getResponseDataWithDic:info andUrlString:urlString];
}

- (void)getProjectInfo:(NSString *)pid{
    NSDictionary *info = [NSDictionary dictionaryWithObjectsAndKeys:pid,@"p",nil];
    NSString *urlString = [RbtCommonTool getServerUrl];
    urlString = [urlString stringByAppendingString:@"/project/getprojectinfo"];
    
    [self getResponseDataWithDic:info andUrlString:urlString];
}

- (void)getrunprincipleWithP:(NSString *)p{
    NSDictionary *info = [NSDictionary dictionaryWithObjectsAndKeys:p,@"p",nil];
    NSString *urlString = [RbtCommonTool getServerUrl];
    urlString = [urlString stringByAppendingString:@"/project/getrunprinciple"];
    
    [self getResponseDataWithDic:info andUrlString:urlString];
}

- (void)getgetpermissionWithU:(NSString *)u andP:(NSString *)p{
    NSDictionary *info = [NSDictionary dictionaryWithObjectsAndKeys:u,@"u",p,@"p",nil];
    NSString *urlString = [RbtCommonTool getServerUrl];
    urlString = [urlString stringByAppendingString:@"/remotecontrol/getpermission"];
    
    [self getResponseDataWithDic:info andUrlString:urlString];
}

- (void)getcontrolmodeandstatusWithU:(NSString *)u andP:(NSString *)p{
    NSDictionary *info = [NSDictionary dictionaryWithObjectsAndKeys:u,@"u",p,@"p",nil];
    NSString *urlString = [RbtCommonTool getServerUrl];
    urlString = [urlString stringByAppendingString:@"/remotecontrol/getcontrolmodeandstatus"];
    
    [self getResponseDataWithDic:info andUrlString:urlString];
}

- (void)controlWithU:(NSString *)u withP:(NSString *)p andC:(NSDictionary *)c{
    NSDictionary *info = [NSDictionary dictionaryWithObjectsAndKeys:u,@"u",p,@"p",c,@"c",nil];
    NSString *urlString = [RbtCommonTool getServerUrl];
    urlString = [urlString stringByAppendingString:@"/remotecontrol/control"];
    
    [self getResponseDataWithDic:info andUrlString:urlString];
}

- (void)getJieNengInfoWithU:(NSString *)u withP:(NSString *)p andT:(NSString *)t{
    NSDictionary *info = [NSDictionary dictionaryWithObjectsAndKeys:u,@"u",p,@"p",t,@"t",nil];
    NSString *urlString = [RbtCommonTool getServerUrl];
    urlString = [urlString stringByAppendingString:@"/se/getinfo"];
    
    [self getResponseDataWithDic:info andUrlString:urlString];
}

- (void)commitquestion:(NSString *)u withP:(NSString *)p WithQ:(NSString *)q AndI:(NSString *)i{
    NSDictionary *info = [NSDictionary dictionaryWithObjectsAndKeys:u,@"u",p,@"p",q,@"q",i,@"i",nil];
    NSString *urlString = [RbtCommonTool getServerUrl];
    urlString = [urlString stringByAppendingString:@"/system/commitquestion"];
    
    [self getResponseDataWithDic:info andUrlString:urlString];
}

- (void)getquestionWith:(NSString *)u{
    NSDictionary *info = [NSDictionary dictionaryWithObjectsAndKeys:u,@"u",nil];
    NSString *urlString = [RbtCommonTool getServerUrl];
    urlString = [urlString stringByAppendingString:@"/system/getquestion"];
    
    [self getResponseDataWithDic:info andUrlString:urlString];
}

- (void)gethisdataitemvalue:(NSString *)p withD:(NSString *)d andT:(NSString *)t{
    NSDictionary *info = [NSDictionary dictionaryWithObjectsAndKeys:p,@"p",d,@"d",t,@"t",nil];
    NSString *urlString = [RbtCommonTool getServerUrl];
    urlString = [urlString stringByAppendingString:@"/dataitem/gethisdataitemvalue"];
    
    [self getResponseDataWithDic:info andUrlString:urlString];
}

@end
