//
//  micLoginViewController.m
//  micoe(ipad)
//
//  Created by Simon on 14-1-13.
//  Copyright (c) 2014年 Simon. All rights reserved.
//

#import "micLoginViewController.h"
#import "DCRoundSwitch.h"
#import "micLoginWaitViewController.h"
#import "micGeDiGongChengViewController.h"
#import "micTianQiYuBaoViewController.h"
#import "micXiTongGongGaoViewController.h"


#define FONTSIZE    22

@interface micLoginViewController ()
{
    UIImageView *loginBG;
    UIImageView *login_inputbg;
    UILabel *labUser;
    UILabel *labPassword;
    DCRoundSwitch *btnSwitch;
    UILabel *labLoginAuto;
    UIButton *btn_ServerUrl;
    UIButton *loginBtn;
    UIButton *forgetPassword;
    UIButton *btn_gedigongcheng;
    UIButton *btn_tianqiyubao;
    UIButton *btn_xitonggonggao;
    UIButton *btn_lixianyanshi;
}

@property (strong, nonatomic)  micLoginWaitViewController *loginWaitVC;

@end

@implementation micLoginViewController

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
	// Do any additional setup after loading the view.
    [self initViews];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES];
    [self setItemsFrame:self.interfaceOrientation];
}

- (void)viewWillDisappear:(BOOL)animated{
    [self.textF_Username resignFirstResponder];
    [self.textF_Password resignFirstResponder];
    self.view.frame = CGRectMake(0, 0, ScreenWidth, ScreenHeight);
    [super viewWillDisappear:animated];
}

- (void)initViews{
    
    self.scrollView = [[UIControl alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight)];
    [self.view addSubview:self.scrollView];
    [self.scrollView addTarget:self action:@selector(backgroundTap) forControlEvents:UIControlEventTouchDown];
    
    loginBG = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"loginBG"]];
    [self.scrollView addSubview:loginBG];
    
//    UIImageView *imgLogo = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"logo"]];
//    [self.scrollView addSubview:imgLogo];
    
    login_inputbg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"login_inputbg"]];
    [self.scrollView addSubview:login_inputbg];
    
    labUser = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 80, 60)];
    [labUser setFont:[UIFont fontWithName:kFontName size:FONTSIZE]];
    labUser.text = @"用户名";
    [self.scrollView addSubview:labUser];
    
    labPassword = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 80, 60)];
    [labPassword setFont:[UIFont fontWithName:kFontName size:FONTSIZE]];
    labPassword.text = @"密    码";
    [self.scrollView addSubview:labPassword];
    
    self.textF_Username = [[UITextField alloc] init];
    self.textF_Username.delegate = self;
    [self.textF_Username setAutocapitalizationType:UITextAutocapitalizationTypeNone];
    [self.textF_Username setReturnKeyType:UIReturnKeyDone];
    self.textF_Username.placeholder = @"username";
    [self.textF_Username setFont:[UIFont systemFontOfSize:FONTSIZE]];
    [self.scrollView addSubview:self.textF_Username];
    
    self.textF_Password = [[UITextField alloc] init];
    self.textF_Password.delegate = self;
    [self.textF_Password setReturnKeyType:UIReturnKeyDone];
    [self.textF_Password setAutocapitalizationType:UITextAutocapitalizationTypeNone];
    [self.textF_Password setSecureTextEntry:YES];
    self.textF_Password.placeholder = @"password";
    [self.textF_Password setFont:[UIFont systemFontOfSize:FONTSIZE]];
    [self.scrollView addSubview:self.textF_Password];
    
    labLoginAuto = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 40)];
    labLoginAuto.text = @"自动登录";
    [labLoginAuto setFont:[UIFont fontWithName:kFontName size:FONTSIZE]];
    labLoginAuto.textColor = [UIColor colorWithRed:71/255.0 green:190/255.0 blue:184/255.0 alpha:1];
    [self.scrollView addSubview:labLoginAuto];
    
    btn_ServerUrl = [UIButton buttonWithType:UIButtonTypeCustom];
