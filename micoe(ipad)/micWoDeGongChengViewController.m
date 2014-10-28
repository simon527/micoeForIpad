//
//  micWoDeGongChengViewController.m
//  micoe(ipad)
//
//  Created by Simon on 14-1-7.
//  Copyright (c) 2014年 Simon. All rights reserved.
//

#import "micWoDeGongChengViewController.h"
#import "micTopTabbarView.h"
#import "micyuanchengkongzhiView.h"
#import "RbtDataOfResponse.h"
#import "micTopTabbarData.h"

@interface micWoDeGongChengViewController ()

@end

@implementation micWoDeGongChengViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void)viewWillAppear:(BOOL)animated
{
    
    RbtWebManager *webManager;
    if([RbtCommonTool getJinRuMode] != LiXianGongCheng){
        webManager = [RbtWebManager getRbtManager:YES];
    }
    else{
        webManager = [RbtWebManager getRbtManager:NO];
    }
    
    if ([[RbtUserModel sharedInstance].yxyl isEqualToString:@"n"]) {
        [RbtCommonTool showInfoAlert:@"用户无权限"];
    }
    else{
        webManager.name = @"yuanlituWeb";
        webManager.delegate = self;
        [self.hud1 show:YES];
        [webManager getrunprincipleWithP:[RbtProjectModel sharedInstance].projectid];
    }
    
    [[NSUserDefaults standardUserDefaults] setObject:@"1" forKey:@"wodegongcheng"];
    [super viewWillAppear:animated];
    selectIndex = 1000;
    [self setItemsFrame:self.interfaceOrientation];
    int aa = [[[NSUserDefaults standardUserDefaults] objectForKey:@"selectIndex"] integerValue];
    [self tabBarItemClicked:aa];
}



- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = [RbtProjectModel sharedInstance].name;
	// Do any additional setup after loading the view.

    isFirstShow = YES;
    isWoDeGongCheng = YES;
    
    topTabbar = [[micTopTabbarView alloc] init];
    topTabbar.myDelegate = self;
    [self.view addSubview:topTabbar];
    if (self.interfaceOrientation == UIInterfaceOrientationLandscapeLeft || self.interfaceOrientation == UIInterfaceOrientationLandscapeRight)
    {
        viewTag = 1100;
    }
    else
    {
        viewTag = 1110;
    }

    
    
    wentifankuiVC = [[micWenTiFanKuiViewController alloc] init];
    [wentifankuiVC.view setTag:301];
    tianqiyubaoVC = [[micTianQiYuBaoViewController alloc] init];
    [tianqiyubaoVC.view setTag:302];
    settingVC = [[micSettingViewController alloc] init];
    [settingVC.view setTag:303];
    [self.view insertSubview:wentifankuiVC.view atIndex:0];
    [self.view insertSubview:tianqiyubaoVC.view atIndex:0];
    [self.view insertSubview:settingVC.view atIndex:0];
    wentifankuiVC.view.hidden = YES;
    tianqiyubaoVC.view.hidden = YES;
    settingVC.view.hidden = YES;
    


    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(xiaTabbarPressed:) name:@"tabbarpressed" object:nil];
}


-(void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    
//    [self tabBarItemClicked:selectIndex];
//    [micTopTabbarData shareInstance].selectIndex = 0;
}

