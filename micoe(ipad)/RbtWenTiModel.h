//
//  RbtWenTiModel.h
//  RedBudTek
//
//  Created by 黄川 on 13-12-4.
//  Copyright (c) 2013年 redbudtek. All rights reserved.
//
//图片以base64编码返回 , n 问题所在项目名称, q 问题描述, i 问题图片,t 反馈时间,
//r 问题是否解决 1为解决0 为未解决, p 解决人, m 解决方法
#import "RbtBaseModel.h"

@interface RbtWenTiModel : RbtBaseModel

@property (copy,nonatomic) NSString *n;
@property (copy,nonatomic) NSString *q;
@property (copy,nonatomic) NSString *i;
@property (copy,nonatomic) NSString *t;
@property (copy,nonatomic) NSString *r;
@property (copy,nonatomic) NSString *p;
@property (copy,nonatomic) NSString *m;

@end