//    NSAttributedString *btn_ServerUrlTitle = [[NSAttributedString alloc] initWithString:@"设置" attributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIFont fontWithName:kFontName size:20],UITextAttributeFont,[UIColor colorWithRed:71/255.0 green:190/255.0 blue:184/255.0 alpha:1],UITextAttributeTextColor, nil]];
//    [btn_ServerUrl setAttributedTitle:btn_ServerUrlTitle forState:UIControlStateNormal];
    [btn_ServerUrl setFrame:CGRectMake(self.scrollView.width-110, 20, 110, 32)];
    [btn_ServerUrl setImage:[UIImage imageNamed:@"login_shezhi"] forState:UIControlStateNormal];
    [btn_ServerUrl addTarget:self action:@selector(btn_ServerUrlPressed) forControlEvents:UIControlEventTouchUpInside];
    [self.scrollView addSubview:btn_ServerUrl];
    
    //    UISwitch *btnSwitch = [[UISwitch alloc] initWithFrame:CGRectMake(0, 0, 80, 34)];
    //    btnSwitch.tintColor = [UIColor colorWithRed:71/255.0 green:190/255.0 blue:184/255.0 alpha:1];
    //     btnSwitch.onTintColor = [UIColor colorWithRed:71/255.0 green:190/255.0 blue:184/255.0 alpha:1];
    //     btnSwitch.transform = CGAffineTransformMakeScale(0.6, 0.6);
    //    [self.view addSubview:btnSwitch];
    
    btnSwitch = [[DCRoundSwitch alloc] initWithFrame:CGRectMake(0, 0, 50, 20)];
    btnSwitch.onTintColor = [UIColor colorWithRed:71/255.0 green:190/255.0 blue:184/255.0 alpha:1];
    [btnSwitch addTarget:self action:@selector(swithValueChanged:) forControlEvents:UIControlEventValueChanged];
    [self.scrollView addSubview:btnSwitch];
    
    self.isAutoLogin = NO;
    
    NSArray *loginInfo = [RbtCommonTool getLogin];
    if (loginInfo != Nil & [loginInfo count] != 0) {
        if ([loginInfo count] == 3) {
            self.isAutoLogin = [(NSNumber *)[loginInfo objectAtIndex:0] boolValue];
            if (self.isAutoLogin) {
                [btnSwitch setOn:YES];
                self.textF_Username.text = [loginInfo objectAtIndex:1];
                self.textF_Password.text = [loginInfo objectAtIndex:2];
            }
        }
    }
    
    loginBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [loginBtn setImage:[UIImage imageNamed:@"login"] forState:UIControlStateNormal];
    [self.scrollView addSubview:loginBtn];
    [loginBtn addTarget:self action:@selector(loginBtnPressed) forControlEvents:UIControlEventTouchUpInside];
    
    forgetPassword = [UIButton buttonWithType:UIButtonTypeSystem];
    [forgetPassword setTitle:@"忘记密码" forState:UIControlStateNormal];
    [forgetPassword setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [forgetPassword addTarget:self action:@selector(getPasswordBtnPressed) forControlEvents:UIControlEventTouchUpInside];
    [self.scrollView addSubview:forgetPassword];
    
    btn_gedigongcheng = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn_gedigongcheng setImage:[UIImage imageNamed:@"login_gedigongcheng"] forState:UIControlStateNormal];
    [self.scrollView addSubview:btn_gedigongcheng];
    [btn_gedigongcheng addTarget:self action:@selector(btn_gedigongchengPressed) forControlEvents:UIControlEventTouchUpInside];
    
    btn_tianqiyubao = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn_tianqiyubao setImage:[UIImage imageNamed:@"login_tianqiyubao"] forState:UIControlStateNormal];
    [btn_tianqiyubao addTarget:self action:@selector(btn_tianqiyubaoPressed) forControlEvents:UIControlEventTouchUpInside];
    [self.scrollView addSubview:btn_tianqiyubao];
    
    btn_xitonggonggao = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn_xitonggonggao setImage:[UIImage imageNamed:@"login_xitonggonggao"] forState:UIControlStateNormal];
    [btn_xitonggonggao addTarget:self action:@selector(btn_xitonggonggaoPressed) forControlEvents:UIControlEventTouchUpInside];
    [self.scrollView addSubview:btn_xitonggonggao];
    
    btn_lixianyanshi = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn_lixianyanshi setImage:[UIImage imageNamed:@"login_lixianyanshi"] forState:UIControlStateNormal];
    [btn_lixianyanshi addTarget:self action:@selector(btn_lixianyanshiPressed) forControlEvents:UIControlEventTouchUpInside];
    [self.scrollView addSubview:btn_lixianyanshi];
    