-(void)xiaTabbarPressed:(NSNotification *)notif
{
    yunXingYuanLi.hidden = YES;
    yuanChengKongZhi.hidden = YES;
    shiShiShuJu.hidden = YES;
    liShiShuJu.hidden = YES;
    jieNengShiTu.hidden = YES;
    diTuDaoHang.hidden = YES;
    
    yunXingYuanLi_h.hidden = YES;
    yuanChengKongZhi_h.hidden = YES;
    shiShiShuJu_h.hidden = YES;
    liShiShuJu_h.hidden = YES;
    jieNengShiTu_h.hidden = YES;
    diTuDaoHang_h.hidden = YES;
    
    topTabbar.hidden = YES;
    wentifankuiVC.view.hidden = YES;
    tianqiyubaoVC.view.hidden = YES;
    settingVC.view.hidden = YES;
    NSString *str = [notif object];
    int tag = [str intValue];
    [self.customTabbar setSelectBtn:tag];
    [self.customTabbar_h setSelectBtn:tag];
    switch (tag) {
        case 310:
            topTabbar.hidden = NO;
            self.title = [RbtProjectModel sharedInstance].name;
            [[self.view viewWithTag:viewTag] setHidden:NO];
            isWoDeGongCheng = YES;
            break;
        case 311:
            self.title = @"问题反馈";
            wentifankuiVC.view.hidden = NO;
            isWoDeGongCheng = NO;
            break;
        case 312:
        {
            self.title = @"工程天气";
            
//            [tianqiyubaoVC initViewswithBaidu];
            tianqiyubaoVC.view.hidden = NO;
            isWoDeGongCheng = NO;
            [self.hud1 show:YES];
            RbtWebManager *tqybweb = [[RbtWebManager alloc] init];
            tqybweb.name = @"tqybwebwithBaidu";
            tqybweb.delegate =self;
            //                [tqybweb getWeatherInfo:[RbtProjectModel sharedInstance].citycode];
//            [tqybweb getWeatherInfowithBaidu:[NSString stringWithFormat:@"%f,%f",[[RbtProjectModel sharedInstance].longitude doubleValue],[[RbtProjectModel sharedInstance].latitude doubleValue]]];
//            [tqybweb getWeatherInfowithBaidu:[RbtProjectModel sharedInstance].city];
            NSString *cityStr = [RbtProjectModel sharedInstance].city;
            NSString *ccity;
            NSArray *cityArr = [cityStr componentsSeparatedByString:@","];
            if (cityArr.count == 1) {
                ccity = cityStr;
            }
            else
            {
                ccity = [cityArr objectAtIndex:1];
            }
            [tqybweb getWeatherInfowithBaidu:ccity];
            break;
        }
        case 313:
            self.title = @"设置";
            settingVC.view.hidden = NO;
            isWoDeGongCheng = NO;
            break;
            
        default:
            break;
    }

}

-(void)tabBarItemClicked:(int)tag
{
    selectIndex = tag;
    [[NSUserDefaults standardUserDefaults] setObject:[NSString stringWithFormat:@"%d", tag] forKey:@"selectIndex"];
    [[self.view viewWithTag:viewTag] setHidden:YES];
    viewTag = tag+100;
    if (UIInterfaceOrientationIsLandscape(self.interfaceOrientation)) {
        viewTag = viewTag + 10;
    }
    RbtWebManager *webManager;
    if([RbtCommonTool getJinRuMode] != LiXianGongCheng){
        webManager = [RbtWebManager getRbtManager:YES];
    }
    else{
        webManager = [RbtWebManager getRbtManager:NO];
    }
    
    switch (tag) {
        case 1000:
        {
            if ([[RbtUserModel sharedInstance].yxyl isEqualToString:@"n"]) {
                [RbtCommonTool showInfoAlert:@"用户无权限"];
            }
            else{
                webManager.name = @"yuanlituWeb";
                webManager.delegate = self;
                [self.hud1 show:YES];
                [webManager getrunprincipleWithP:[RbtProjectModel sharedInstance].projectid];
            }

        }
            break;
        case 1001:
        {
            [self showYuanchenkongzhiWithInterfaceOrientation:self.interfaceOrientation];
        }
            break;
        case 1002:
        {
            if ([[RbtUserModel sharedInstance].sssj isEqualToString:@"n"]) {
                [RbtCommonTool showInfoAlert:@"用户无权限"];
            }
            else{
                webManager.name = @"shishishuju";
                webManager.delegate = self;
                [self.hud1 show:YES];
                [webManager getrunprincipleWithP:[RbtProjectModel sharedInstance].projectid];
            }

        }
            break;
        case 1003:
        {
            if ([[RbtUserModel sharedInstance].lssj isEqualToString:@"n"]) {
                [RbtCommonTool showInfoAlert:@"用户无权限"];
            }
            else{
                [self.hud1 show:YES];
                webManager.name = @"lishishuju1";
                webManager.delegate = self;
                [webManager getrunprincipleWithP:[RbtProjectModel sharedInstance].projectid];
            }

        }
            break;
        case 1004:
        {
            if ([[RbtUserModel sharedInstance].jnst isEqualToString:@"n"]) {
                [RbtCommonTool showInfoAlert:@"用户无权限"];
            }
            else{
                webManager.name = @"jienengweb";
                webManager.delegate = self;
                [self.hud1 show:YES];
                [webManager getJieNengInfoWithU:[RbtUserModel sharedInstance].userName withP:[RbtProjectModel sharedInstance].projectid andT:@"1"];
            }

        }
            break;
        case 1005:
        {
            if ([RbtCommonTool getJinRuMode] == LiXianGongCheng) {
                [RbtCommonTool showInfoAlert:@"请登录后查看"];
            }
            else{
                if ([[RbtUserModel sharedInstance].gisdw isEqualToString:@"n"]) {
                    [RbtCommonTool showInfoAlert:@"用户无权限"];
                }
                else{
                    [self showDitudaohangWithInterfaceOrientation:self.interfaceOrientation];
                }
            }

        }
            break;
            
        default:
            break;
    }
}

