//
//  RbtYuanChengSelectView.h
//  RedBudTek
//
//  Created by 黄川 on 13-12-9.
//  Copyright (c) 2013年 redbudtek. All rights reserved.
//

#import <UIKit/UIKit.h>
@class RbtYuanChengSelectView;

@protocol RbtYuanChengSelectViewDelegate <NSObject>
- (void)buttonAcitons: (NSInteger) thebutton andView:(RbtYuanChengSelectView *)theView;
@end

@interface RbtYuanChengSelectView : UIView
{
    UIButton *btn1;
    UIButton *btn2;
    UIButton *btn3;
    
}

@property (nonatomic,strong) NSString *name;
@property (nonatomic,assign) id<RbtYuanChengSelectViewDelegate> delegate;
@property (nonatomic,assign) int preTag;

- (id)initWithFrame:(CGRect)frame withImages:(NSArray *)imageArray andParam:(NSArray *)paramArray;
- (void)setSelectBtn:(NSInteger) btnTag;
@end
