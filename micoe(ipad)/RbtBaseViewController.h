//
//  RbtBaseViewController.h
//  RedBudTek
//
//  Created by 黄川 on 13-11-14.
//  Copyright (c) 2013年 redbudtek. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RbtBaseViewController : UIViewController<MBProgressHUDDelegate,RbtWebManagerDelegate>

@property(strong,nonatomic) MBProgressHUD *hud1;

- (UIViewController*)viewController;

//- (void)back;
@end
