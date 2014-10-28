//
//  micTopTabbarData.h
//  micoe(ipad)
//
//  Created by Simon_Tang on 14-4-16.
//  Copyright (c) 2014年 Simon. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface micTopTabbarData : NSObject

@property (assign, nonatomic) float imageHeight;

@property (assign, nonatomic) float imageGap;

@property (strong, nonatomic) NSArray *itemsArray;

@property (assign, nonatomic) NSInteger selectIndex;

+(micTopTabbarData *)shareInstance;

@end
