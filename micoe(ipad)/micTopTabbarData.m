//
//  micTopTabbarData.m
//  micoe(ipad)
//
//  Created by Simon_Tang on 14-4-16.
//  Copyright (c) 2014年 Simon. All rights reserved.
//

#import "micTopTabbarData.h"

@implementation micTopTabbarData

+(micTopTabbarData *)shareInstance
{
    static micTopTabbarData *sharedSingleton;
    
    @synchronized(self)
    {
        if (!sharedSingleton)
            sharedSingleton = [[micTopTabbarData alloc] init];
        
        return sharedSingleton;
    }
}

@end
