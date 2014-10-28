//
//  RbtDataOfResponse.h
//  RedBudTek
//
//  Created by Simon on 13-12-6.
//  Copyright (c) 2013年 redbudtek. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RbtDataOfResponse : NSObject

@property (strong, nonatomic) NSDictionary *jienengDic;

@property (strong, nonatomic) NSDictionary *yuanlituDic;

@property (strong, nonatomic) NSDictionary *lishishujuGongChengLieBiaoDic;

@property (strong, nonatomic) NSDictionary *lishishujuSheBeiShuJuDic;

@property (strong, nonatomic) NSString *num_W1_S;

@property (strong, nonatomic) NSString *num_W2_S;

@property (strong, nonatomic) NSString *num_T1_S;

@property (strong, nonatomic) NSString *num_T2_S;

+ (RbtDataOfResponse *)sharedInstance;

@end