//    [self setItemsFrame:self.interfaceOrientation];
    
}

#pragma mark- actions
- (void)loginBtnPressed{
    
//    self.loginWaitVC = [[micLoginWaitViewController alloc] init];
//    [self.navigationController pushViewController:self.loginWaitVC animated:YES];
    
    RbtWebManager *loginWebManager = [[RbtWebManager alloc] init];
    loginWebManager.name = @"loginWebManager";
    loginWebManager.delegate = self;
    if (self.textF_Username.text == Nil|[self.textF_Username.text length] == 0) {
        [RbtCommonTool showInfoAlert:@"用户名不能为空"];
    }
    else if (self.textF_Password.text == Nil|[self.textF_Password.text length] == 0){
        [RbtCommonTool showInfoAlert:@"密码不能为空"];
    }
    else{
        if (self.isAutoLogin) {
            NSArray *array = [[NSArray alloc] initWithObjects:[NSNumber numberWithBool:self.isAutoLogin],self.textF_Username.text,self.textF_Password.text,nil];
            [RbtCommonTool setLogin:array];
        }
        [self.hud1 show:YES];
        [loginWebManager loginName:self.textF_Username.text passWord:self.textF_Password.text];
    }
    
    
}

- (void)getPasswordBtnPressed{
    [self.hud1 show:YES];
    NSString *user = self.textF_Username.text;
    RbtWebManager *webManager =  [[RbtWebManager alloc] init];
    webManager.name =@"getpassowrd";
    webManager.delegate =self;
    [webManager getpassowrd:user];
}

- (void)btn_gedigongchengPressed{
    [self.hud1 show:YES];
    RbtWebManager *geDiGongCengWebManager = [RbtWebManager getRbtManager:YES];
    geDiGongCengWebManager.name =@"geDiGongCengWebManager";
    geDiGongCengWebManager.delegate = self;
    [geDiGongCengWebManager getpublicprojectWithUser:@"" andH:@"1"];
}

- (void)btn_tianqiyubaoPressed{
    micTianQiYuBaoViewController *tqybVc = [[micTianQiYuBaoViewController alloc] init];
    tqybVc.isShouYe = YES;
    [self.navigationController pushViewController:tqybVc animated:YES];
}

- (void)btn_xitonggonggaoPressed{
    [self.hud1 show:YES];
    RbtWebManager *webManager = [[RbtWebManager alloc] init];
    webManager.name = @"xtggimage";
    webManager.delegate = self;
    NSArray *imageArray = [[NSArray alloc] init];
    if ([[[NSUserDefaults standardUserDefaults] objectForKey:@"XTGGImage"] allKeys]) {
        imageArray  = [[[NSUserDefaults standardUserDefaults] objectForKey:@"XTGGImage"] allKeys];
    }
    else
    {
        imageArray = @[];
    }
    NSDictionary *dic = [NSDictionary dictionaryWithObject:imageArray forKey:@"n"];
    [webManager getXiTongGongGaoWithLocationImageNameArray:dic];
    
    
    
}

- (void)btn_lixianyanshiPressed{
    RbtWebManager *webManager = [RbtWebManager getRbtManager:NO];
    webManager.name = @"getLiXianProject";
    webManager.delegate = self;
    [webManager getLiXianProject];
    
}

