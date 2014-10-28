//
//  micyuanchengkongzhiView.m
//  micoe(ipad)
//
//  Created by Simon on 14-1-10.
//  Copyright (c) 2014年 Simon. All rights reserved.
//


#import "micyuanchengkongzhiView.h"


#define TOPGAP  30
#define MIDGAP  30
#define SIDEGAP  9

@implementation micyuanchengkongzhiView 
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        [self viewDidLoadMy];
    }
    return self;
}

- (void)viewDidLoadMy
{
//    self.title = @"远程控制";
    isSs = YES;
    
    int i = 0;
    
    UIImageView *bgShang = [[UIImageView alloc] init];
    bgShang.image = [UIImage imageNamed:@"yckz_kaiguanBG"];
    bgShang.frame = CGRectMake(SIDEGAP, TOPGAP, 750, 456);
//    bgShang.backgroundColor = [UIColor greenColor];
    [self addSubview:bgShang];
    
    UIImageView *bgXia = [[UIImageView alloc] init];
    bgXia.image = [UIImage imageNamed:@"yckz_kongzhiBG"];
    bgXia.frame = CGRectMake(SIDEGAP, TOPGAP+456+MIDGAP, 750, 227);
    [self addSubview:bgXia];
    
    timeBgView = [[UIImageView alloc] init];
    [timeBgView setImage:[UIImage imageNamed:@"yckz_timeBG"]];
    [timeBgView setFrame:CGRectMake(SIDEGAP, TOPGAP+456-60, 750, 64)];
    timeBgView.hidden = YES;
    [self addSubview:timeBgView];
    
    timeLab1 = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 250, 64)];
    [timeBgView addSubview:timeLab1];
    timeLab2 = [[UILabel alloc] initWithFrame:CGRectMake(250, 0, 250, 64)];
    [timeBgView addSubview:timeLab2];
    timeLab3 = [[UILabel alloc] initWithFrame:CGRectMake(500, 0, 250, 64)];
    [timeBgView addSubview:timeLab3];
    
    timeLab1.textAlignment  = NSTextAlignmentCenter;
    timeLab2.textAlignment  = NSTextAlignmentCenter;
    timeLab3.textAlignment  = NSTextAlignmentCenter;
    
    timeBgView_jr = [[UIImageView alloc] init];
    [timeBgView_jr setImage:[UIImage imageNamed:@"yckz_timeBG"]];
    [timeBgView_jr setFrame:CGRectMake(SIDEGAP, TOPGAP+456-60, 750, 64)];
    timeBgView_jr.hidden = YES;
    [self addSubview:timeBgView_jr];
    
    timeLab1_jr = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 250, 64)];
    [timeBgView_jr addSubview:timeLab1_jr];
    timeLab2_jr = [[UILabel alloc] initWithFrame:CGRectMake(250, 0, 250, 64)];
    [timeBgView_jr addSubview:timeLab2_jr];
    timeLab3_jr = [[UILabel alloc] initWithFrame:CGRectMake(500, 0, 250, 64)];
    [timeBgView_jr addSubview:timeLab3_jr];
    
    timeLab1_jr.textAlignment  = NSTextAlignmentCenter;
    timeLab2_jr.textAlignment  = NSTextAlignmentCenter;
    timeLab3_jr.textAlignment  = NSTextAlignmentCenter;
    
    self.lab_controlModel = [[UILabel alloc] initWithFrame:CGRectMake(768-SIDEGAP-100, 37+i, 80, 40)];
    self.lab_controlModel.textColor = [UIColor grayColor];
    self.lab_controlModel.text = @"";
    [self.lab_controlModel setTextAlignment:NSTextAlignmentRight];
    self.lab_controlModel.font = [UIFont fontWithName:kFontName size:20];
    [self addSubview:self.lab_controlModel];
    
    UILabel *leftLabel = [[UILabel alloc] initWithFrame:CGRectMake(SIDEGAP + 20, 37+i, 120, 40)];
    leftLabel.textColor = [UIColor grayColor];
    leftLabel.text = @"设备状态控制";
    [leftLabel setTextAlignment:NSTextAlignmentLeft];
    leftLabel.font = [UIFont fontWithName:kFontName size:20];
    [self addSubview:leftLabel];
    
    
    NSArray *arr_xiaImages = @[@"yckz_ss",@"yckz_ssselect",@"yckz_jr",@"yckz_jrselect",@"yckz_sb",@"yckz_sbselect"];
    NSArray *arr_xiaParam =  @[@"251",@"184",@"0",@"41"];
    xiaSelectView = [[RbtYuanChengSelectView alloc] initWithFrame:bgXia.frame withImages:arr_xiaImages andParam:arr_xiaParam];
    xiaSelectView.name = @"xiaSelectView";
    xiaSelectView.delegate = self;
//    [xiaSelectView setSelectBtn:12];
    [self addSubview:xiaSelectView];
    
    //上水
    NSArray *arr_shangImages = @[@"yckz_zidongBtn",@"yckz_zidongBtn_s",@"yckz_dingshiBtn",@"yckz_dingshiBtn_s",@"yckz_tingzhiBtn",@"yckz_tingzhiBtn_s"];
    NSArray *arr_shangParam = @[@"150",@"158",@"50",@"150"];
    self.ssSelectView = [[RbtYuanChengSelectView2 alloc] initWithFrame:CGRectMake(SIDEGAP, TOPGAP-30, 750, 456) withImages:arr_shangImages andParam:arr_shangParam];
    self.ssSelectView.name = @"ss_shangSelectView";
    self.ssSelectView.delegate = self;
    [self addSubview:self.ssSelectView];
    
    //加热
    self.jrSelectView = [[RbtYuanChengSelectView2 alloc] initWithFrame:CGRectMake(SIDEGAP, TOPGAP-30, 750, 456) withImages:arr_shangImages andParam:arr_shangParam];
    self.jrSelectView.name = @"jr_shangSelectView";
    self.jrSelectView.delegate = self;
    self.jrSelectView.hidden = YES;
    [self addSubview:self.jrSelectView];
    
    //设备
    self.sbSelectView = [[UIScrollView alloc] initWithFrame:bgShang.frame];
    [self.sbSelectView setPagingEnabled:YES];
    self.sbSelectView.backgroundColor = [UIColor clearColor];
    self.sbSelectView.hidden = YES;
    [self addSubview:self.sbSelectView];
    
    [self.hud1 show:YES];
    RbtWebManager *webManager;
    if ([RbtCommonTool getJinRuMode] == LiXianGongCheng) {
        webManager = [RbtWebManager getRbtManager:NO];
    }
    else
    {
        webManager = [RbtWebManager getRbtManager:YES];
        
    }
    webManager.name = @"yckzweb";
    webManager.delegate = self;
    [webManager getcontrolmodeandstatusWithU:[RbtUserModel sharedInstance].userName andP:[RbtProjectModel sharedInstance].projectid];
	// Do any additional setup after loading the view.
    
    [self setButtomButtonHidden];
}

