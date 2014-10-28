//
//  RbtCommonModel.m
//  RedBudTek
//
//  Created by 黄川 on 13-11-15.
//  Copyright (c) 2013年 redbudtek. All rights reserved.
//

#import "RbtCommonModel.h"

@implementation RbtCommonModel

+ (RbtCommonModel *)sharedInstance{
    static RbtCommonModel *sharedInstance;
    static dispatch_once_t onceToken;
    dispatch_once(
                  &onceToken, ^{
                      sharedInstance = [[RbtCommonModel alloc] init];
                      sharedInstance.arr_myProject = [[NSMutableArray alloc] init];
                      sharedInstance.arr_publicProject = [[NSMutableArray alloc] init];
                      sharedInstance.arr_liXianProject = [[NSMutableArray alloc] init];
                  });
    return sharedInstance;
}

@end
