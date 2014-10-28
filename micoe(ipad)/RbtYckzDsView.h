//
//  RbtYckzDsView.h
//  RedBudTek
//
//  Created by 黄川 on 13-12-9.
//  Copyright (c) 2013年 redbudtek. All rights reserved.
//

#import <UIKit/UIKit.h>
@class RbtYckzDsView;

@protocol RbtYckzDsViewDelegate <NSObject>
- (void)dsbuttonTag: (NSInteger)thebutton andView:(RbtYckzDsView *)theView;
@end

@interface RbtYckzDsView : UIView<UITextFieldDelegate>

@property (nonatomic,strong) NSString *name;
@property (nonatomic,assign) id<RbtYckzDsViewDelegate> delegate;


@end
