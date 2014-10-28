//
//  RbtUserModel.h
//  RedBudTek
//
//  Created by 黄川 on 13-11-14.
//  Copyright (c) 2013年 redbudtek. All rights reserved.
//

//1.	返回值：0: 失败；1：成功；
//2.	描述：如果失败，返回原因
//3.	用户类型，
//4.	上次登录时间
//5.	用户可以查看的模块

#import "RbtBaseModel.h"

@interface RbtUserModel : RbtBaseModel

@property(copy,nonatomic) NSString *userName;
@property(copy,nonatomic) NSString *ut;
@property(copy,nonatomic) NSString *lt;
@property(copy,nonatomic) NSString *rt;
@property(copy,nonatomic) NSString *yxyl;
@property(copy,nonatomic) NSString *jnst;
@property(copy,nonatomic) NSString *lssj;
@property(copy,nonatomic) NSString *sssj;
@property(copy,nonatomic) NSString *gisdw;
@property(copy,nonatomic) NSString *wtfk;

+ (RbtUserModel *)sharedInstance;

@end