- (void)btn_ServerUrlPressed{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"修改服务器URL地址" message:nil delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确认", nil];
    alert.delegate = self;
    alert.alertViewStyle  = UIAlertViewStylePlainTextInput;
    UITextField *textField = [alert textFieldAtIndex:0];
    //textField.keyboardType = UIKeyboardTypeNumberPad;
    NSArray *arr = [RbtCommonTool getServerSetting];
    textField.text = [NSString stringWithFormat:@"%@:%@",[arr objectAtIndex:0],[arr objectAtIndex:1]];
    [alert show];
}

- (void)swithValueChanged:(DCRoundSwitch *)sender{
    if (sender.isOn) {
        self.isAutoLogin = YES;
    }
    else{
        self.isAutoLogin = NO;
        NSArray *arr = [[NSArray alloc] init];
        [RbtCommonTool setLogin:arr];
    }
}

#pragma mark- textField delegate
- (void)textFieldDidBeginEditing:(UITextField *)textField{
    [UIView animateWithDuration:0.3 //速度0.7秒
                     animations:^{//修改rView坐标
                         float upGap;
                         if (UIInterfaceOrientationIsPortrait(self.interfaceOrientation)) {
                             upGap = -150;
                         }
                         else
                         {
                             upGap = -250;
                         }
                         
                         self.view.frame = CGRectMake(0, upGap, ScreenWidth, ScreenHeight);
                     }
                     completion:^(BOOL finished){
                     }];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    [UIView animateWithDuration:0.2 //速度0.7秒
                     animations:^{//修改rView坐标
                         self.view.frame = CGRectMake(0, 0, ScreenWidth, ScreenHeight);
                     }
                     completion:^(BOOL finished){
                     }];
    
    return YES;
}

- (void)backgroundTap {
    [self.textF_Username resignFirstResponder];
    [self.textF_Password resignFirstResponder];
    [UIView animateWithDuration:0.2 //速度0.7秒
                     animations:^{//修改rView坐标
                         self.view.frame = CGRectMake(0, 0, ScreenWidth, ScreenHeight);
                     }
                     completion:^(BOOL finished){
                     }];
}

#pragma mark- request delegate

