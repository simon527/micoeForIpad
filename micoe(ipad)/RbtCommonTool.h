//
//  RbtCommonTool.h
//  RedBudTek
//
//  Created by 黄川 on 13-11-13.
//  Copyright (c) 2013年 redbudtek. All rights reserved.
//

#import <Foundation/Foundation.h>

#define kServerSettingFilename @"ServerSetting"
#define kServerSettingFilenameQuan @"ServerSetting.plist"
#define kLoginFilename @"Login.plist"
#define kLiuLanFilename @"LiuLan.db"
#define kProvincesAndCities @"ProvincesAndCities"
#define kProvincesAndCitiesQuan @"ProvincesAndCities.plist"

typedef enum JinRu{WoDeGongCheng = 1,LiXianGongCheng,GongGGC}JinRu;

@interface RbtCommonTool : NSObject

+ (BOOL)isConnectOK;

+ (void)showInfoAlert:(NSString *)msg;

+ (NSString *)getDocumentsDirectory;
+ (NSString*) documentPath: (NSString*) fileName;

+ (NSString *)loginFilePath;
+ (NSArray *)getLogin;
+ (void)setLogin:(NSArray *)array;

+ (NSString *)liuLanFilePath;

+ (void) setJinRuMode:(JinRu )param;
+ (JinRu)getJinRuMode;

+ (NSString *)serverSettingBundleFilePath;
+ (NSString *)serverSettingFilePath;
+ (NSArray *)getServerSetting;
+ (void)setServerSetting:(NSArray *)array;
+ (NSString *)getServerUrl;

+ (NSString *)provincesAndCitiesBundleFilePath;
+ (NSString *)provincesAndCitiesFilePath;
+ (NSArray *)getProvincesAndCities;
+ (void)setProvincesAndCities:(NSArray *)array;

@end
