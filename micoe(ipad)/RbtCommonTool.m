//
//  RbtCommonTool.m
//  RedBudTek
//
//  Created by 黄川 on 13-11-13.
//  Copyright (c) 2013年 redbudtek. All rights reserved.
//

#import "RbtCommonTool.h"
#import "Reachability.h"

static NSString *SERVER;
static NSString *PORT;

@implementation RbtCommonTool

static JinRu jinRuMode;
+ (BOOL)isConnectOK{
    BOOL result = NO;
    Reachability *wifiReach = [Reachability reachabilityForLocalWiFi];
	[wifiReach startNotifier];
    NetworkStatus netStatus = [wifiReach currentReachabilityStatus];
    BOOL connectionRequired= [wifiReach connectionRequired];
    switch (netStatus)
    {
        case NotReachable:
        {
            connectionRequired= NO;
            result = NO;
            break;
        }
            
        case ReachableViaWWAN:
        {
            result = NO;
            break;
        }
        case ReachableViaWiFi:
        {
            result = YES;
            break;
        }
    }
    return result;
}

#pragma mark- showAlert view methods
+ (void)showInfoAlert:(NSString *)msg{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:msg delegate:nil cancelButtonTitle:@"确认" otherButtonTitles: nil];
    [alert show];
}

#pragma DocumentPath methods
+ (NSString *)getDocumentsDirectory{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    return documentsDirectory;
}

+ (NSString*) documentPath: (NSString*) fileName
{
	if(fileName == nil)
		return nil;
	NSArray* paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
	NSString* documentsDirectory = [paths objectAtIndex: 0];
	NSString* documentsPath = [documentsDirectory stringByAppendingPathComponent: fileName];
	
	return documentsPath;
}

#pragma mark- Login Methods
+ (NSString *)loginFilePath{
    NSString *documentsDirectory = [self getDocumentsDirectory];
    return [documentsDirectory stringByAppendingPathComponent:kLoginFilename];
}

+ (NSArray *)getLogin{
    NSString *filePaths = [self loginFilePath];
    if([[NSFileManager defaultManager] fileExistsAtPath:filePaths]){
        NSArray *array = [[NSArray alloc] initWithContentsOfFile:filePaths];
        return array;
    }
    else{
        return nil;
    }
}

+ (void)setLogin:(NSArray *)array{
    NSString *filePaths = [self loginFilePath];
    [array writeToFile:filePaths atomically:YES];
}

+ (NSString *)liuLanFilePath{
    NSString *documentsDirectory = [self getDocumentsDirectory];
    NSString *fileString =[documentsDirectory stringByAppendingPathComponent:[RbtUserModel sharedInstance].userName];
    return fileString;
}

+ (void) setJinRuMode:(JinRu )param{
     jinRuMode = param;
}

+ (JinRu)getJinRuMode{
    return jinRuMode;
}

#pragma mark- ServerSetting Methods
+ (NSString *)serverSettingBundleFilePath{
    return [[NSBundle mainBundle] pathForResource:kServerSettingFilename ofType:@"plist"];
}

+ (NSString *)serverSettingFilePath{
    return [self documentPath:kServerSettingFilenameQuan];
}

+ (NSArray *)getServerSetting{
    NSString *filePaths = [self serverSettingFilePath];
    if([[NSFileManager defaultManager] fileExistsAtPath:filePaths]){
        NSArray *array = [[NSArray alloc] initWithContentsOfFile:filePaths];
        SERVER = [array objectAtIndex:0];
        PORT = [array objectAtIndex:1];
        return array;
    }
    else{
        NSArray *arr = [[NSArray alloc] initWithObjects:kWebserviceUrl, kWebservicePort, nil];
        return arr;
    }
}

+ (void)setServerSetting:(NSArray *)array{
    NSString *filePaths = [self serverSettingFilePath];
    [array writeToFile:filePaths atomically:YES];
    SERVER = [array objectAtIndex:0];
    PORT = [array objectAtIndex:1];
}

+ (NSString *)getServerUrl{
    NSString *serverUrl;
    if (SERVER) {
        serverUrl = [NSString stringWithFormat:@"http://%@:%@/micoe",SERVER,PORT];
    }
    else{
        NSArray *arr = [self getServerSetting];
        serverUrl = [NSString stringWithFormat:@"http://%@:%@/micoe",[arr objectAtIndex:0],[arr objectAtIndex:1]];
    }
    return serverUrl;
}

#pragma mark- ProvincesAndCities Methods
+ (NSString *)provincesAndCitiesBundleFilePath{
    return [[NSBundle mainBundle] pathForResource:kProvincesAndCities ofType:@"plist"];
}

+ (NSString *)provincesAndCitiesFilePath{
    return [self documentPath:kProvincesAndCitiesQuan];
}

+ (NSArray *)getProvincesAndCities{
    NSString *filePaths = [self provincesAndCitiesFilePath];
    if([[NSFileManager defaultManager] fileExistsAtPath:filePaths]){
        NSArray *array = [[NSArray alloc] initWithContentsOfFile:filePaths];
        return array;
    }
    else{
        return nil;
    }
}

+ (void)setProvincesAndCities:(NSArray *)array{
    NSString *filePaths = [self provincesAndCitiesFilePath];
    [array writeToFile:filePaths atomically:YES];
}

@end