-(void)showView
{
    if (!yunXingYuanLi) {
        yunXingYuanLi = [[micYunXingYuanLiView alloc] initWithFrame:CGRectMake(0, 20+44+130, 768, 1024- 194 -49)];
        [yunXingYuanLi setTag:1100];
        yunXingYuanLi.hidden = YES;
        [self.view addSubview:yunXingYuanLi];
    }
    if (!yuanChengKongZhi) {
        yuanChengKongZhi = [[micyuanchengkongzhiView alloc] initWithFrame:CGRectMake(0, 20+44+130, self.view.width, self.view.height- 194 -49)];
        [yuanChengKongZhi setTag:1101];
        yuanChengKongZhi.hidden = YES;
        [self.view addSubview:yuanChengKongZhi];
    }
    if (!shiShiShuJu) {
        shiShiShuJu = [[micShiShiShuJuView alloc] initWithFrame:CGRectMake(0, 20+44+130, self.view.width, self.view.height- 194 -49)];
        [shiShiShuJu setTag:1102];
        shiShiShuJu.hidden = YES;
        [self.view addSubview:shiShiShuJu];
    }
    if (!liShiShuJu) {
        liShiShuJu = [[micLiShiShuJuView alloc] initWithFrame:CGRectMake(0, 20+44+130, self.view.width, self.view.height- 194 -49)];
        [liShiShuJu setTag:1103];
        liShiShuJu.hidden = YES;
        [self.view addSubview:liShiShuJu];
    }
    if (!jieNengShiTu) {
        jieNengShiTu = [[micJieNengShiTu alloc] initWithFrame:CGRectMake(0, 20+44+130, self.view.width, self.view.height- 194 -49)];
        [jieNengShiTu setTag:1104];
        jieNengShiTu.hidden = YES;
        [self.view addSubview:jieNengShiTu];
    }
    if (!diTuDaoHang) {
        diTuDaoHang = [[micDiTuDaoHang alloc] initWithFrame:CGRectMake(0, 20+44+130, self.view.width, self.view.height- 194 -49)];
        [diTuDaoHang setTag:1105];
        diTuDaoHang.hidden = YES;
        
        [self.view addSubview:diTuDaoHang];
    }
    
    
    [[self.view viewWithTag:viewTag] setHidden:NO];
}


-(void)fitstShowYunxingyuanliWithInterfaceOrientation:(UIInterfaceOrientation)orientation
{
    if (!yunXingYuanLi) {
        yunXingYuanLi = [[micYunXingYuanLiView alloc] initWithFrame:CGRectMake(0, 20+44+130, 768, 1024- 194 -49)];
        [yunXingYuanLi setTag:1100];
        [self.view addSubview:yunXingYuanLi];
    }
    if (!yunXingYuanLi_h) {
        yunXingYuanLi_h = [[micYunXingYuanLiView_h alloc] initWithFrame:CGRectMake(0, 20+44+130, 1024, 768 - 194 -49)];
        [yunXingYuanLi_h setTag:1110];
        [self.view addSubview:yunXingYuanLi_h];
    }
    if (orientation == UIInterfaceOrientationLandscapeLeft || orientation == UIInterfaceOrientationLandscapeRight)
    {
        yunXingYuanLi.hidden = YES;
    }
    else
    {
        yunXingYuanLi_h.hidden = YES;
    }
    
}

