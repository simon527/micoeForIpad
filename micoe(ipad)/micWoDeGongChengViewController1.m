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

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = [RbtProjectModel sharedInstance].name;
	// Do any additional setup after loading the view.

    
    topTabbar = [[micTopTabbarView alloc] init];
    topTabbar.myDelegate = self;
    [self.view addSubview:topTabbar];
    
    viewTag = 1100;
    
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
    
    [self initViews];
    [self setItemsFrame:self.interfaceOrientation];
    
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

    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(xiaTabbarPressed:) name:@"tabbarpressed" object:nil];
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self setItemsFrame:self.interfaceOrientation];
}

-(void)xiaTabbarPressed:(NSNotification *)notif
{
    yunXingYuanLi.hidden = YES;
    yuanChengKongZhi.hidden = YES;
    shiShiShuJu.hidden = YES;
    liShiShuJu.hidden = YES;
    jieNengShiTu.hidden = YES;
    diTuDaoHang.hidden = YES;
    topTabbar.hidden = YES;
    wentifankuiVC.view.hidden = YES;
    tianqiyubaoVC.view.hidden = YES;
    settingVC.view.hidden = YES;
    NSString *str = [notif object];
    int tag = [str intValue];
    switch (tag) {
        case 310:
            topTabbar.hidden = NO;
            self.title = [RbtProjectModel sharedInstance].name;
//            yunXingYuanLi.hidden = NO;
            [[self.view viewWithTag:viewTag] setHidden:NO];
            break;
        case 311:
            self.title = @"问题反馈";
            wentifankuiVC.view.hidden = NO;
            
            break;
        case 312:
        {
            self.title = @"工程天气";

            NSLog(@"--%@", [RbtProjectModel sharedInstance].citycode);
            
            
            [tianqiyubaoVC postData];
            tianqiyubaoVC.view.hidden = NO;
            break;
        }
        case 313:
            self.title = @"设置";
            settingVC.view.hidden = NO;
            break;
            
        default:
            break;
    }

}

-(void)tabBarItemClicked:(int)tag
{
    [[self.view viewWithTag:viewTag] setHidden:YES];
    viewTag = tag+100;
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
            [self showYuanchenkongzhi];
//            [self setItemsFrame:self.interfaceOrientation];
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
                    [self showDitudaohang];
                }
            }

        }
            break;
            
        default:
            break;
    }
}

-(void)initViews
{
    yunXingYuanLi = [[micYunXingYuanLiView alloc] init];
    [yunXingYuanLi setTag:1100];
    yunXingYuanLi.hidden = YES;
    [self.view addSubview:yunXingYuanLi];
    
    yuanChengKongZhi = [[micyuanchengkongzhiView alloc] init];
    [yuanChengKongZhi setTag:1101];
    yuanChengKongZhi.hidden = YES;
    [self.view addSubview:yuanChengKongZhi];
    
    shiShiShuJu = [[micShiShiShuJuView alloc] init];
    [shiShiShuJu setTag:1102];
    shiShiShuJu.hidden = YES;
    [self.view addSubview:shiShiShuJu];
    
    liShiShuJu = [[micLiShiShuJuView alloc] init];
    [liShiShuJu setTag:1103];
    liShiShuJu.hidden = YES;
    [self.view addSubview:liShiShuJu];
    
    jieNengShiTu = [[micJieNengShiTu alloc] init];
    [jieNengShiTu setTag:1104];
    jieNengShiTu.hidden = YES;
    [self.view addSubview:jieNengShiTu];
    
    diTuDaoHang = [[micDiTuDaoHang alloc] init];
    [diTuDaoHang setTag:1105];
    diTuDaoHang.hidden = YES;
    [self.view addSubview:diTuDaoHang];
}

