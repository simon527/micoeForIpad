//
//  RbtOfflineManager.h
//  RedBudTek
//
//  Created by 黄川 on 13-11-10.
//  Copyright (c) 2013年 redbudtek. All rights reserved.
//

#import "RbtWebManager.h"
#import "FMDatabase.h"
#import "FMDatabaseAdditions.h"

@interface RbtOfflineManager : RbtWebManager

- (NSString *)getCityWeatherid:(NSString *)sqlString;

@end
