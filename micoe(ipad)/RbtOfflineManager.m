//
//  RbtOfflineManager.m
//  RedBudTek
//
//  Created by 黄川 on 13-11-10.
//  Copyright (c) 2013年 redbudtek. All rights reserved.
//

#import "RbtOfflineManager.h"
#import "RbtProjectInfoModel.h"

#import <sqlite3.h>

#define DBFILENAME @"tyy"

static FMDatabase *fmDB;
@implementation RbtOfflineManager

- (void)openDataBase{
    NSString* database_path=[[NSBundle mainBundle] pathForResource:DBFILENAME ofType:@"sqlite"];
    fmDB = [FMDatabase databaseWithPath:database_path];
    [fmDB open];
}

- (void)getLiXianProject{
    [self openDataBase];

    if (![fmDB tableExists:@"project"]) {
        NSLog(@"no table");
    }
    FMResultSet *resultSetDishTypes = [fmDB executeQuery:@"select * from project"];
    NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
    NSMutableArray *arr_p = [[NSMutableArray alloc] init];
    while ([resultSetDishTypes next]) {
        RbtProjectModel *oneProject = [[RbtProjectModel alloc] init];
        oneProject.projectid = [resultSetDishTypes stringForColumn:@"pid"];
        oneProject.leixing = [resultSetDishTypes stringForColumn:@"ct"];
        oneProject.name = [resultSetDishTypes stringForColumn:@"n"];
        oneProject.city = [resultSetDishTypes stringForColumn:@"a"];
        oneProject.citycode = [resultSetDishTypes stringForColumn:@"c"];
        oneProject.longitude = [resultSetDishTypes stringForColumn:@"longitude"];
        oneProject.latitude = [resultSetDishTypes stringForColumn:@"latitude"];
        [arr_p addObject:oneProject];
    }
    [dic  setObject:arr_p forKey:@"arr"];
    [fmDB close];
    [self.delegate onDataLoadWithService:self andResponse:dic];
}

- (void)getProjectInfo:(NSString *)pid{
    [self openDataBase];
    
    if (![fmDB tableExists:@"projectInfo"]) {
        NSLog(@"no table");
    }
    FMResultSet *resultSetDishTypes = [fmDB executeQuery:@"select * from projectInfo"];
    NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
    NSMutableArray *arr_p = [[NSMutableArray alloc] init];
    while ([resultSetDishTypes next]) {
        [RbtProjectInfoModel sharedInstance].pid = [resultSetDishTypes stringForColumn:@"pid"];
        [RbtProjectInfoModel sharedInstance].n = [resultSetDishTypes stringForColumn:@"n"];
        [RbtProjectInfoModel sharedInstance].i = [resultSetDishTypes stringForColumn:@"i"];
        [RbtProjectInfoModel sharedInstance].w = [resultSetDishTypes stringForColumn:@"w"];
        [RbtProjectInfoModel sharedInstance].c = [resultSetDishTypes stringForColumn:@"c"];
        [RbtProjectInfoModel sharedInstance].t = [resultSetDishTypes stringForColumn:@"t"];
        [RbtProjectInfoModel sharedInstance].p = [resultSetDishTypes stringForColumn:@"p"];
        [RbtProjectInfoModel sharedInstance].ct = [resultSetDishTypes stringForColumn:@"ct"];
        [arr_p addObject:arr_p];
    }
    [dic  setObject:arr_p forKey:@"arr"];
    [fmDB close];
    [self.delegate onDataLoadWithService:self andResponse:dic];
}

- (void)getJieNengInfoWithU:(NSString *)u withP:(NSString *)p andT:(NSString *)t{
    [self openDataBase];
    
    if (![fmDB tableExists:@"jieNeng"]) {
        NSLog(@"no table");
    }
    NSString *sqlString = [NSString stringWithFormat:@"select * from jieNeng where pid = %@ and t = %@",p,t];
    FMResultSet *resultSetDishTypes = [fmDB executeQuery:sqlString];
    NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
    while ([resultSetDishTypes next]) {
        [dic setObject:[resultSetDishTypes stringForColumn:@"sp"] forKey:@"sp"];
        [dic setObject:[resultSetDishTypes stringForColumn:@"sc"] forKey:@"sc"];
        [dic setObject:[resultSetDishTypes stringForColumn:@"sco"] forKey:@"sco"];
    }
    [fmDB close];
    [self.delegate onDataLoadWithService:self andResponse:dic];
}

