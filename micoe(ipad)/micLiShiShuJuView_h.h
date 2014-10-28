//
//  micLiShiShuJuView_h.h
//  micoe(ipad)
//
//  Created by Simon_Tang on 14-4-21.
//  Copyright (c) 2014年 Simon. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RbtDataOfResponse.h"
#import "FYChartView.h"
#import "micWDGCView.h"

@interface micLiShiShuJuView_h : micWDGCView<UIActionSheetDelegate, UIScrollViewDelegate, UITableViewDelegate, UITableViewDataSource, FYChartViewDelegate, FYChartViewDataSource>
{
    UILabel *timeLabel;
    UIActionSheet *actionSheet;
    NSString *chooseTime;
    NSString *chooseName;
     NSString *chooseNameTag;
    
    UITableView *dataTabelView;
    UIScrollView *sc;
    
    int shebeiCount;
    NSMutableArray *shebeiArray;
    
    int numOfRow;
    //排除不显示后的数组数据
    NSMutableArray *timeArray;
    NSMutableArray *dataArray;
    //总的数据数组
    NSMutableArray *xxtimeArray;
    NSMutableArray *values;
    
    int scCount;
    
    NSString *danw;
    
    FYChartView *chartView;
    
    //    UIImageView *shadowImageView;
    UIButton *weekBtn;
    UIButton *monthBtn;
    UIButton *yearBtn;
    
    UIButton *lbBtn;
    UIButton *xxtBtn;
}

-(void)lnButtonClicked;

-(void)xxtButtonClicked;

-(void)timeButtonWithName:(NSString *)name;

-(void)typeButtonWithIndex:(NSString *)index;

@end