- (void)onDataLoadWithService:(RbtWebManager *)webService
                  andResponse:(NSDictionary *)responseDic
{
    [super onDataLoadWithService:webService andResponse:responseDic];
    if ([webService.name isEqualToString:@"loginWebManager"]) {
        if ([[responseDic objectForKey:@"rc"] isEqualToString:@"1"]) {
            
            [RbtUserModel sharedInstance].userName = self.textF_Username.text;
            [RbtUserModel sharedInstance].ut = [responseDic objectForKey:@"ut"];
            [RbtUserModel sharedInstance].lt = [responseDic objectForKey:@"lt"];
            NSArray *arr_kongzhi =[responseDic objectForKey:@"rt"];
            for (NSDictionary *dic_kongzi in arr_kongzhi) {
                if ([[dic_kongzi objectForKey:@"m"] isEqualToString:@"运行原理"]) {
                    [RbtUserModel sharedInstance].yxyl = [dic_kongzi objectForKey:@"r"];
                }
                else if ([[dic_kongzi objectForKey:@"m"] isEqualToString:@"节能视图"]) {
                    [RbtUserModel sharedInstance].jnst = [dic_kongzi objectForKey:@"r"];
                }
                else if ([[dic_kongzi objectForKey:@"m"] isEqualToString:@"历史数据"]) {
                    [RbtUserModel sharedInstance].lssj = [dic_kongzi objectForKey:@"r"];
                }
                else if ([[dic_kongzi objectForKey:@"m"] isEqualToString:@"实时数据"]) {
                    [RbtUserModel sharedInstance].sssj = [dic_kongzi objectForKey:@"r"];
                }
                else if ([[dic_kongzi objectForKey:@"m"] isEqualToString:@"GIS定位"]) {
                    [RbtUserModel sharedInstance].gisdw = [dic_kongzi objectForKey:@"r"];
                }
                else if ([[dic_kongzi objectForKey:@"m"] isEqualToString:@"问题反馈"]) {
                    [RbtUserModel sharedInstance].wtfk = [dic_kongzi objectForKey:@"r"];
                }
            }
            
            [RbtCommonTool setJinRuMode:WoDeGongCheng];
            
            micLoginWaitViewController *loginWaitVc = [[micLoginWaitViewController alloc] init];
            [self.navigationController pushViewController:loginWaitVc animated:YES];
        }
        else{
            [RbtCommonTool showInfoAlert:[responseDic objectForKey:@"rd"]];
        }
    }
    else if ([webService.name isEqualToString:@"geDiGongCengWebManager"])
    {
        if ([[responseDic objectForKey:@"rc"] isEqualToString:@"1"]) {
            micGeDiGongChengViewController *gdgcVc = [[micGeDiGongChengViewController alloc] init];
            [RbtCommonModel sharedInstance].arr_publicProject = [[NSMutableArray alloc] init];
            NSArray *arrRt = [responseDic objectForKey:@"rt"];
            for (int i = 0;i < [arrRt count]; i++) {
                NSDictionary *oneLeixing = [arrRt objectAtIndex:i];
                NSArray *arr = [oneLeixing objectForKey:@"l"];
                NSString *string_leixing =[oneLeixing objectForKey:@"ct"];
                for (int j = 0; j<[arr count]; j++) {
                    NSDictionary *onePro = [arr objectAtIndex:j];
                    RbtProjectModel *oneProject = [[RbtProjectModel alloc] init];
                    oneProject.leixing = string_leixing;
                    oneProject.name = [onePro objectForKey:@"n"];
                    oneProject.projectid = [onePro objectForKey:@"id"];
                    oneProject.city = [onePro objectForKey:@"a"];
                    oneProject.citycode = [onePro objectForKey:@"c"];
                    oneProject.latitude = [onePro objectForKey:@"w"];
                    oneProject.longitude = [onePro objectForKey:@"j"];
                    
                    if ([(NSString *)[onePro objectForKey:@"pb"] isEqualToString:@"1"]) {
                        gdgcVc.gonggProjectPid = oneProject.projectid;
                        [[RbtCommonModel sharedInstance].arr_publicProject insertObject:oneProject atIndex:0];
                    }
                    else{
                        [[RbtCommonModel sharedInstance].arr_publicProject addObject:oneProject];
                    }
                }
            }
            [RbtCommonTool setJinRuMode:GongGGC];
            
            //公共工程设置用户空，和权限
            [RbtUserModel sharedInstance].userName = @"";
            [RbtUserModel sharedInstance].yxyl = @"r";
            [RbtUserModel sharedInstance].jnst = @"r";
            [RbtUserModel sharedInstance].lssj = @"r";
            [RbtUserModel sharedInstance].sssj = @"r";
            [RbtUserModel sharedInstance].gisdw = @"r";
            [RbtUserModel sharedInstance].wtfk = @"r";
            
            
            [self.navigationController pushViewController:gdgcVc animated:YES];
        }
    }
    else if([webService.name isEqualToString:@"getLiXianProject"]){
        [RbtCommonTool setJinRuMode:LiXianGongCheng];
        NSArray *arr = [responseDic objectForKey:@"arr"];
        [RbtCommonModel sharedInstance].arr_liXianProject = [arr mutableCopy];
        micGeDiGongChengViewController *gdgcVc = [[micGeDiGongChengViewController alloc] init];
        [self.navigationController pushViewController:gdgcVc animated:YES];
        
        //离线设置用户空，和权限
        [RbtUserModel sharedInstance].userName = @"";
        [RbtUserModel sharedInstance].yxyl = @"r";
        [RbtUserModel sharedInstance].jnst = @"r";
        [RbtUserModel sharedInstance].lssj = @"r";
        [RbtUserModel sharedInstance].sssj = @"r";
        [RbtUserModel sharedInstance].gisdw = @"r";
        [RbtUserModel sharedInstance].wtfk = @"r";
    }
    else if([webService.name isEqualToString:@"getpassowrd"]){
        if ([[responseDic objectForKey:@"rc"] isEqualToString:@"1"]) {
            [RbtCommonTool showInfoAlert:@"请求密码成功，请注意查收短信"];
        }
        else if ([[responseDic objectForKey:@"rc"] isEqualToString:@"0"]){
            [RbtCommonTool showInfoAlert:[responseDic objectForKey:@"rd"]];
        }
    }
    else if([webService.name isEqualToString:@"xtggweb"]){
        if ([[responseDic objectForKey:@"rc"] isEqualToString:@"1"]) {
            micXiTongGongGaoViewController *vc = [[micXiTongGongGaoViewController alloc] init];
            vc.htmlString = [responseDic objectForKey:@"rt"];
            [self.navigationController pushViewController:vc animated:YES];
        }
        else if ([[responseDic objectForKey:@"rc"] isEqualToString:@"0"]){
            [RbtCommonTool showInfoAlert:[responseDic objectForKey:@"rd"]];
        }
    }
    else if([webService.name isEqualToString:@"xtggimage"]){
        if ([[responseDic objectForKey:@"rc"] isEqualToString:@"1"]) {
            NSDictionary *rtDic = [responseDic objectForKey:@"rt"] ;
            if ([[rtDic objectForKey:@"f"] isEqualToString:@"1"]) {
//                NSMutableArray *imageArray = [[NSMutableArray alloc] initWithArray:[rtDic objectForKey:@"o"]];
                NSMutableDictionary *newImageDic = [[NSMutableDictionary alloc] init];
                
                NSMutableDictionary *oldImageDic = [[NSMutableDictionary alloc] initWithDictionary:[[NSUserDefaults standardUserDefaults] objectForKey:@"XTGGImage"]];
                NSArray *nochangeArray = [[NSArray alloc] initWithArray:[rtDic objectForKey:@"o"]];
                if (nochangeArray.count > 0) {
                    for (int i = 0; i < nochangeArray.count; i++) {
                        NSString *tempName = [nochangeArray objectAtIndex:i];
                        if ([oldImageDic objectForKey:tempName]) {
                            [newImageDic setObject:[oldImageDic objectForKey:tempName] forKey:tempName];
                        }
                    }
                }
                
                
                NSArray *iArray = [rtDic objectForKey:@"i"];
                for (int i = 0; i < [iArray count]; i ++) {
                    NSString *tempName = [[iArray objectAtIndex:i] objectForKey:@"n"];
                    NSString *tempContext = [[iArray objectAtIndex:i] objectForKey:@"v"];
                    [newImageDic setObject:tempContext forKey:tempName];
                    [[NSUserDefaults standardUserDefaults] setObject:newImageDic forKey:@"XTGGImage"];
                }
                

            }
        }
        RbtWebManager *webManager = [[RbtWebManager alloc] init];
        webManager.name = @"xtggweb";
        webManager.delegate = self;
        [webManager getannouncement:@""];
    }
}