-(void)showView
{
    if (!yunXingYuanLi) {
        yunXingYuanLi = [[micYunXingYuanLiView alloc] init];
    }
    if (!yuanChengKongZhi) {
        yuanChengKongZhi = [[micyuanchengkongzhiView alloc] init];
    }
    if (!shiShiShuJu) {
        shiShiShuJu = [[micShiShiShuJuView alloc] init];
    }
    if (!liShiShuJu) {
        liShiShuJu = [[micLiShiShuJuView alloc] init];
    }
    if (!jieNengShiTu) {
        jieNengShiTu = [[micJieNengShiTu alloc] init];
    }
    if (!diTuDaoHang) {
        diTuDaoHang = [[micDiTuDaoHang alloc] init];
    }
    
    
    [[self.view viewWithTag:viewTag] setHidden:NO];
}

-(void)showYunxingyuanli
{
    if (!yunXingYuanLi) {
        yunXingYuanLi = [[micYunXingYuanLiView alloc] init];
        [yunXingYuanLi setTag:1100];
        yunXingYuanLi.hidden = YES;
        [self.view addSubview:yunXingYuanLi];
    }

    [[self.view viewWithTag:viewTag] setHidden:NO];
}

-(void)showYuanchenkongzhi
{
    if (!yuanChengKongZhi) {
        yuanChengKongZhi = [[micyuanchengkongzhiView alloc] init];

    }

    [[self.view viewWithTag:viewTag] setHidden:NO];
}

-(void)showShishishuju
{
    if (!shiShiShuJu) {
        shiShiShuJu = [[micShiShiShuJuView alloc] init];

    }
    
    [[self.view viewWithTag:viewTag] setHidden:NO];
}

-(void)showLishishuju
{
    
    
    if (liShiShuJu == nil) {
        liShiShuJu = [[micLiShiShuJuView alloc] init];

    }
    
    [[self.view viewWithTag:viewTag] setHidden:NO];
}

-(void)showJienengshitu
{
    if (!jieNengShiTu) {
        jieNengShiTu = [[micJieNengShiTu alloc] init];
    }
    
    [[self.view viewWithTag:viewTag] setHidden:NO];
}

