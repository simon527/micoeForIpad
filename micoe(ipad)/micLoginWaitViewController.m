//
//  micLoginWaitViewController.m
//  micoe(ipad)
//
//  Created by Simon on 14-1-13.
//  Copyright (c) 2014年 Simon. All rights reserved.
//

#import "micLoginWaitViewController.h"
#import "micGeDiGongChengViewController.h"

@interface micLoginWaitViewController ()
{
    UIImageView *imgv_bg;
    UILabel *lab_welcome;
    UILabel *lab_timeTou;
    UILabel *lab_time;
    UILabel *lab_info;
    UIButton *btn_history;
    UIButton *btn_search;
}

@end

@implementation micLoginWaitViewController

#define SCX 1.5

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
    [self.navigationController setNavigationBarHidden:YES];
    
    h = NO;
    hpage = 0;
    [self.view setBackgroundColor:[UIColor whiteColor]];
    self.navigationController.navigationBarHidden = YES;
    self.title = @"欢迎登录";
    imgv_bg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"loginWait_bg"]];
//    imgv_bg.frame = CGRectMake((ScreenWidth-284*SCX)/2, (ScreenHeight-280*SCX)/2, 284*SCX, 280*SCX);
    [self.view addSubview:imgv_bg];
    
    lab_welcome = [[UILabel alloc] init];
    lab_welcome.text = [NSString stringWithFormat:@"尊敬的%@用户，欢迎登入！",[RbtUserModel sharedInstance].ut];
    [lab_welcome setFont:[UIFont fontWithName:kFontName size:16*SCX]];
    lab_welcome.textColor = [UIColor colorWithRed:0.0 green:147/255.0 blue:221/255.0 alpha:1];
    [self.view addSubview:lab_welcome];
    
    lab_timeTou = [[UILabel alloc] init];
    lab_timeTou.text = @"您上次登录时间为";
    [lab_timeTou setFont:[UIFont fontWithName:kFontName size:13*SCX]];
    lab_timeTou.textColor = [UIColor colorWithRed:25/255.0 green:25/255.0 blue:25/255.0 alpha:1];
    [self.view addSubview:lab_timeTou];
    
    lab_time = [[UILabel alloc] init];
    NSTimeInterval timespace = [[RbtUserModel sharedInstance].lt doubleValue]/1000.0;
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:timespace];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy年MM月dd日， HH点mm分"];
    NSString *strDate = [dateFormatter stringFromDate:date];
    lab_time.text = [NSString stringWithFormat:@"%@",strDate];
    [lab_time setFont:[UIFont fontWithName:kFontName size:13*SCX]];
    lab_time.textColor = [UIColor colorWithRed:25/255.0 green:25/255.0 blue:25/255.0 alpha:1];
    [self.view addSubview:lab_time];
    
    lab_info = [[UILabel alloc] init];
    lab_info.text = @"请您根据需求选择下列操作：";
    [lab_info setFont:[UIFont fontWithName:kFontName size:13*SCX]];
    lab_info.textColor = [UIColor colorWithRed:25/255.0 green:25/255.0 blue:25/255.0 alpha:1];
    [self.view addSubview:lab_info];
    
    btn_history = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn_history setImage:[UIImage imageNamed:@"loginWait_btn_history"] forState:UIControlStateNormal];
    [btn_history addTarget:self action:@selector(btn_historyPressed) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn_history];
    
    btn_search = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn_search setImage:[UIImage imageNamed:@"loginWait_btn_search"] forState:UIControlStateNormal];
    [btn_search addTarget:self action:@selector(btn_searchPressed) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn_search];
    

}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self setItemsFrame:self.interfaceOrientation];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark- actions
- (void)btn_historyPressed{
    [self.hud1 show:YES];
    self.isLiulan = YES;
    [RbtCommonModel sharedInstance].arr_myProject = [[NSMutableArray alloc] init];
    RbtWebManager *getMyProjectWebManager = [RbtWebManager getRbtManager:YES];
    getMyProjectWebManager.name = @"getMyProjectWebManager";
    getMyProjectWebManager.delegate = self;
    NSString *userName =[RbtUserModel sharedInstance].userName;
    [getMyProjectWebManager getMyProjectWithUser:userName andH:@"1"];
}

- (void)btn_searchPressed{
    [self.hud1 show:YES];
    self.isLiulan = NO;
    [RbtCommonModel sharedInstance].arr_myProject = [[NSMutableArray alloc] init];
    RbtWebManager *getMyProjectWebManager = [RbtWebManager getRbtManager:YES];
    getMyProjectWebManager.name = @"getMyProjectWebManager";
    getMyProjectWebManager.delegate = self;
    NSString *userName =[RbtUserModel sharedInstance].userName;
    [getMyProjectWebManager getMyProjectWithUser:userName andH:@"1"];
}

