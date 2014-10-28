//
//  micWoDeGongChengViewController.h
//  micoe(ipad)
//
//  Created by Simon on 14-1-7.
//  Copyright (c) 2014年 Simon. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RbtTabViewController.h"
#import "micTopTabbarView.h"
#import "micYunXingYuanLiView.h"
#import "micyuanchengkongzhiView.h"
#import "micShiShiShuJuView.h"
#import "micLiShiShuJuView.h"
#import "micJieNengShiTu.h"
#import "micDiTuDaoHang.h"
#import "micWenTiFanKuiViewController.h"
#import "micTianQiYuBaoViewController.h"
#import "micSettingViewController.h"


#import "micLiShiShuJuView_h.h"
#import "micJieNengShiTu_h.h"
#import "micDiTuDaoHang_h.h"
#import "micShiShiShuJuView_h.h"
#import "micyuanchengkongzhiView_h.h"
#import "micYunXingYuanLiView_h.h"

@interface micWoDeGongChengViewController : RbtTabViewController<topTabbarDelegate>
{
    int viewTag;
    micTopTabbarView *topTabbar;
    
    micYunXingYuanLiView *yunXingYuanLi;
    micyuanchengkongzhiView *yuanChengKongZhi;
    micShiShiShuJuView *shiShiShuJu;
    micLiShiShuJuView *liShiShuJu;
    micJieNengShiTu *jieNengShiTu;
    micDiTuDaoHang *diTuDaoHang;
    
    micLiShiShuJuView_h *liShiShuJu_h;
    micJieNengShiTu_h *jieNengShiTu_h;
    micDiTuDaoHang_h *diTuDaoHang_h;
    micShiShiShuJuView_h *shiShiShuJu_h;
    micyuanchengkongzhiView_h *yuanChengKongZhi_h;
    micYunXingYuanLiView_h *yunXingYuanLi_h;
    
    micWenTiFanKuiViewController *wentifankuiVC;
    micTianQiYuBaoViewController *tianqiyubaoVC;
    micSettingViewController *settingVC;
    
    int selectIndex;
    
    BOOL isFirstShow;
    BOOL isWoDeGongCheng;
}

@end
