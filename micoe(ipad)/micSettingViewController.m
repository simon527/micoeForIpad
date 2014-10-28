//
//  micSettingViewController.m
//  micoe(ipad)
//
//  Created by Simon on 14-1-20.
//  Copyright (c) 2014年 Simon. All rights reserved.
//

#import "micSettingViewController.h"

@interface micSettingViewController ()

@end

@implementation micSettingViewController

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
    shezhi = [[UIView alloc] init];
    [shezhi setSize:CGSizeMake(441*SCX, 272*SCX)];
    shezhi.center = self.view.center;
    [self.view addSubview:shezhi];
    
    UIImageView *shezhiBG = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 441*SCX, 272*SCX)];
//    [shezhiBG setSize:CGSizeMake(441, 272)];
//    shezhiBG.center = self.view.center;
    [shezhiBG setImage:[UIImage imageNamed:@"sett_shezhiBG"]];
    [shezhi addSubview:shezhiBG];
    
    UILabel *lab1 = [[UILabel alloc] initWithFrame:CGRectMake(shezhiBG.origin.x + 205*SCX, shezhiBG.origin.y+5*SCX, 60*SCX, 40*SCX)];
    lab1.text = @"设 置";
    [lab1 setFont:[UIFont fontWithName:kFontName size:20*SCX]];
    [lab1 setTextColor:[UIColor whiteColor]];
    [shezhi addSubview:lab1];
    
    UILabel *lab2 = [[UILabel alloc] initWithFrame:CGRectMake(shezhiBG.origin.x + 20*SCX, shezhiBG.origin.y+(54+8)*SCX, 100*SCX, 40*SCX)];
    lab2.text = @"账号注销";
    [lab2 setFont:[UIFont fontWithName:kFontName size:20*SCX]];
    [shezhi addSubview:lab2];
    
    
    
    UILabel *lab3 = [[UILabel alloc] initWithFrame:CGRectMake(shezhiBG.origin.x + 20*SCX, shezhiBG.origin.y+(54*2+8)*SCX, 100*SCX, 40*SCX)];
    lab3.text = @"修改密码";
    [lab3 setFont:[UIFont fontWithName:kFontName size:20*SCX]];
    [shezhi addSubview:lab3];
    
    UILabel *lab4 = [[UILabel alloc] initWithFrame:CGRectMake(shezhiBG.origin.x + 20*SCX, shezhiBG.origin.y+(54*3+8)*SCX, 100*SCX, 40*SCX)];
    lab4.text = @"版本号";
    [lab4 setFont:[UIFont fontWithName:kFontName size:20*SCX]];
    [shezhi addSubview:lab4];
    
    UILabel *lab5 = [[UILabel alloc] initWithFrame:CGRectMake(shezhiBG.origin.x + 20*SCX, shezhiBG.origin.y+(54*4+8)*SCX, 100*SCX, 40*SCX)];
    lab5.text = @"服务器地址";
    [lab5 setFont:[UIFont fontWithName:kFontName size:20*SCX]];
    [shezhi addSubview:lab5];
    
    UILabel *lab21 = [[UILabel alloc] initWithFrame:CGRectMake(shezhiBG.origin.x + 300*SCX, shezhiBG.origin.y+(54+8)*SCX, 100*SCX, 40*SCX)];
