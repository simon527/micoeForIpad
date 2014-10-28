//
//  RbtYuanChengSelectView2_h.h
//  micoe(ipad)
//
//  Created by 黄川 on 14-2-8.
//  Copyright (c) 2014年 Simon. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RbtYuanChengSelectView2_h;

@protocol RbtYuanChengSelectViewDelegate2 <NSObject>
- (void)buttonAcitons: (NSInteger) thebutton andView:(RbtYuanChengSelectView2_h *)theView;
@end

@interface RbtYuanChengSelectView2_h : UIView
{
    UIButton *btn1;
    UIButton *btn2;
    UIButton *btn3;
    
    int showButtonTag;
    
}

@property (nonatomic,strong) NSString *name;
@property (nonatomic,assign) id<RbtYuanChengSelectViewDelegate2> delegate;
@property (nonatomic,assign) int preTag;

- (id)initWithFrame:(CGRect)frame withImages:(NSArray *)imageArray andParam:(NSArray *)paramArray;
- (void)setSelectBtn:(NSInteger) btnTag;

@end