-(void)showYunxingyuanliWithInterfaceOrientation:(UIInterfaceOrientation)orientation
{
    if (!yunXingYuanLi) {
        yunXingYuanLi = [[micYunXingYuanLiView alloc] initWithFrame:CGRectMake(0, 20+44+130, 768, 1024- 194 -49)];
        [yunXingYuanLi setTag:1100];
        [self.view addSubview:yunXingYuanLi];
    }
    if (!yunXingYuanLi_h) {
        yunXingYuanLi_h = [[micYunXingYuanLiView_h alloc] initWithFrame:CGRectMake(0, 20+44+130, 1024, 768 - 194 -49)];
        [yunXingYuanLi_h setTag:1110];
        [self.view addSubview:yunXingYuanLi_h];
    }

    [[self.view viewWithTag:viewTag] setHidden:NO];
}

-(void)showYuanchenkongzhiWithInterfaceOrientation:(UIInterfaceOrientation)orientation
{
    if (!yuanChengKongZhi) {
        yuanChengKongZhi = [[micyuanchengkongzhiView alloc] initWithFrame:CGRectMake(0, 20+44+130, 768, 1024- 194 -49)];
        [yuanChengKongZhi setTag:1101];
        yuanChengKongZhi.hidden = YES;
        [self.view addSubview:yuanChengKongZhi];
    }
    if (!yuanChengKongZhi_h) {
        yuanChengKongZhi_h = [[micyuanchengkongzhiView_h alloc] initWithFrame:CGRectMake(0, 20+44+130, 1024, 768- 194 -49)];
        [yuanChengKongZhi_h setTag:1111];
        yuanChengKongZhi_h.hidden = YES;
        [self.view addSubview:yuanChengKongZhi_h];
    }

    [[self.view viewWithTag:viewTag] setHidden:NO];
}

-(void)showShishishujuWithInterfaceOrientation:(UIInterfaceOrientation)orientation
{
    if (!shiShiShuJu) {
        shiShiShuJu = [[micShiShiShuJuView alloc] initWithFrame:CGRectMake(0, 20+44+130, 768, 1024- 194 -49)];
        [shiShiShuJu setTag:1102];
        shiShiShuJu.hidden = YES;
        [self.view addSubview:shiShiShuJu];
    }
    if (!shiShiShuJu_h) {
        shiShiShuJu_h = [[micShiShiShuJuView_h alloc] initWithFrame:CGRectMake(0, 20+44+130, 1024, 768- 194 -49)];
        [shiShiShuJu_h setTag:1112];
        shiShiShuJu_h.hidden = YES;
        [self.view addSubview:shiShiShuJu_h];
    }

    
    [[self.view viewWithTag:viewTag] setHidden:NO];
}

-(void)showLishishujuWithInterfaceOrientation:(UIInterfaceOrientation)orientation
{
    if (!liShiShuJu) {
        liShiShuJu = [[micLiShiShuJuView alloc] initWithFrame:CGRectMake(0, 20+44+130, 768, 1024- 194 -49)];
        [liShiShuJu setTag:1103];
        liShiShuJu.hidden = YES;
        [self.view addSubview:liShiShuJu];
    }
    if (!liShiShuJu_h) {
        liShiShuJu_h = [[micLiShiShuJuView_h alloc] initWithFrame:CGRectMake(0, 20+44+130, 1024, 768- 194 -49)];
        [liShiShuJu_h setTag:1113];
        liShiShuJu_h.hidden = YES;
        [self.view addSubview:liShiShuJu_h];
    }
    
    [[self.view viewWithTag:viewTag] setHidden:NO];
}

