//
//  micWDGCView.m
//  micoe(ipad)
//
//  Created by Simon on 14-1-20.
//  Copyright (c) 2014年 Simon. All rights reserved.
//

#import "micWDGCView.h"

@implementation micWDGCView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        UIWindow *window = [[UIApplication sharedApplication].delegate window];
        self.hud1 = [[MBProgressHUD alloc] initWithWindow:window];
        self.hud1.delegate =self;
        [window addSubview:self.hud1];
    }
    return self;
}

- (void)onDataLoadWithService:(RbtWebManager *)webService
                  andResponse:(NSDictionary *)responseDic{
    [self.hud1 hide:YES];
}

- (void)webServicefailed:(RbtWebManager *) webService{
    [self.hud1 hide:YES];
}

- (UIViewController*)viewController {
    for (UIView* next = [self superview]; next; next = next.superview) {
        UIResponder* nextResponder = [next nextResponder];
        if ([nextResponder isKindOfClass:[UIViewController class]]) {
            return (UIViewController*)nextResponder;
        }
    }
    return nil;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