-(void)setButtomButtonHidden
{
    if (![[NSUserDefaults standardUserDefaults] objectForKey:@"showButton"]) {
        [[NSUserDefaults standardUserDefaults] setObject:@"10" forKey:@"showButton"];
    }
    int buttonTag = [[[NSUserDefaults standardUserDefaults] objectForKey:@"showButton"] intValue];
    [xiaSelectView setSelectBtn:buttonTag];
    [self chageShangView:buttonTag];
}

-(void)viewset
{
    dingshiButton_left = [UIButton buttonWithType:UIButtonTypeCustom];
    [dingshiButton_left setFrame:CGRectMake(60, 180, 137, 166)];
    [dingshiButton_left setImage:[UIImage imageNamed:@"yckz_dingshiBtn"] forState:UIControlStateNormal];
    [dingshiButton_left addTarget:self action:@selector(buttonCLicked:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:dingshiButton_left];
    
    zidongButton_left = [UIButton buttonWithType:UIButtonTypeCustom];
    [zidongButton_left setFrame:CGRectMake(60, 180, 137, 166)];
    [zidongButton_left setImage:[UIImage imageNamed:@"yckz_zidongBtn"] forState:UIControlStateNormal];
    [zidongButton_left addTarget:self action:@selector(buttonCLicked:) forControlEvents:UIControlEventTouchUpInside];
    [zidongButton_left setHidden:YES];
    [self addSubview:zidongButton_left];
    
    tingzhiButton_left = [UIButton buttonWithType:UIButtonTypeCustom];
    [tingzhiButton_left setFrame:CGRectMake(60, 180, 137, 166)];
    [tingzhiButton_left setImage:[UIImage imageNamed:@"yckz_tingzhiBtn"] forState:UIControlStateNormal];
    [tingzhiButton_left addTarget:self action:@selector(buttonCLicked:) forControlEvents:UIControlEventTouchUpInside];
    [tingzhiButton_left setHidden:YES];
    [self addSubview:tingzhiButton_left];
    
    dingshiButton_mid = [UIButton buttonWithType:UIButtonTypeCustom];
    [dingshiButton_mid setFrame:CGRectMake(60+137+77, 180-45, 220, 257)];
    [dingshiButton_mid setImage:[UIImage imageNamed:@"yckz_dingshiBtn_s"] forState:UIControlStateNormal];
    [dingshiButton_mid setHidden:YES];
    [self addSubview:dingshiButton_mid];
    
    zidongButton_mid = [UIButton buttonWithType:UIButtonTypeCustom];
    [zidongButton_mid setFrame:CGRectMake(60+137+77, 180-45, 220, 257)];
    [zidongButton_mid setImage:[UIImage imageNamed:@"yckz_zidongBtn_s"] forState:UIControlStateNormal];
    [self addSubview:zidongButton_mid];
    
    tingzhiButton_mid = [UIButton buttonWithType:UIButtonTypeCustom];
    [tingzhiButton_mid setFrame:CGRectMake(60+137+77, 180-45, 220, 257)];
    [tingzhiButton_mid setImage:[UIImage imageNamed:@"yckz_tingzhiBtn_s"] forState:UIControlStateNormal];
    [tingzhiButton_mid setHidden:YES];
    [self addSubview:tingzhiButton_mid];
    
    dingshiButton_right = [UIButton buttonWithType:UIButtonTypeCustom];
    [dingshiButton_right setFrame:CGRectMake(768-60-137, 180, 137, 166)];
    [dingshiButton_right setImage:[UIImage imageNamed:@"yckz_dingshiBtn"] forState:UIControlStateNormal];
    [dingshiButton_right addTarget:self action:@selector(buttonCLicked:) forControlEvents:UIControlEventTouchUpInside];
    [dingshiButton_right setHidden:YES];
    [self addSubview:dingshiButton_right];
    
    zidongButton_right = [UIButton buttonWithType:UIButtonTypeCustom];
    [zidongButton_right setFrame:CGRectMake(768-60-137, 180, 137, 166)];
    [zidongButton_right setImage:[UIImage imageNamed:@"yckz_zidongBtn"] forState:UIControlStateNormal];
    [zidongButton_right addTarget:self action:@selector(buttonCLicked:) forControlEvents:UIControlEventTouchUpInside];
    [zidongButton_right setHidden:YES];
    [self addSubview:zidongButton_right];
    
    tingzhiButton_right = [UIButton buttonWithType:UIButtonTypeCustom];
    [tingzhiButton_right setFrame:CGRectMake(768-60-137, 180, 137, 166)];
    [tingzhiButton_right setImage:[UIImage imageNamed:@"yckz_tingzhiBtn"] forState:UIControlStateNormal];
    [tingzhiButton_right addTarget:self action:@selector(buttonCLicked:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:tingzhiButton_right];
    
    [dingshiButton_left setTag:2010];
    [zidongButton_left setTag:2011];
    [tingzhiButton_left setTag:2012];
    
    [dingshiButton_mid setTag:2020];
    [zidongButton_mid setTag:2021];
    [tingzhiButton_mid setTag:2022];
    
    [dingshiButton_right setTag:2030];
    [zidongButton_right setTag:2031];
    [tingzhiButton_right setTag:2032];
    
    showButtonTag = 2021;
}

-(void)buttonCLicked:(UIButton *)button
{
    int tag = button.tag;
    int tempTag = showButtonTag%10 + tag/10*10;
    [(UIButton*)[self viewWithTag:showButtonTag] setHidden:YES];
    showButtonTag = tag%10 + 2020;
    //    NSLog(@"tem%d", tempTag);
    button.hidden = YES;
    [(UIButton *)[self viewWithTag:tempTag] setHidden:NO];
    [(UIButton*)[self viewWithTag:showButtonTag] setHidden:NO];
}

- (void)chageShangView:(NSInteger) x{
    self.ssSelectView.hidden = YES;
    self.jrSelectView.hidden = YES;
    self.sbSelectView.hidden = YES;
    [self showTheTime:@"ss" show:NO];
    [self showTheTime:@"jr" show:NO];
    if (x == 10) {
        self.ssSelectView.hidden = NO;
        [self showTheTime:@"ss" show:YES];
    }
    else if (x == 11)
    {
        self.jrSelectView.hidden = NO;
        [self showTheTime:@"jr" show:YES];
    }
    else if  (x == 12)
    {
        self.sbSelectView.hidden = NO;
    }
}

#pragma mark- RbtYuanChengSelectViewdelegate
#pragma mark- 上侧控制按钮点击方法

- (void)buttonAcitons: (NSInteger) thebutton andView:(RbtYuanChengSelectView *)theView{
    
    [[NSUserDefaults standardUserDefaults] setObject:[NSString stringWithFormat:@"%d", thebutton] forKey:@"showButton"];
    [[NSUserDefaults standardUserDefaults] setObject:[NSString stringWithFormat:@"%d", thebutton] forKey:@"controlButton"];
    if ([theView.name isEqualToString:@"xiaSelectView"]) {
        [self chageShangView:thebutton];
    }
    if ([RbtCommonTool getJinRuMode] != LiXianGongCheng) {
        if([theView.name isEqualToString:@"ss_shangSelectView"]){
            if (thebutton == 2011 || thebutton == 2031) {
                RbtWebManager *webManager = [RbtWebManager getRbtManager:YES];
                webManager.delegate = self;
                webManager.name = @"ss_auto_per";
                [self.hud1 show:YES];
                [webManager getgetpermissionWithU:[RbtUserModel sharedInstance].userName andP:[RbtProjectModel sharedInstance].projectid];
                
            }
            else if(thebutton == 2010 || thebutton == 2030){
                isSs = YES;
                RbtYckzDsViewController *dsVc = [[RbtYckzDsViewController alloc] init];
                dsVc.delegate = self;
                dsVc.startTime1 = self.startTime1_ss;
                dsVc.endTime1  =self.endTime1_ss;
                dsVc.startTime2 = self.startTime2_ss;
                dsVc.endTime2  =self.endTime2_ss;
                dsVc.startTime3 = self.startTime3_ss;
                dsVc.endTime3  =self.endTime3_ss;
                [dsVc initPickerView];
                UIViewController *vc = [self viewController];
                [vc.navigationController pushViewController:dsVc animated:YES];
            }
            else if(thebutton == 2012 || thebutton == 2032){
                RbtWebManager *webManager = [RbtWebManager getRbtManager:YES];
                webManager.delegate = self;
                webManager.name = @"ss_stop_per";
                [self.hud1 show:YES];
                [webManager getgetpermissionWithU:[RbtUserModel sharedInstance].userName andP:[RbtProjectModel sharedInstance].projectid];
                
            }
        }
        else if([theView.name isEqualToString:@"jr_shangSelectView"]){
            if (thebutton == 2011 || thebutton == 2031) {
                RbtWebManager *webManager = [RbtWebManager getRbtManager:YES];
                webManager.delegate = self;
                webManager.name = @"jr_auto_per";
                [self.hud1 show:YES];
                [webManager getgetpermissionWithU:[RbtUserModel sharedInstance].userName andP:[RbtProjectModel sharedInstance].projectid];
            }
            else if(thebutton == 2010 || thebutton == 2030){
                isSs = NO;
                RbtYckzDsViewController *dsVc = [[RbtYckzDsViewController alloc] init];
                dsVc.delegate = self;
                dsVc.startTime1 = self.startTime1_jr;
                dsVc.endTime1  =self.endTime1_jr;
                dsVc.startTime2 = self.startTime2_jr;
                dsVc.endTime2  =self.endTime2_jr;
                dsVc.startTime3 = self.startTime3_jr;
                dsVc.endTime3  =self.endTime3_jr;
                [dsVc initPickerView];
                UIViewController *vc = [self viewController];
                [vc.navigationController pushViewController:dsVc animated:YES];
                
                //                RbtWebManager *webManager = [RbtWebManager getRbtManager:YES];
                //                webManager.delegate = self;
                //                webManager.name = @"jr_time_per";
                //                [self.hud1 show:YES];
                //                [webManager getgetpermissionWithU:[RbtUserModel sharedInstance].userName andP:[RbtProjectModel sharedInstance].projectid];
            }
            else if(thebutton == 2012 || thebutton == 2032){
                RbtWebManager *webManager = [RbtWebManager getRbtManager:YES];
                webManager.delegate = self;
                webManager.name = @"jr_stop_per";
                [self.hud1 show:YES];
                [webManager getgetpermissionWithU:[RbtUserModel sharedInstance].userName andP:[RbtProjectModel sharedInstance].projectid];
            }
        }
    }
}

#pragma mark- RbtSheBeiViewDelegate
- (void)sheBeiViewStateChange:(RbtSheBeiView *)theView{
    
    RbtWebManager *webManager = [RbtWebManager getRbtManager:YES];
    webManager.delegate = self;
    webManager.name = @"sbweb_per";
    oneSheBei = theView;
    [self.hud1 show:YES];
    [webManager getgetpermissionWithU:[RbtUserModel sharedInstance].userName andP:[RbtProjectModel sharedInstance].projectid];
}

#pragma mark- control
- (void)getPermissionSuccess:(NSString *)kongzhi{
    RbtWebManager *webManager = [RbtWebManager getRbtManager:YES];
    webManager.delegate = self;
    if([kongzhi isEqualToString:@"sbweb"]){
        webManager.name = @"sbweb";
        NSString *zhuangtai = @"on";
        if (oneSheBei.isOn) {
            zhuangtai = @"on";
        }
        else{
            zhuangtai = @"off";
        }
        NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:oneSheBei.name,@"n",zhuangtai,@"s",nil];
        NSArray *arr = [NSArray arrayWithObject:dic];
        NSDictionary *dic_d = [NSDictionary dictionaryWithObjectsAndKeys:arr,@"d", nil];
        //    NSDictionary *dic_c = [NSDictionary dictionaryWithObjectsAndKeys:dic_d,@"c", nil];
        [self.hud1 show:YES];
        [webManager controlWithU:[RbtUserModel sharedInstance].userName withP:[RbtProjectModel sharedInstance].projectid  andC:dic_d];
    }
    else if ([kongzhi isEqualToString:@"ss_auto"]) {
        webManager.name = @"ss_auto";
        NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:@"auto",@"s", nil];
        NSDictionary *dic_w = [NSDictionary dictionaryWithObjectsAndKeys:dic,@"w", nil];
        //            NSDictionary *dic_c = [NSDictionary dictionaryWithObjectsAndKeys:dic_w,@"c", nil];
        [self.hud1 show:YES];
        [webManager controlWithU:[RbtUserModel sharedInstance].userName withP:[RbtProjectModel sharedInstance].projectid  andC:dic_w];
    }
    else if ([kongzhi isEqualToString:@"ss_time"]) {
        //            self.ssDsView.hidden = NO;
        webManager.name = @"ss_time";
        NSMutableArray *arr_time = [[NSMutableArray alloc] init];
        arr_time = [self getTimeArray];
        NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:@"timing",@"s",arr_time,@"t", nil];
        NSDictionary *dic_w = [NSDictionary dictionaryWithObjectsAndKeys:dic,@"w", nil];
        //            NSDictionary *dic_c = [NSDictionary dictionaryWithObjectsAndKeys:dic_w,@"c", nil];
        [self.hud1 show:YES];
        [webManager controlWithU:[RbtUserModel sharedInstance].userName withP:[RbtProjectModel sharedInstance].projectid  andC:dic_w];
    }
    else if([kongzhi isEqualToString:@"ss_stop"]){
        webManager.name = @"ss_stop";
        NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:@"stop",@"s", nil];
        NSDictionary *dic_w = [NSDictionary dictionaryWithObjectsAndKeys:dic,@"w", nil];
        //            NSDictionary *dic_c = [NSDictionary dictionaryWithObjectsAndKeys:dic_w,@"c", nil];
        [self.hud1 show:YES];
        [webManager controlWithU:[RbtUserModel sharedInstance].userName withP:[RbtProjectModel sharedInstance].projectid  andC:dic_w];
    }
    else if ([kongzhi isEqualToString:@"jr_auto"]) {
        webManager.name = @"jr_auto";
        NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:@"auto",@"s", nil];
        NSDictionary *dic_h = [NSDictionary dictionaryWithObjectsAndKeys:dic,@"h", nil];
        //            NSDictionary *dic_c = [NSDictionary dictionaryWithObjectsAndKeys:dic_h,@"c", nil];
        [self.hud1 show:YES];
        [webManager controlWithU:[RbtUserModel sharedInstance].userName withP:[RbtProjectModel sharedInstance].projectid  andC:dic_h];
    }
    else if ([kongzhi isEqualToString:@"jr_time"]) {
        webManager.name = @"jr_time";
        //            self.jrDsView.hidden = NO;
        NSMutableArray *arr_time = [[NSMutableArray alloc] init];
        arr_time = [self getTimeArray];
        NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:@"timing",@"s",arr_time,@"t", nil];
        NSDictionary *dic_h = [NSDictionary dictionaryWithObjectsAndKeys:dic,@"h", nil];
        //            NSDictionary *dic_c = [NSDictionary dictionaryWithObjectsAndKeys:dic_h,@"c", nil];
        [self.hud1 show:YES];
        [webManager controlWithU:[RbtUserModel sharedInstance].userName withP:[RbtProjectModel sharedInstance].projectid  andC:dic_h];
    }
    else if([kongzhi isEqualToString:@"jr_stop"]){
        webManager.name = @"jr_stop";
        NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:@"stop",@"s", nil];
        NSDictionary *dic_h = [NSDictionary dictionaryWithObjectsAndKeys:dic,@"h", nil];
        //            NSDictionary *dic_c = [NSDictionary dictionaryWithObjectsAndKeys:dic_h,@"c", nil];
        [self.hud1 show:YES];
        [webManager controlWithU:[RbtUserModel sharedInstance].userName withP:[RbtProjectModel sharedInstance].projectid  andC:dic_h];
    }
}


