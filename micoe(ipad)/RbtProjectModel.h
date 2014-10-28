//
//  RbtProjectModel.h
//  RedBudTek
//
//  Created by 黄川 on 13-11-15.
//  Copyright (c) 2013年 redbudtek. All rights reserved.
//

#import "RbtBaseModel.h"

@interface RbtProjectModel : RbtBaseModel<NSCoding>

@property (copy,nonatomic) NSString *leixing;
@property (copy,nonatomic) NSString *name;
@property (copy,nonatomic) NSString *projectid;
@property (copy,nonatomic) NSString *city;
@property (copy,nonatomic) NSString *citycode;
@property (copy,nonatomic) NSString *longitude;
@property (copy,nonatomic) NSString *latitude;

+ (RbtProjectModel *)sharedInstance;

@end