-(void)showJienengshituWithInterfaceOrientation:(UIInterfaceOrientation)orientation
{
    if (!jieNengShiTu) {
        jieNengShiTu = [[micJieNengShiTu alloc] initWithFrame:CGRectMake(0, 20+44+130, 768, 1024- 194 -49)];
        [jieNengShiTu setTag:1104];
        jieNengShiTu.hidden = YES;
        [self.view addSubview:jieNengShiTu];
    }
    if (!jieNengShiTu_h) {
        jieNengShiTu_h = [[micJieNengShiTu_h alloc] initWithFrame:CGRectMake(0, 20+44+130, 1024, 768- 194 -49)];
        [jieNengShiTu_h setTag:1114];
        jieNengShiTu_h.hidden = YES;
        [self.view addSubview:jieNengShiTu_h];
    }
    
    [[self.view viewWithTag:viewTag] setHidden:NO];
}

-(void)showDitudaohangWithInterfaceOrientation:(UIInterfaceOrientation)orientation
{
    if (!diTuDaoHang) {
        diTuDaoHang = [[micDiTuDaoHang alloc] initWithFrame:CGRectMake(0, 20+44+130, 768, 1024- 194 -49)];
        [diTuDaoHang setTag:1105];
        diTuDaoHang.hidden = YES;
        
        [self.view addSubview:diTuDaoHang];
    }
    if (!diTuDaoHang_h) {
        diTuDaoHang_h = [[micDiTuDaoHang_h alloc] initWithFrame:CGRectMake(0, 20+44+130, 1024, 768- 194 -49)];
        [diTuDaoHang_h setTag:1115];
        diTuDaoHang_h.hidden = YES;
        
        [self.view addSubview:diTuDaoHang_h];
    }

    
    [[self.view viewWithTag:viewTag] setHidden:NO];
}


#pragma mark- request delegate 
- (void)onDataLoadWithService:(RbtWebManager *)webService
                  andResponse:(NSDictionary *)responseDic
{
    [super onDataLoadWithService:webService andResponse:responseDic];
    if ([webService.name isEqualToString:@"jienengweb"]) {
        if ([RbtCommonTool getJinRuMode] == LiXianGongCheng) {
            [RbtDataOfResponse sharedInstance].jienengDic = responseDic;
            [self showJienengshituWithInterfaceOrientation:self.interfaceOrientation];
        }
        else{
            if ([[responseDic objectForKey:@"rc"] intValue]) {
                NSDictionary *tempDIc = [responseDic objectForKey:@"rt"];
                [RbtDataOfResponse sharedInstance].jienengDic = tempDIc;
                
                [self showJienengshituWithInterfaceOrientation:self.interfaceOrientation];
            }
            else
            {
                [RbtCommonTool showInfoAlert:[responseDic objectForKey:@"rd"]];
            }
        }
    }
    
    if ([webService.name isEqualToString:@"yuanlituWeb"]) {
        if ([RbtCommonTool getJinRuMode] == LiXianGongCheng) {
            [RbtDataOfResponse sharedInstance].yuanlituDic = responseDic;
            [self showYunxingyuanliWithInterfaceOrientation:self.interfaceOrientation];
        }
        else{
            if ([[responseDic objectForKey:@"rc"] intValue]) {
                NSDictionary *tempDIc = [responseDic objectForKey:@"rt"];
                [RbtDataOfResponse sharedInstance].yuanlituDic = tempDIc;
                
                if (isFirstShow) {
                    isFirstShow = NO;
                    [self fitstShowYunxingyuanliWithInterfaceOrientation:self.interfaceOrientation];
                }
                else
                {
                    [self showYunxingyuanliWithInterfaceOrientation:self.interfaceOrientation];
                }
                
            }
            else
            {
                [RbtCommonTool showInfoAlert:[responseDic objectForKey:@"rd"]];
            }
        }
    }
    
    if ([webService.name isEqualToString:@"shishishuju"]) {
        if ([RbtCommonTool getJinRuMode] == LiXianGongCheng) {
            [RbtDataOfResponse sharedInstance].yuanlituDic = responseDic;
            [self showShishishujuWithInterfaceOrientation:self.interfaceOrientation];
        }
        else{
            if ([[responseDic objectForKey:@"rc"] intValue]) {
                NSDictionary *tempDIc = [responseDic objectForKey:@"rt"];
                [RbtDataOfResponse sharedInstance].yuanlituDic = tempDIc;
                [self showShishishujuWithInterfaceOrientation:self.interfaceOrientation];
            }
            else
            {
                [RbtCommonTool showInfoAlert:[responseDic objectForKey:@"rd"]];
            }
        }
    }
    
    if ([webService.name isEqualToString:@"getgetpermission"]) {
        if ([[responseDic objectForKey:@"rc"] intValue]) {
//            [self showView];
        }
        else
        {
            [RbtCommonTool showInfoAlert:[responseDic objectForKey:@"rd"]];
        }
    }
    
    if ([webService.name isEqualToString:@"lishishuju"]) {
        if ([[responseDic objectForKey:@"rc"] intValue]) {
            
            [self showLishishujuWithInterfaceOrientation:self.interfaceOrientation];
        }
        else
        {
            [RbtCommonTool showInfoAlert:[responseDic objectForKey:@"rd"]];
        }
    }
    if ([webService.name isEqualToString:@"lishishuju1"]) {
        
        if ([RbtCommonTool getJinRuMode] == LiXianGongCheng) {
            [RbtDataOfResponse sharedInstance].lishishujuGongChengLieBiaoDic = responseDic;
            [self showLishishujuWithInterfaceOrientation:self.interfaceOrientation];
        }
        else{
            if ([[responseDic objectForKey:@"rc"] intValue]) {
                NSDictionary *tempDIc = [responseDic objectForKey:@"rt"];
                [RbtDataOfResponse sharedInstance].lishishujuGongChengLieBiaoDic = tempDIc;
                NSLog(@"bbb= %@", [RbtDataOfResponse sharedInstance].lishishujuGongChengLieBiaoDic);
                
                [self showLishishujuWithInterfaceOrientation:self.interfaceOrientation];
            }
            else
            {
                [RbtCommonTool showInfoAlert:[responseDic objectForKey:@"rd"]];
            }
        }
        
    }
    
    if ([webService.name isEqualToString:@"tqybweb"]){
        tianqiyubaoVC.isShouYe = NO;
        tianqiyubaoVC.weatherInfo = responseDic;
        [tianqiyubaoVC initViews];
        tianqiyubaoVC.view.hidden = NO;

    }
    
   if ([webService.name isEqualToString:@"tqybwebwithBaidu"]){
       tianqiyubaoVC.isShouYe = NO;
       tianqiyubaoVC.weatherInfo = responseDic;
       [tianqiyubaoVC initViewswithBaidu];
       tianqiyubaoVC.view.hidden = NO;
   }

    
}