#pragma mark- request delegate
- (void)onDataLoadWithService:(RbtWebManager *)webService
                  andResponse:(NSDictionary *)responseDic
{
    if([webService.name isEqualToString:@"yckzweb"]){
        [self.hud1 hide:YES];
        if ([RbtCommonTool getJinRuMode] == LiXianGongCheng) {
            if ([[responseDic objectForKey:@"c"] isEqualToString:@"manual"]) {
                self.lab_controlModel.text = @"手动模式";
            }
            else{
                self.lab_controlModel.text = @"自动模式";
                //------debug---------
                return;
            }
            NSDictionary *dic_w = [responseDic objectForKey:@"w"];
            NSDictionary *dic_h = [responseDic objectForKey:@"h"];
            NSArray *arr_d = [responseDic objectForKey:@"d"];
            //上水
            
            if ([[dic_w objectForKey:@"s"] isEqualToString:@"auto"]) {
                [self.ssSelectView setSelectBtn:2021];
                self.ssSelectView.preTag = 2021;
                
                isTime_ss = NO;
                [self showTheTime:@"ss" show:NO];
            }
            else if ([[dic_w objectForKey:@"s"] isEqualToString:@"timing"]) {
                [self.ssSelectView setSelectBtn:2020];
                self.ssSelectView.preTag = 2020;
                NSArray *arr = [dic_w objectForKey:@"t"];
                for (int i = 0; i<3; i++) {
                    NSDictionary *dic = [arr objectAtIndex:i];
                    NSString *start = [dic objectForKey:@"start"];
                    NSString *end = [dic objectForKey:@"end"];
                    if (i == 0) {
                        self.startTime1_ss = start;
                        self.endTime1_ss = end;
                    }
                    else if (i== 1){
                        self.startTime2_ss = start;
                        self.endTime2_ss = end;
                    }
                    else if (i== 2){
                        self.startTime3_ss = start;
                        self.endTime3_ss = end;
                    }
                }
                isTime_ss = YES;
                [self showTheTime:@"ss" show:YES];
                
            }
            else if ([[dic_w objectForKey:@"s"] isEqualToString:@"stop"]) {
                self.ssSelectView.preTag = 2022;
                [self.ssSelectView setSelectBtn:2022];
                isTime_ss = NO;
                [self showTheTime:@"ss" show:NO];
            }
            //加热
            if ([[dic_h objectForKey:@"s"] isEqualToString:@"auto"]) {
                [self.jrSelectView setSelectBtn:2021];
                self.jrSelectView.preTag = 2021;
                
                isTime_jr = NO;
                [self showTheTime:@"jr" show:NO];
            }
            else if ([[dic_h objectForKey:@"s"] isEqualToString:@"timing"]) {
                [self.jrSelectView setSelectBtn:2020];
                self.jrSelectView.preTag = 2020;
                NSArray *arr = [dic_h objectForKey:@"t"];
                for (int i = 0; i<3; i++) {
                    NSDictionary *dic = [arr objectAtIndex:i];
                    NSString *start = [dic objectForKey:@"start"];
                    NSString *end = [dic objectForKey:@"end"];
                    if (i == 0) {
                        self.startTime1_jr = start;
                        self.endTime1_jr = end;
                    }
                    else if (i== 1){
                        self.startTime2_jr = start;
                        self.endTime2_jr = end;
                    }
                    else if (i== 2){
                        self.startTime3_jr = start;
                        self.endTime3_jr = end;
                    }
                }
                
                isTime_jr = YES;
                [self showTheTime:@"jr" show:YES];
            }
            else if ([[dic_h objectForKey:@"s"] isEqualToString:@"stop"]) {
                [self.jrSelectView setSelectBtn:2022];
                self.jrSelectView.preTag = 2022;
                
                isTime_jr = NO;
                [self showTheTime:@"jr" show:NO];
            }
            
            //设备
            for (int i = 0; i<[arr_d count]; i++) {
                NSDictionary *one = [arr_d objectAtIndex:i];
                int j = (i/4)%2;
                int k = i/8;
                RbtSheBeiView *oneShebei = [[RbtSheBeiView alloc] initWithFrame:CGRectMake(k*750+70+(i%4)*(95+57.5), 100+180*j, 95, 150)];
                oneShebei.name = [one objectForKey:@"n"];
                oneShebei.delegate = self;
                if ([[one objectForKey:@"s"] isEqualToString:@"on"]) {
                    oneShebei.isOn = YES;
                }
                else{
                    oneShebei.isOn = NO;
                }
                [oneShebei initViews];
                [self.sbSelectView addSubview:oneShebei];
            }
            if ([arr_d count]%8) {
                self.sbSelectView.contentSize = CGSizeMake(self.sbSelectView.width*([arr_d count]/8 + 1), self.sbSelectView.height);
            }
            else{
                self.sbSelectView.contentSize = CGSizeMake(self.sbSelectView.width*([arr_d count]/8), self.sbSelectView.height);
            }
        }
        else{
            if ([[responseDic objectForKey:@"rc"] isEqualToString:@"1"]) {
                responseDic = [responseDic objectForKey:@"rt"];
                if ([[responseDic objectForKey:@"c"] isEqualToString:@"manual"]) {
                    self.lab_controlModel.text = @"手动模式";
                }
                else{
                    self.lab_controlModel.text = @"自动模式";
                    //------debug---------
                    return;
                }
                NSDictionary *dic_w = [responseDic objectForKey:@"w"];
                NSDictionary *dic_h = [responseDic objectForKey:@"h"];
                NSArray *arr_d = [responseDic objectForKey:@"d"];
                //上水
                if ([[dic_w objectForKey:@"s"] isEqualToString:@"auto"]) {
                    [self.ssSelectView setSelectBtn:2021];
                    self.ssSelectView.preTag = 2021;
                    
                    isTime_ss = NO;
                    [self showTheTime:@"ss" show:NO];
                }
                else if ([[dic_w objectForKey:@"s"] isEqualToString:@"timing"]) {
                    [self.ssSelectView setSelectBtn:2020];
                    self.ssSelectView.preTag = 2020;
                    NSArray *arr = [dic_w objectForKey:@"t"];
                    for (int i = 0; i<3; i++) {
                        NSDictionary *dic = [arr objectAtIndex:i];
                        NSString *start = [dic objectForKey:@"start"];
                        NSString *end = [dic objectForKey:@"end"];
                        if (i == 0) {
                            self.startTime1_ss = start;
                            self.endTime1_ss = end;
                        }
                        else if (i== 1){
                            self.startTime2_ss = start;
                            self.endTime2_ss = end;
                        }
                        else if (i== 2){
                            self.startTime3_ss = start;
                            self.endTime3_ss = end;
                        }
                    }
                    
                    isTime_ss = YES;
                    [self showTheTime:@"ss" show:YES];
                }
                else if ([[dic_w objectForKey:@"s"] isEqualToString:@"stop"]) {
                    self.ssSelectView.preTag = 2022;
                    [self.ssSelectView setSelectBtn:2022];
                    
                    isTime_ss = NO;
                    [self showTheTime:@"ss" show:NO];
                }
                
                
                //加热
                if ([[dic_h objectForKey:@"s"] isEqualToString:@"auto"]) {
                    [self.jrSelectView setSelectBtn:2021];
                    self.jrSelectView.preTag = 2021;
                    
                    isTime_jr = NO;
                    [self showTheTime:@"jr" show:NO];
                }
                else if ([[dic_h objectForKey:@"s"] isEqualToString:@"timing"]) {
                    [self.jrSelectView setSelectBtn:2020];
                    self.jrSelectView.preTag = 2020;
                    NSArray *arr = [dic_h objectForKey:@"t"];
                    for (int i = 0; i<3; i++) {
                        NSDictionary *dic = [arr objectAtIndex:i];
                        NSString *start = [dic objectForKey:@"start"];
                        NSString *end = [dic objectForKey:@"end"];
                        if (i == 0) {
                            self.startTime1_jr = start;
                            self.endTime1_jr = end;
                        }
                        else if (i== 1){
                            self.startTime2_jr = start;
                            self.endTime2_jr = end;
                        }
                        else if (i== 2){
                            self.startTime3_jr = start;
                            self.endTime3_jr = end;
                        }
                    }
                    
                    isTime_jr = YES;
                    [self showTheTime:@"jr" show:NO];
                }
                else if ([[dic_h objectForKey:@"s"] isEqualToString:@"stop"]) {
                    [self.jrSelectView setSelectBtn:2022];
                    self.jrSelectView.preTag = 2022;
                    
                    isTime_jr = NO;
                    [self showTheTime:@"jr" show:NO];
                }
                
                //设备
                for (int i = 0; i<[arr_d count]; i++) {
                    NSDictionary *one = [arr_d objectAtIndex:i];
                    int j = (i/4)%2;
                    int k = i/8;
                    RbtSheBeiView *oneShebei = [[RbtSheBeiView alloc] initWithFrame:CGRectMake(k*750+70+(i%4)*(95+57.5), 100+180*j, 95, 150)];
                    oneShebei.name = [one objectForKey:@"n"];
                    oneShebei.delegate = self;
                    if ([[one objectForKey:@"s"] isEqualToString:@"on"]) {
                        oneShebei.isOn = YES;
                    }
                    else{
                        oneShebei.isOn = NO;
                    }
                    [oneShebei initViews];
                    [self.sbSelectView addSubview:oneShebei];
                }
                if ([arr_d count]%8) {
                    self.sbSelectView.contentSize = CGSizeMake(self.sbSelectView.width*([arr_d count]/8+1), self.sbSelectView.height);
                }
                else{
                    self.sbSelectView.contentSize = CGSizeMake(self.sbSelectView.width*([arr_d count]/8), self.sbSelectView.height);
                }
                NSLog(@"cc = %f", self.sbSelectView.contentSize.width);
                
            }
            else if ([[responseDic objectForKey:@"rc"] isEqualToString:@"0"]){
                [RbtCommonTool showInfoAlert:[responseDic objectForKey:@"rd"]];
            }
        }
    }
    else  if ([webService.name isEqualToString:@"ss_auto"]) {
        [self.hud1 hide:YES];
        if ([[responseDic objectForKey:@"rc"] integerValue]) {
            self.ssSelectView.preTag = 10;
            isTime_ss = NO;
            [self showTheTime:@"ss" show:NO];
        }
        else{
            [self.ssSelectView setSelectBtn:self.ssSelectView.preTag];
            [RbtCommonTool showInfoAlert:[responseDic objectForKey:@"rd"]];
        }
    }
    else if ([webService.name isEqualToString:@"ss_time"]) {
        [self.hud1 hide:YES];
        if (![[responseDic objectForKey:@"rc"] isMemberOfClass:[NSNull class]]) {
            if ([[responseDic objectForKey:@"rc"] integerValue]) {
                self.ssSelectView.preTag = 11;
                self.startTime1_ss  = [timeInfo objectForKey:@"startTime1_ss"];
                self.endTime1_ss  = [timeInfo objectForKey:@"endTime1_ss"];
                self.startTime2_ss  = [timeInfo objectForKey:@"startTime2_ss"];
                self.endTime2_ss  = [timeInfo objectForKey:@"endTime2_ss"];
                self.startTime3_ss  = [timeInfo objectForKey:@"startTime3_ss"];
                self.endTime3_ss  = [timeInfo objectForKey:@"endTime3_ss"];
                isTime_ss = YES;
                [self showTheTime:@"ss" show:YES];
            }
            else{
                [self.ssSelectView setSelectBtn:self.ssSelectView.preTag];
                [RbtCommonTool showInfoAlert:[responseDic objectForKey:@"rd"]];
            }
        }
        else{
            [self.ssSelectView setSelectBtn:self.ssSelectView.preTag];
            [RbtCommonTool showInfoAlert:@"控制无效"];
        }
    }
    else if([responseDic objectForKey:@"rc"]&&[webService.name isEqualToString:@"ss_stop"]){
        [self.hud1 hide:YES];
        if (![[responseDic objectForKey:@"rc"] isMemberOfClass:[NSNull class]]) {
            if ([[responseDic objectForKey:@"rc"] integerValue]) {
                self.ssSelectView.preTag = 12;
                isTime_ss = NO;
                [self showTheTime:@"ss" show:NO];
            }
            else{
                [self.ssSelectView setSelectBtn:self.ssSelectView.preTag];
                [RbtCommonTool showInfoAlert:[responseDic objectForKey:@"rd"]];
            }
        }
        else{
            [self.ssSelectView setSelectBtn:self.ssSelectView.preTag];
            [RbtCommonTool showInfoAlert:@"控制无效"];
        }
    }
    else if ([webService.name isEqualToString:@"jr_auto"]) {
        [self.hud1 hide:YES];
        if (![[responseDic objectForKey:@"rc"] isMemberOfClass:[NSNull class]]) {
            if ([[responseDic objectForKey:@"rc"] integerValue]) {
                self.jrSelectView.preTag = 10;
                isTime_jr = NO;
                [self showTheTime:@"jr" show:NO];
            }
            else{
                [self.jrSelectView setSelectBtn:self.jrSelectView.preTag];
                [RbtCommonTool showInfoAlert:[responseDic objectForKey:@"rd"]];
            }
        }
        else{
            [self.jrSelectView setSelectBtn:self.jrSelectView.preTag];
            [RbtCommonTool showInfoAlert:@"控制无效"];
        }
    }
    else if ([webService.name isEqualToString:@"jr_time"]) {
        [self.hud1 hide:YES];
        if (![[responseDic objectForKey:@"rc"] isMemberOfClass:[NSNull class]]) {
            if ([[responseDic objectForKey:@"rc"] integerValue]) {
                self.jrSelectView.preTag = 11;
                self.startTime1_jr  = [timeInfo objectForKey:@"startTime1_jr"];
                self.endTime1_jr  = [timeInfo objectForKey:@"endTime1_jr"];
                self.startTime2_jr  = [timeInfo objectForKey:@"startTime2_jr"];
                self.endTime2_jr  = [timeInfo objectForKey:@"endTime2_jr"];
                self.startTime3_jr  = [timeInfo objectForKey:@"startTime3_jr"];
                self.endTime3_jr  = [timeInfo objectForKey:@"endTime3_jr"];
                isTime_jr = YES;
                [self showTheTime:@"jr" show:YES];
            }
            else{
                [self.jrSelectView setSelectBtn:self.jrSelectView.preTag];
                [RbtCommonTool showInfoAlert:[responseDic objectForKey:@"rd"]];
            }
        }
        else{
            [self.jrSelectView setSelectBtn:self.jrSelectView.preTag];
            [RbtCommonTool showInfoAlert:@"控制无效"];
        }
    }
    else if([webService.name isEqualToString:@"jr_stop"]){
        [self.hud1 hide:YES];
        if (![[responseDic objectForKey:@"rc"] isMemberOfClass:[NSNull class]]) {
            if ([[responseDic objectForKey:@"rc"] integerValue]) {
                self.jrSelectView.preTag = 12;
                isTime_jr = NO;
                [self showTheTime:@"jr" show:NO];
            }
            else{
                [self.jrSelectView setSelectBtn:self.jrSelectView.preTag];
                [RbtCommonTool showInfoAlert:[responseDic objectForKey:@"rd"]];
            }
        }
        else{
            [self.jrSelectView setSelectBtn:self.jrSelectView.preTag];
            [RbtCommonTool showInfoAlert:@"控制无效"];
        }
    }
    else if([webService.name isEqualToString:@"sbweb"]){
        [self.hud1 hide:YES];
        if (![[responseDic objectForKey:@"rc"] isMemberOfClass:[NSNull class]]) {
            if ([[responseDic objectForKey:@"rc"] integerValue]) {
            }
            else{
                oneSheBei.iskzsb = YES;
                if (oneSheBei.isOn) {
                    [oneSheBei.swi_sb setOn:NO];
                }
                else{
                    [oneSheBei.swi_sb setOn:YES];
                }
                [RbtCommonTool showInfoAlert:[responseDic objectForKey:@"rd"]];
            }
        }
        else{
            oneSheBei.iskzsb = YES;
            if (oneSheBei.isOn) {
                [oneSheBei.swi_sb setOn:NO];
            }
            else{
                [oneSheBei.swi_sb setOn:YES];
            }
            [RbtCommonTool showInfoAlert:@"控制无效"];
        }
    }
    else if([webService.name isEqualToString:@"sbweb_per"]){
        if ([[responseDic objectForKey:@"rc"] intValue]) {
            [self getPermissionSuccess:@"sbweb"];
        }
        else
        {
            oneSheBei.iskzsb = YES;
            if (oneSheBei.isOn) {
                [oneSheBei.swi_sb setOn:NO];
            }
            else{
                [oneSheBei.swi_sb setOn:YES];
            }
            [self.hud1 hide:YES];
            [RbtCommonTool showInfoAlert:[responseDic objectForKey:@"rd"]];
        }
    }
    else if ([webService.name isEqualToString:@"ss_auto_per"]) {
        if ([responseDic objectForKey:@"rc"]&&[[responseDic objectForKey:@"rc"] intValue]) {
            [self getPermissionSuccess:@"ss_auto"];
        }
        else
        {
            [self.ssSelectView setSelectBtn:self.ssSelectView.preTag];
            [self.hud1 hide:YES];
            [RbtCommonTool showInfoAlert:[responseDic objectForKey:@"rd"]];
        }
    }
    else if ([webService.name isEqualToString:@"ss_time_per"]) {
        if ([[responseDic objectForKey:@"rc"] intValue]) {
            [self getPermissionSuccess:@"ss_time"];
        }
        else
        {
            [self.ssSelectView setSelectBtn:self.ssSelectView.preTag];
            [self.hud1 hide:YES];
            [RbtCommonTool showInfoAlert:[responseDic objectForKey:@"rd"]];
        }
    }
    else if([webService.name isEqualToString:@"ss_stop_per"]){
        if ([[responseDic objectForKey:@"rc"] intValue]) {
            [self getPermissionSuccess:@"ss_stop"];
        }
        else
        {
            [self.ssSelectView setSelectBtn:self.ssSelectView.preTag];
            [self.hud1 hide:YES];
            [RbtCommonTool showInfoAlert:[responseDic objectForKey:@"rd"]];
        }
    }
    else if ([webService.name isEqualToString:@"jr_auto_per"]) {
        if ([[responseDic objectForKey:@"rc"] intValue]) {
            [self getPermissionSuccess:@"jr_auto"];
        }
        else
        {
            [self.jrSelectView setSelectBtn:self.jrSelectView.preTag];
            [self.hud1 hide:YES];
            [RbtCommonTool showInfoAlert:[responseDic objectForKey:@"rd"]];
        }
    }
    else if ([webService.name isEqualToString:@"jr_time_per"]) {
        if ([[responseDic objectForKey:@"rc"] intValue]) {
            [self getPermissionSuccess:@"jr_time"];
        }
        else
        {
            [self.jrSelectView setSelectBtn:self.jrSelectView.preTag];
            [self.hud1 hide:YES];
            [RbtCommonTool showInfoAlert:[responseDic objectForKey:@"rd"]];
        }
    }
    else if([webService.name isEqualToString:@"jr_stop_per"]){
        if ([[responseDic objectForKey:@"rc"] intValue]) {
            [self getPermissionSuccess:@"jr_stop"];
        }
        else
        {
            [self.jrSelectView setSelectBtn:self.jrSelectView.preTag];
            [self.hud1 hide:YES];
            [RbtCommonTool showInfoAlert:[responseDic objectForKey:@"rd"]];
        }
    }
}