#pragma mark - alertView delegate
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (buttonIndex == 0) {
        
    }
    else if(buttonIndex == 1) {
        NSString *str = [alertView textFieldAtIndex:0].text;
        NSArray *arr = [str componentsSeparatedByString:@":"];
        if ([arr count]==2) {
            [RbtCommonTool setServerSetting:arr];
        }
    }
}

-(BOOL)shouldAutorotate
{
    return YES;
}

-(NSUInteger)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskAllButUpsideDown;
}

-(void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
{
    [super willRotateToInterfaceOrientation:toInterfaceOrientation duration:duration];
    [self setItemsFrame:toInterfaceOrientation];
}



-(void)setItemsFrame:(UIInterfaceOrientation)orientation
{
    if (orientation == UIInterfaceOrientationLandscapeLeft || orientation == UIInterfaceOrientationLandscapeRight) {
        [self.scrollView setFrame:CGRectMake(0, 0, 1024, 768)];
        [loginBG setFrame:CGRectMake(0, 0, 1024, 768)];
        [loginBG setImage:[UIImage imageNamed:@"loginBG_h"]];
        login_inputbg.frame = CGRectMake((ScreenHeight-login_inputbg.width)/2, 385, login_inputbg.width, login_inputbg.height);
        labUser.frame = CGRectMake(login_inputbg.frame.origin.x+17, login_inputbg.origin.y, labUser.width, labUser.height);
        labPassword.frame = CGRectMake(login_inputbg.frame.origin.x+17, login_inputbg.origin.y+60, labPassword.width, labPassword.height);
        
        self.textF_Username.frame = CGRectMake(10+labUser.width+labUser.origin.x, labUser.origin.y, 250, labUser.height);
        self.textF_Password.frame = CGRectMake(10+labPassword.width+labPassword.origin.x, labPassword.origin.y, 250, labPassword.height);
        
        labLoginAuto.frame = CGRectMake(login_inputbg.frame.origin.x+120, labPassword.origin.y+60, labLoginAuto.width, labLoginAuto.height);
        btnSwitch.frame = CGRectMake(labLoginAuto.origin.x+100, labPassword.origin.y+70, btnSwitch.width, btnSwitch.height);
        //        btn_ServerUrl.frame = CGRectMake(250, 290+50, 60, 40);
        
        forgetPassword.frame = CGRectMake(labPassword.origin.x + 260, labPassword.origin.y, 100, 60);
        [forgetPassword.titleLabel setFont:[UIFont systemFontOfSize:FONTSIZE]];
        
        loginBtn.frame = CGRectMake((ScreenHeight-396)/2, labLoginAuto.origin.y+55, 396, 61);
        
        btn_gedigongcheng.frame = CGRectMake(249, ScreenWidth-120, 124, 102);
        btn_tianqiyubao.frame = CGRectMake(249+134, ScreenWidth-120, 124, 102);
        btn_xitonggonggao.frame = CGRectMake(249+134*2, ScreenWidth-120, 124, 102);
        btn_lixianyanshi.frame = CGRectMake(249+134*3, ScreenWidth-120, 124, 102);
        [btn_ServerUrl setFrame:CGRectMake(1024-120, 20, 110, 32)];
        
    }
    else
    {
        [self.scrollView setFrame:CGRectMake(0, 0, 768, 1024)];
        [loginBG setFrame:CGRectMake(0, 0, 768, 1024)];
        [loginBG setImage:[UIImage imageNamed:@"loginBG"]];
        login_inputbg.frame = CGRectMake((ScreenWidth-login_inputbg.width)/2, 570, login_inputbg.width, login_inputbg.height);
        labUser.frame = CGRectMake(login_inputbg.frame.origin.x+17, login_inputbg.origin.y, labUser.width, labUser.height);
        labPassword.frame = CGRectMake(login_inputbg.frame.origin.x+17, login_inputbg.origin.y+60, labPassword.width, labPassword.height);
        
        self.textF_Username.frame = CGRectMake(10+labUser.width+labUser.origin.x, labUser.origin.y, 250, labUser.height);
        self.textF_Password.frame = CGRectMake(10+labPassword.width+labPassword.origin.x, labPassword.origin.y, 250, labPassword.height);
        
        labLoginAuto.frame = CGRectMake(login_inputbg.frame.origin.x+120, labPassword.origin.y+60, labLoginAuto.width, labLoginAuto.height);
        btnSwitch.frame = CGRectMake(labLoginAuto.origin.x+100, labPassword.origin.y+70, btnSwitch.width, btnSwitch.height);
        //        btn_ServerUrl.frame = CGRectMake(250, 290+50, 60, 40);
        
        forgetPassword.frame = CGRectMake(labPassword.origin.x + 260, labPassword.origin.y, 100, 60);
        [forgetPassword.titleLabel setFont:[UIFont systemFontOfSize:FONTSIZE]];
        
        loginBtn.frame = CGRectMake((ScreenWidth-396)/2, labLoginAuto.origin.y+70, 396, 61);
        
        btn_gedigongcheng.frame = CGRectMake(116, ScreenHeight-102, 124, 102);
        btn_tianqiyubao.frame = CGRectMake(116+134, ScreenHeight-102, 124, 102);
        btn_xitonggonggao.frame = CGRectMake(116+134*2, ScreenHeight-102, 124, 102);
        btn_lixianyanshi.frame = CGRectMake(116+134*3, ScreenHeight-102, 124, 102);
        [btn_ServerUrl setFrame:CGRectMake(768-110, 20, 110, 32)];
    }
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
