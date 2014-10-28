//
//  micWDGCView.h
//  micoe(ipad)
//
//  Created by Simon on 14-1-20.
//  Copyright (c) 2014年 Simon. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RbtWebManager.h"
#import "MBProgressHUD.h"

@interface micWDGCView : UIView<MBProgressHUDDelegate,RbtWebManagerDelegate>

@property(strong,nonatomic) MBProgressHUD *hud1;

- (UIViewController*)viewController;

@end