- (void)webServicefailed:(RbtWebManager *)webService{
    [super webServicefailed:webService];
    if([webService.name isEqualToString:@"sbweb"]){
        oneSheBei.iskzsb = YES;
        if (oneSheBei.isOn) {
            [oneSheBei.swi_sb setOn:NO];
        }
        else{
            [oneSheBei.swi_sb setOn:YES];
        }
    }
    else if ([webService.name isEqualToString:@"ss_auto"]) {
        [self.ssSelectView setSelectBtn:self.ssSelectView.preTag];
    }
    else if ([webService.name isEqualToString:@"ss_time"]) {
        [self.ssSelectView setSelectBtn:self.ssSelectView.preTag];
    }
    else if([webService.name isEqualToString:@"ss_stop"]){
        [self.ssSelectView setSelectBtn:self.ssSelectView.preTag];
    }
    else if ([webService.name isEqualToString:@"jr_auto"]) {
        [self.jrSelectView setSelectBtn:self.jrSelectView.preTag];
    }
    else if ([webService.name isEqualToString:@"jr_time"]) {
        [self.jrSelectView setSelectBtn:self.jrSelectView.preTag];
    }
    else if([webService.name isEqualToString:@"jr_stop"]){
        [self.jrSelectView setSelectBtn:self.jrSelectView.preTag];
    }
    
    if([webService.name isEqualToString:@"sbweb_per"]){
        oneSheBei.iskzsb = YES;
        if (oneSheBei.isOn) {
            [oneSheBei.swi_sb setOn:NO];
        }
        else{
            [oneSheBei.swi_sb setOn:YES];
        }
    }
    else if ([webService.name isEqualToString:@"ss_auto_per"]) {
        [self.ssSelectView setSelectBtn:self.ssSelectView.preTag];
    }
    else if ([webService.name isEqualToString:@"ss_time_per"]) {
        [self.ssSelectView setSelectBtn:self.ssSelectView.preTag];
    }
    else if([webService.name isEqualToString:@"ss_stop_per"]){
        [self.ssSelectView setSelectBtn:self.ssSelectView.preTag];
    }
    else if ([webService.name isEqualToString:@"jr_auto_per"]) {
        [self.jrSelectView setSelectBtn:self.jrSelectView.preTag];
    }
    else if ([webService.name isEqualToString:@"jr_time_per"]) {
        [self.jrSelectView setSelectBtn:self.jrSelectView.preTag];
    }
    else if([webService.name isEqualToString:@"jr_stop_per"]){
        [self.jrSelectView setSelectBtn:self.jrSelectView.preTag];
    }
}

