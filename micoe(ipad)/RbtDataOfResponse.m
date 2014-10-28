//
//  RbtDataOfResponse.m
//  RedBudTek
//
//  Created by Simon on 13-12-6.
//  Copyright (c) 2013年 redbudtek. All rights reserved.
//

#import "RbtDataOfResponse.h"

@implementation RbtDataOfResponse

@synthesize jienengDic, yuanlituDic, lishishujuGongChengLieBiaoDic, lishishujuSheBeiShuJuDic;

@synthesize num_T1_S, num_T2_S, num_W1_S, num_W2_S;

+ (RbtDataOfResponse *)sharedInstance{
    static RbtDataOfResponse* sharedInstance;
    static dispatch_once_t onceToken;
    dispatch_once(
                  &onceToken, ^{
                      sharedInstance = [[RbtDataOfResponse alloc] init];
                  });
    return sharedInstance;
}

@end
