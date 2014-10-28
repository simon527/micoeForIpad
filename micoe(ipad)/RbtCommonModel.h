//
//  RbtCommonModel.h
//  RedBudTek
//
//  Created by 黄川 on 13-11-15.
//  Copyright (c) 2013年 redbudtek. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RbtCommonModel : NSObject

@property(strong,nonatomic) NSMutableArray *arr_publicProject;
@property(strong,nonatomic) NSMutableArray *arr_myProject;
@property(strong,nonatomic) NSMutableArray *arr_liXianProject;

+ (RbtCommonModel *)sharedInstance;

@end