-(void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
{
    [super willRotateToInterfaceOrientation:toInterfaceOrientation duration:duration];
    [self setItemsFrame:toInterfaceOrientation];
}


-(void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation
{

     NSLog(@"w= %f, h = %f", self.view.size.width, self.view.size.height);
    
}


-(void)setItemsFrame:(UIInterfaceOrientation)orientation
{
    if (isWoDeGongCheng) {
        if (orientation == UIInterfaceOrientationLandscapeLeft || orientation == UIInterfaceOrientationLandscapeRight)
        {
            
            NSArray *itemsArray = [[NSArray alloc] initWithObjects:[UIImage imageNamed:@"gctabBg_h"], [UIImage imageNamed:@"gctabbiankuang_h"], [UIImage imageNamed:@"gctabyunxingyuanli_h"], [UIImage imageNamed:@"gctabyuanchengkongzhi_h"], [UIImage imageNamed:@"gctabshishishuju_h"], [UIImage imageNamed:@"gctablishishuju_h"], [UIImage imageNamed:@"gctabjienengshitu_h"], [UIImage imageNamed:@"gctabditudaohang_h"], nil];
            float imageHeight = 116;
            float imageGap = 7;
            [micTopTabbarData shareInstance].imageGap = imageGap;
            [micTopTabbarData shareInstance].imageHeight = imageHeight;
            [micTopTabbarData shareInstance].itemsArray = itemsArray;
            [micTopTabbarData shareInstance].selectIndex = selectIndex;
            topTabbar.frame = CGRectMake(0, 64, 1024, 130);
            [self.view viewWithTag:viewTag].hidden = YES;
            viewTag = viewTag + 10;
            NSLog(@"%d", [[NSUserDefaults standardUserDefaults] boolForKey:@"isLishishujuTableShow"]);
            if ([[NSUserDefaults standardUserDefaults] boolForKey:@"isLishishujuTableShow"]) {
                [liShiShuJu_h lnButtonClicked];
            }
            else{
                [liShiShuJu_h xxtButtonClicked];
            }
            NSLog(@"heng name = %@", [[NSUserDefaults standardUserDefaults] objectForKey:@"lishiChooseTime"]);
            
            [liShiShuJu_h timeButtonWithName:[[NSUserDefaults standardUserDefaults] objectForKey:@"lishiChooseTime"]];
            [liShiShuJu_h typeButtonWithIndex:[[NSUserDefaults standardUserDefaults] objectForKey:@"lishiChooseNameTag"]];
            
            [jieNengShiTu_h timeBtnWithTagstr:[[NSUserDefaults standardUserDefaults] objectForKey:@"jienengChooseTime"]];
            [jieNengShiTu_h jienengBtnWithTagstr:[[NSUserDefaults standardUserDefaults] objectForKey:@"jienengChooseType"]];
            
            
            [yuanChengKongZhi_h setButtomButtonHidden];
        }
        else
        {
            NSArray *itemsArray = [[NSArray alloc] initWithObjects:[UIImage imageNamed:@"gctabBg"], [UIImage imageNamed:@"gctabbiankuang"], [UIImage imageNamed:@"gctabyunxingyuanli"], [UIImage imageNamed:@"gctabyuanchengkongzhi"], [UIImage imageNamed:@"gctabshishishuju"], [UIImage imageNamed:@"gctablishishuju"], [UIImage imageNamed:@"gctabjienengshitu"], [UIImage imageNamed:@"gctabditudaohang"], nil];
            float imageHeight = 116;
            float imageGap = 7;
            [micTopTabbarData shareInstance].imageGap = imageGap;
            [micTopTabbarData shareInstance].imageHeight = imageHeight;
            [micTopTabbarData shareInstance].itemsArray = itemsArray;
            [micTopTabbarData shareInstance].selectIndex = selectIndex;
            topTabbar.frame = CGRectMake(0, 64, 768, 130);
            [self.view viewWithTag:viewTag].hidden = YES;
            viewTag = viewTag - 10;
            
            if ([[NSUserDefaults standardUserDefaults] boolForKey:@"isLishishujuTableShow"]) {
                [liShiShuJu lnButtonClicked];
            }
            else{
                [liShiShuJu xxtButtonClicked];
            }
            NSLog(@"shu name = %@", [[NSUserDefaults standardUserDefaults] objectForKey:@"lishiChooseTime"]);
            
            [liShiShuJu timeButtonWithName:[[NSUserDefaults standardUserDefaults] objectForKey:@"lishiChooseTime"]];
            [liShiShuJu typeButtonWithIndex:[[NSUserDefaults standardUserDefaults] objectForKey:@"lishiChooseNameTag"]];
            
            [jieNengShiTu timeBtnWithTagstr:[[NSUserDefaults standardUserDefaults] objectForKey:@"jienengChooseTime"]];
            [jieNengShiTu jienengBtnWithTagstr:[[NSUserDefaults standardUserDefaults] objectForKey:@"jienengChooseType"]];
            
            
            [yuanChengKongZhi setButtomButtonHidden];
        }
        [self.view viewWithTag:viewTag].hidden = NO;
        
        
    }
    [wentifankuiVC setItemsFrame:orientation];
    [settingVC setItemsFrame:orientation];
    [tianqiyubaoVC setItemsFrame:orientation];
    
}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [yunXingYuanLi.timer invalidate];
    [yunXingYuanLi_h.timer invalidate];
    [[NSUserDefaults standardUserDefaults] setObject:@"0" forKey:@"wodegongcheng"];
    
    topTabbar.hidden = NO;
    self.title = [RbtProjectModel sharedInstance].name;
    [[self.view viewWithTag:1000] setHidden:NO];
    isWoDeGongCheng = YES;
//    [[NSUserDefaults standardUserDefaults] setObject:@"1000" forKey:@"selectIndex"];
    [self showYunxingyuanliWithInterfaceOrientation:self.interfaceOrientation];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