//    [lab21 setBackgroundColor:[UIColor redColor]];
    lab21.text = [RbtUserModel sharedInstance].userName;
    [lab21 setTextAlignment:NSTextAlignmentRight];
    [lab21 setFont:[UIFont fontWithName:kFontName size:20*SCX]];
    [lab21 setTextColor:[UIColor colorWithRed:0.0 green:147/255.0 blue:221/255.0 alpha:1]];
    [shezhi addSubview:lab21];
    
    UILabel *lab41 = [[UILabel alloc] initWithFrame:CGRectMake(shezhiBG.origin.x + 360*SCX, shezhiBG.origin.y+(54*3+8)*SCX, 100*SCX, 40*SCX)];
    lab41.text = @"1.0";
    [lab41 setFont:[UIFont fontWithName:kFontName size:20*SCX]];
    [lab41 setTextColor:[UIColor colorWithRed:0.0 green:147/255.0 blue:221/255.0 alpha:1]];
    [shezhi addSubview:lab41];
    
    UIButton *button31 = [UIButton buttonWithType:UIButtonTypeCustom];
    [button31 setFrame:CGRectMake(shezhiBG.origin.x + 380*SCX, shezhiBG.origin.y+(54*2+8)*SCX, 56*SCX, 52*SCX)];
    [button31 setImage:[UIImage imageNamed:@"wtfk_cellaccbtn"] forState:UIControlStateNormal];
    [button31 addTarget:self action:@selector(changePassWord:) forControlEvents:UIControlEventTouchUpInside];
    [shezhi addSubview:button31];
    
    UIButton *button51 = [UIButton buttonWithType:UIButtonTypeCustom];
    [button51 setFrame:CGRectMake(shezhiBG.origin.x + 380*SCX, shezhiBG.origin.y+(54*4+8)*SCX, 56*SCX, 52*SCX)];
    [button51 setImage:[UIImage imageNamed:@"wtfk_cellaccbtn"] forState:UIControlStateNormal];
    [button51 addTarget:self action:@selector(changeURL:) forControlEvents:UIControlEventTouchUpInside];
    [shezhi addSubview:button51];
    
    UIButton *zhuxiaoBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [zhuxiaoBtn setFrame:CGRectMake(shezhiBG.origin.x + 380*SCX, shezhiBG.origin.y+(54*1+8)*SCX, 56*SCX, 52*SCX)];
    [zhuxiaoBtn setImage:[UIImage imageNamed:@"wtfk_cellaccbtn"] forState:UIControlStateNormal];
    [zhuxiaoBtn addTarget:self action:@selector(zhuxiaoBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    [shezhi addSubview:zhuxiaoBtn];
    
    xgmm = [[micxiugaimimaView alloc] initWithFrame:shezhi.frame];
    xgmm.delegeta = self;
    xgurl = [[micxiugaiURLView alloc] initWithFrame:shezhi.frame];

}

-(void)zhuxiaoBtnClicked:(UIButton *)button
{
    if (![[RbtUserModel sharedInstance].userName isEqualToString:@""]) {
        [self.hud1 show:YES];
        RbtWebManager *WebManager = [[RbtWebManager alloc] init];
        WebManager.name =@"loginout";
        WebManager.delegate = self;
        [WebManager loginOut:[RbtUserModel sharedInstance].userName];
    }
    else
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"请登陆后查看" message:nil delegate:self cancelButtonTitle:@"确认" otherButtonTitles:nil, nil];
        [alert show];
    }
}

-(void)changePassWord:(UIButton *)button
{
    
    NSLog(@"na = %@", [RbtUserModel sharedInstance].userName);
    if (![[RbtUserModel sharedInstance].userName isEqualToString:@""]) {
        shezhi.hidden = YES;
        [self.view addSubview:xgmm];
    }
    else
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"请登陆后查看" message:nil delegate:self cancelButtonTitle:@"确认" otherButtonTitles:nil, nil];
        [alert show];
    }
}


-(void)changeURL:(UIButton *)button
{
//    shezhi.hidden = YES;
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"修改服务器URL地址" message:nil delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确认", nil];
    alert.delegate = self;
    alert.alertViewStyle  = UIAlertViewStylePlainTextInput;
    UITextField *textField = [alert textFieldAtIndex:0];
    //textField.keyboardType = UIKeyboardTypeNumberPad;
    NSArray *arr = [RbtCommonTool getServerSetting];
    textField.text = [NSString stringWithFormat:@"%@:%@",[arr objectAtIndex:0],[arr objectAtIndex:1]];
    [alert show];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)fanhui
{
    shezhi.hidden = NO;
}


-(void)onDataLoadWithService:(RbtWebManager *)webService andResponse:(NSDictionary *)responseDic
{
    [super onDataLoadWithService:webService andResponse:responseDic];
    if ([webService.name isEqualToString:@"loginout"]) {
        if ([[responseDic objectForKey:@"rc"] isEqualToString:@"1"]) {
//            [RbtCommonTool showInfoAlert:@"成功注销"];
            [RbtUserModel sharedInstance].userName = nil;
            [[self viewController].navigationController popToRootViewControllerAnimated:YES];
        }
        else{

        }

    }
}
//
//-(void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
//{
//    [self setItemsFrame:self.interfaceOrientation];
//}
//
-(void)setItemsFrame:(UIInterfaceOrientation)orientation{
    
    if (UIInterfaceOrientationIsLandscape(orientation)) {
        shezhi.center = CGPointMake(512, 384);
    }
    else
    {
        shezhi.center = CGPointMake(384, 512);
    }
    xgmm.frame = shezhi.frame;
    xgurl.frame = shezhi.frame;
    
}



@end
