//
//  micxiugaimimaView.h
//  micoe(ipad)
//
//  Created by Simon on 14-1-20.
//  Copyright (c) 2014年 Simon. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "micWDGCView.h"

@protocol micxiugaimimaViewDelegate <NSObject>

-(void)fanhui;

@end

@interface micxiugaimimaView : micWDGCView
{
    UITextField *opw;
    UITextField *npw;
    UITextField *cpw;
}

@property (assign, nonatomic) id <micxiugaimimaViewDelegate>delegeta;

@end