-(void)showDitudaohang
{
    if (!diTuDaoHang) {
        diTuDaoHang = [[micDiTuDaoHang alloc] init];
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
            [self showJienengshitu];
        }
        else{
            if ([[responseDic objectForKey:@"rc"] intValue]) {
                NSDictionary *tempDIc = [responseDic objectForKey:@"rt"];
                [RbtDataOfResponse sharedInstance].jienengDic = tempDIc;
                [self showJienengshitu];
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
            [self showYunxingyuanli];
        }
        else{
            if ([[responseDic objectForKey:@"rc"] intValue]) {
                NSDictionary *tempDIc = [responseDic objectForKey:@"rt"];
                [RbtDataOfResponse sharedInstance].yuanlituDic = tempDIc;
                [self showYunxingyuanli];
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
            [self showShishishuju];
        }
        else{
            if ([[responseDic objectForKey:@"rc"] intValue]) {
                NSDictionary *tempDIc = [responseDic objectForKey:@"rt"];
                [RbtDataOfResponse sharedInstance].yuanlituDic = tempDIc;
                [self showShishishuju];
            }
            else
            {
                [RbtCommonTool showInfoAlert:[responseDic objectForKey:@"rd"]];
            }
        }
    }
    
    if ([webService.name isEqualToString:@"getgetpermission"]) {
        if ([[responseDic objectForKey:@"rc"] intValue]) {
        }
        else
        {
            [RbtCommonTool showInfoAlert:[responseDic objectForKey:@"rd"]];
        }
    }
    
    if ([webService.name isEqualToString:@"lishishuju"]) {
        if ([[responseDic objectForKey:@"rc"] intValue]) {
            
            [self showLishishuju];
        }
        else
        {
            [RbtCommonTool showInfoAlert:[responseDic objectForKey:@"rd"]];
        }
    }
    if ([webService.name isEqualToString:@"lishishuju1"]) {
        
        if ([RbtCommonTool getJinRuMode] == LiXianGongCheng) {
            [RbtDataOfResponse sharedInstance].lishishujuGongChengLieBiaoDic = responseDic;
            [self showLishishuju];
        }
        else{
            if ([[responseDic objectForKey:@"rc"] intValue]) {
                NSDictionary *tempDIc = [responseDic objectForKey:@"rt"];
                [RbtDataOfResponse sharedInstance].lishishujuGongChengLieBiaoDic = tempDIc;
                NSLog(@"bbb= %@", [RbtDataOfResponse sharedInstance].lishishujuGongChengLieBiaoDic);
                
                [self showLishishuju];
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
    [self setItemsFrame:self.interfaceOrientation];
}

-(void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
{
    [self setItemsFrame:toInterfaceOrientation];
}


-(void)setItemsFrame:(UIInterfaceOrientation)orientation
{
    if (orientation == UIInterfaceOrientationLandscapeLeft || orientation == UIInterfaceOrientationLandscapeRight)
    {
        NSArray *itemsArray = [[NSArray alloc] initWithObjects:[UIImage imageNamed:@"gctabBg"], [UIImage imageNamed:@"gctabbiankuang"], [UIImage imageNamed:@"gctabyunxingyuanli_h"], [UIImage imageNamed:@"gctabyuanchengkongzhi_h"], [UIImage imageNamed:@"gctabshishishuju_h"], [UIImage imageNamed:@"gctablishishuju_h"], [UIImage imageNamed:@"gctabjienengshitu_h"], [UIImage imageNamed:@"gctabditudaohang_h"], nil];
        float imageHeight = 341/2;
        float imageGap = 7;
        [micTopTabbarData shareInstance].imageGap = imageGap;
        [micTopTabbarData shareInstance].imageHeight = imageHeight;
        [micTopTabbarData shareInstance].itemsArray = itemsArray;
        topTabbar.frame = CGRectMake(0, 64, 1024, 185);
        CGRect vframe =  CGRectMake(0, topTabbar.frame.origin.y+topTabbar.frame.size.height, self.view.height, self.view.width- topTabbar.frame.origin.y-topTabbar.frame.size.height -49);
        yunXingYuanLi.frame = vframe;
        yuanChengKongZhi.frame = vframe;
        shiShiShuJu.frame = vframe;
        liShiShuJu.frame = vframe;
        jieNengShiTu.frame = vframe;
        diTuDaoHang.frame = vframe;
    }
    else
    {
        NSArray *itemsArray = [[NSArray alloc] initWithObjects:[UIImage imageNamed:@"gctabBg"], [UIImage imageNamed:@"gctabbiankuang"], [UIImage imageNamed:@"gctabyunxingyuanli"], [UIImage imageNamed:@"gctabyuanchengkongzhi"], [UIImage imageNamed:@"gctabshishishuju"], [UIImage imageNamed:@"gctablishishuju"], [UIImage imageNamed:@"gctabjienengshitu"], [UIImage imageNamed:@"gctabditudaohang"], nil];
        float imageHeight = 116;
        float imageGap = 7;
        [micTopTabbarData shareInstance].imageGap = imageGap;
        [micTopTabbarData shareInstance].imageHeight = imageHeight;
        [micTopTabbarData shareInstance].itemsArray = itemsArray;
        topTabbar.frame = CGRectMake(0, 64, 768, 130);
         CGRect vframe =  CGRectMake(0, topTabbar.frame.origin.y+topTabbar.frame.size.height, self.view.width, self.view.height- 194 -49);
        yunXingYuanLi.frame = vframe;
        yuanChengKongZhi.frame = vframe;
        shiShiShuJu.frame = vframe;
        liShiShuJu.frame = vframe;
        jieNengShiTu.frame = vframe;
        diTuDaoHang.frame = vframe;
    }
    
}





- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
