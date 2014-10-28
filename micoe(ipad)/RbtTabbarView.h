//
//  RbtTabbarView.h
//  RedBudTek
//
//  Created by 黄川 on 13-11-28.
//  Copyright (c) 2013年 redbudtek. All rights reserved.
//

#import <UIKit/UIKit.h>
//#import "micWenTiFanKuiViewController.h"
//#import "micTianQiYuBaoViewController.h"
//#import "micSettingViewController.h"

@interface RbtTabbarView : UIView{
    UIButton *btn_wodegongcheng;
    UIButton *btn_wentifankui;
    UIButton *btn_sijimuge;
    UIButton *btn_shezhi;

    
    int showViewTag;
}


- (void)setSelectBtn:(NSInteger) btnTag;

@end