- (NSString *)getCityWeatherid:(NSString *)sqlString{
    NSString *weatherid;
    [self openDataBase];
    
    if (![fmDB tableExists:@"city_table"]) {
        NSLog(@"no table");
    }
    FMResultSet *resultSetDishTypes = [fmDB executeQuery:sqlString];
    
    if ([resultSetDishTypes next]) {
        weatherid = [resultSetDishTypes stringForColumn:@"WEATHER_ID"];
    }
    [fmDB close];
    return weatherid;
}

- (void)getrunprincipleWithP:(NSString *)p{
    [self openDataBase];
    
    if (![fmDB tableExists:@"runprinciple"]) {
        NSLog(@"no table");
    }
    NSString *sqlString = [NSString stringWithFormat:@"select * from runprinciple"];
    FMResultSet *resultSetDishTypes = [fmDB executeQuery:sqlString];
    NSMutableArray *arr = [[NSMutableArray alloc] init];
    while ([resultSetDishTypes next]) {
        NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
        [dic setObject:[resultSetDishTypes stringForColumn:@"n"] forKey:@"n"];
        [dic setObject:[resultSetDishTypes stringForColumn:@"t"] forKey:@"t"];
        [dic setObject:[resultSetDishTypes stringForColumn:@"s"] forKey:@"s"];
        [dic setObject:[resultSetDishTypes stringForColumn:@"v"] forKey:@"v"];
        [arr addObject:dic];
    }
    [fmDB close];
    NSDictionary *dics = [NSDictionary dictionaryWithObjectsAndKeys:@"M903-I",@"t", arr,@"d", nil];
    [self.delegate onDataLoadWithService:self andResponse:dics];
}

- (void)getcontrolmodeandstatusWithU:(NSString *)u andP:(NSString *)p{
    [self openDataBase];
    
    if (![fmDB tableExists:@"controlmodeandstatus"]) {
        NSLog(@"no table");
    }
    NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
    NSString *sqlString = [NSString stringWithFormat:@"select * from controlmodeandstatus"];
    FMResultSet *resultSetDishTypes = [fmDB executeQuery:sqlString];
    while ([resultSetDishTypes next]) {
        [dic setObject:[resultSetDishTypes stringForColumn:@"c"] forKey:@"c"];
        
        NSMutableDictionary *dic_w = [[NSMutableDictionary alloc] init];
        [dic_w setObject:[resultSetDishTypes stringForColumn:@"ws"] forKey:@"s"];
        [dic setObject:dic_w forKey:@"w"];
        
        NSMutableDictionary *dic_h = [[NSMutableDictionary alloc] init];
        [dic_h setObject:[resultSetDishTypes stringForColumn:@"hs"] forKey:@"s"];
        [dic setObject:dic_h forKey:@"h"];
    }
    
    if (![fmDB tableExists:@"controlmodeandstatusFord"]) {
        NSLog(@"no table");
    }
    NSString *sqlString2 = [NSString stringWithFormat:@"select * from controlmodeandstatusFord"];
    FMResultSet *resultSetDishTypes2 = [fmDB executeQuery:sqlString2];
    NSMutableArray *arr = [[NSMutableArray alloc] init];
    while ([resultSetDishTypes2 next]) {
        NSMutableDictionary *dic2 = [[NSMutableDictionary alloc] init];
        [dic2 setObject:[resultSetDishTypes2 stringForColumn:@"n"] forKey:@"n"];
        [dic2 setObject:[resultSetDishTypes2 stringForColumn:@"s"] forKey:@"s"];
        [arr addObject:dic2];
    }
    [dic setObject:arr forKey:@"d"];
    [fmDB close];
    [self.delegate onDataLoadWithService:self andResponse:dic];
}

- (void)gethisdataitemvalue:(NSString *)p withD:(NSString *)d andT:(NSString *)t{
    [self openDataBase];
    
    if (![fmDB tableExists:@"history"]) {
        NSLog(@"no table");
    }
    NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
    NSString *sqlString = [NSString stringWithFormat:@"select * from history"];
    FMResultSet *resultSetDishTypes = [fmDB executeQuery:sqlString];
    NSMutableArray *arr_v = [[NSMutableArray alloc] init];
    while ([resultSetDishTypes next]) {
        NSMutableArray *arr = [[NSMutableArray alloc] init];
        [arr addObject:[resultSetDishTypes stringForColumn:@"v1"]];
        [arr addObject:[resultSetDishTypes stringForColumn:@"v2"]];
        [arr_v addObject:arr];
    }
    [dic setObject:arr_v forKey:@"v"];
    
    NSMutableDictionary *dic_rt = [[NSMutableDictionary alloc] init];
    NSString *dstring =@"T2_S";
    [dic_rt setObject:dstring forKey:@"d"];
    [dic_rt setObject:dic forKey:@"v"];
    
    [fmDB close];
    [self.delegate onDataLoadWithService:self andResponse:dic];
}

@end
