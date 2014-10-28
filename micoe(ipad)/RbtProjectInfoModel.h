//
//  RbtProjectInfoModel.h
//  RedBudTek
//
//  Created by 黄川 on 13-11-21.
//  Copyright (c) 2013年 redbudtek. All rights reserved.
//

//n 项目名称, i 项目介绍, w 设计用水量, c 甲方单位, t甲方联系人, p 联系电话, ct 竣工时间

#import "RbtBaseModel.h"

@interface RbtProjectInfoModel : RbtBaseModel

@property(copy,nonatomic) NSString *pid;

@property(copy,nonatomic) NSString *n;
@property(copy,nonatomic) NSString *i;
@property(copy,nonatomic) NSString *w;
@property(copy,nonatomic) NSString *c;
@property(copy,nonatomic) NSString *t;
@property(copy,nonatomic) NSString *p;
@property(copy,nonatomic) NSString *ct;

+ (RbtProjectInfoModel *)sharedInstance;

@end
