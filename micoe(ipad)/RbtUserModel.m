//
//  RbtUserModel.m
//  RedBudTek
//
//  Created by 黄川 on 13-11-14.
//  Copyright (c) 2013年 redbudtek. All rights reserved.
//

#import "RbtUserModel.h"

@implementation RbtUserModel

+ (RbtUserModel *)sharedInstance{
    static id sharedInstance;
    static dispatch_once_t onceToken;
    dispatch_once(
                  &onceToken, ^{
                      sharedInstance = [[RbtUserModel alloc] init];
                  });
    return sharedInstance;
}

@end