#pragma  mark -DsViewdelegate
- (void)dsVc:(RbtYckzDsViewController *)dsVc
     andInfo:(NSDictionary *)info  isBack:(BOOL)isback{
    if (isSs) {
        if (isback) {
            [self.ssSelectView setSelectBtn:self.ssSelectView.preTag];
        }
        else{
            timeInfo  = info;
            RbtWebManager *webManager = [RbtWebManager getRbtManager:YES];
            webManager.delegate = self;
            webManager.name = @"ss_time_per";
            [self.hud1 show:YES];
            [webManager getgetpermissionWithU:[RbtUserModel sharedInstance].userName andP:[RbtProjectModel sharedInstance].projectid];
        }
    }
    else{
        if (isback) {
            [self.jrSelectView setSelectBtn:self.jrSelectView.preTag];
        }
        else{
            timeInfo = info;
            RbtWebManager *webManager = [RbtWebManager getRbtManager:YES];
            webManager.delegate = self;
            webManager.name = @"jr_time_per";
            [self.hud1 show:YES];
            [webManager getgetpermissionWithU:[RbtUserModel sharedInstance].userName andP:[RbtProjectModel sharedInstance].projectid];
        }
    }
}

- (NSArray *)getTimeArray{
    NSMutableArray *arr_time = [[NSMutableArray alloc] init];
    NSDictionary *dic_time1 = [NSDictionary dictionaryWithObjectsAndKeys:[timeInfo objectForKey:@"startTime1"],@"start",[timeInfo objectForKey:@"endTime1"],@"end",nil];
    NSDictionary *dic_time2 = [NSDictionary dictionaryWithObjectsAndKeys:[timeInfo objectForKey:@"startTime2"],@"start",[timeInfo objectForKey:@"endTime2"],@"end",nil];
    NSDictionary *dic_time3 = [NSDictionary dictionaryWithObjectsAndKeys:[timeInfo objectForKey:@"startTime3"],@"start",[timeInfo objectForKey:@"endTime3"],@"end",nil];
    [arr_time addObject:dic_time1];
    [arr_time addObject:dic_time2];
    [arr_time addObject:dic_time3];
    return arr_time;
}

