//
//  RbtProjectInfoModel.m
//  RedBudTek
//
//  Created by 黄川 on 13-11-21.
//  Copyright (c) 2013年 redbudtek. All rights reserved.
//

#import "RbtProjectInfoModel.h"

@implementation RbtProjectInfoModel

+ (RbtProjectInfoModel *)sharedInstance{
    static RbtProjectInfoModel* sharedInstance;
    static dispatch_once_t onceToken;
    dispatch_once(
                  &onceToken, ^{
                      sharedInstance = [[RbtProjectInfoModel alloc] init];
                  });
    return sharedInstance;
}

@end