#pragma mark- request delegate
- (void)onDataLoadWithService:(RbtWebManager *)webService
                  andResponse:(NSDictionary *)responseDic
{
    [super onDataLoadWithService:webService andResponse:responseDic];
    if([webService.name isEqualToString:@"getMyProjectWebManager"]){
        if ([[responseDic objectForKey:@"rc"] isEqualToString:@"1"]) {
            NSString *hstring = [responseDic objectForKey:@"h"];
            if (hstring && ([hstring length]>0)) {
                h = YES;
                hpage = hpage + 100;
            }
            else{
                h = NO;
            }
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
                    oneProject.longitude = [onePro objectForKey:@"j"];
                    oneProject.latitude = [onePro objectForKey:@"w"];
                    [[RbtCommonModel sharedInstance].arr_myProject addObject:oneProject];
                }
            }
            
            if (h) {
                RbtWebManager *getMyProjectWebManager = [RbtWebManager getRbtManager:YES];
                getMyProjectWebManager.name = @"getMyProjectWebManager";
                getMyProjectWebManager.delegate = self;
                NSString *userName =[RbtUserModel sharedInstance].userName;
                [getMyProjectWebManager getMyProjectWithUser:userName andH:[NSString stringWithFormat:@"%d",hpage]];
            }
            else{
                micGeDiGongChengViewController *gdgcVc = [[micGeDiGongChengViewController alloc] init];
                gdgcVc.isLishijilu = self.isLiulan;
                [self.navigationController pushViewController:gdgcVc animated:YES];
            }
        }
        else if ([[responseDic objectForKey:@"rc"] isEqualToString:@"0"]){
            [RbtCommonTool showInfoAlert:@"用户名不存在"];
        }
    }
}

-(void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
{
    [super willRotateToInterfaceOrientation:toInterfaceOrientation duration:duration];
    [self setItemsFrame:toInterfaceOrientation];
    
}


-(void)setItemsFrame:(UIInterfaceOrientation)orientation
{
    if (orientation == UIInterfaceOrientationLandscapeLeft || orientation == UIInterfaceOrientationLandscapeRight)
    {
        imgv_bg.frame = CGRectMake((ScreenHeight-284*SCX)/2, (ScreenWidth-280*SCX)/2, 284*SCX, 280*SCX);
        lab_welcome.frame = CGRectMake(imgv_bg.origin.x+17*SCX, (ScreenWidth-280*SCX)/2+10*SCX, 250*SCX, 40*SCX);
        lab_timeTou.frame = CGRectMake(imgv_bg.origin.x+17*SCX, (ScreenWidth-280*SCX)/2+60*SCX, 250*SCX, 30*SCX);
        lab_time.frame = CGRectMake(imgv_bg.origin.x+17*SCX, (ScreenWidth-280*SCX)/2+80*SCX, 250*SCX, 30*SCX);
        lab_info.frame = CGRectMake(imgv_bg.origin.x+17*SCX, (ScreenWidth-280*SCX)/2+120*SCX, 250*SCX, 30*SCX);
        btn_history.frame = CGRectMake((ScreenHeight-267*SCX)/2, (ScreenWidth-280*SCX)/2+160*SCX, 267*SCX, 40*SCX);
        btn_search.frame = CGRectMake((ScreenHeight-267*SCX)/2, (ScreenWidth-280*SCX)/2+210*SCX, 267*SCX, 40*SCX);
    }
    else
    {
        imgv_bg.frame = CGRectMake((ScreenWidth-284*SCX)/2, (ScreenHeight-280*SCX)/2, 284*SCX, 280*SCX);
        lab_welcome.frame = CGRectMake(imgv_bg.origin.x+17*SCX, (ScreenHeight-280*SCX)/2+10*SCX, 250*SCX, 40*SCX);
        lab_timeTou.frame = CGRectMake(imgv_bg.origin.x+17*SCX, (ScreenHeight-280*SCX)/2+60*SCX, 250*SCX, 30*SCX);
        lab_time.frame = CGRectMake(imgv_bg.origin.x+17*SCX, (ScreenHeight-280*SCX)/2+80*SCX, 250*SCX, 30*SCX);
        lab_info.frame = CGRectMake(imgv_bg.origin.x+17*SCX, (ScreenHeight-280*SCX)/2+120*SCX, 250*SCX, 30*SCX);
        btn_history.frame = CGRectMake((ScreenWidth-267*SCX)/2, (ScreenHeight-280*SCX)/2+160*SCX, 267*SCX, 40*SCX);
        btn_search.frame = CGRectMake((ScreenWidth-267*SCX)/2, (ScreenHeight-280*SCX)/2+210*SCX, 267*SCX, 40*SCX);
    }
}




@end