- (void)showTheTime:(NSString *)name show:(BOOL)isShow{
    if ([name isEqualToString:@"ss"]) {
        if (isShow) {
            if (isTime_ss) {
                timeLab1.text = [NSString stringWithFormat:@"%@-%@", self.startTime1_ss, self.endTime1_ss];
                timeLab2.text = [NSString stringWithFormat:@"%@-%@", self.startTime2_ss, self.endTime2_ss];
                timeLab3.text = [NSString stringWithFormat:@"%@-%@", self.startTime3_ss, self.endTime3_ss];
                timeBgView.hidden = NO;
            }
            else{
                timeBgView.hidden = YES;
            }
        }
        else{
            timeBgView.hidden = YES;
        }
        timeBgView_jr.hidden = YES;
    }
    else if([name isEqualToString:@"jr"]) {
        if (isShow) {
            if (isTime_jr) {
                timeLab1_jr.text = [NSString stringWithFormat:@"%@-%@", self.startTime1_jr, self.endTime1_jr];
                timeLab2_jr.text = [NSString stringWithFormat:@"%@-%@", self.startTime2_jr, self.endTime2_jr];
                timeLab3_jr.text = [NSString stringWithFormat:@"%@-%@", self.startTime3_jr, self.endTime3_jr];
                timeBgView_jr.hidden = NO;
            }
            else{
                timeBgView_jr.hidden = YES;
            }
        }
        else{
             timeBgView_jr.hidden = YES;
        }
    }
    timeBgView.hidden = YES;
}

@end
