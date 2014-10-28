//
//  micTabbarView.h
//  micoe(ipad)
//
//  Created by Simon_Tang on 14-4-18.
//  Copyright (c) 2014年 Simon. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface micTabbarView : UIView{
    UIButton *btn_wodegongcheng;
    UIButton *btn_wentifankui;
    UIButton *btn_sijimuge;
    UIButton *btn_shezhi;
    
    
    int showViewTag;
}


- (void)setSelectBtn:(NSInteger) btnTag;


@end
