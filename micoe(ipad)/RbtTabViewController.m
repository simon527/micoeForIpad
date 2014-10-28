//
//  RbtTabViewController.m
//  RedBudTek
//
//  Created by Simon on 13-11-28.
//  Copyright (c) 2013年 redbudtek. All rights reserved.
//

#import "RbtTabViewController.h"

#define NUMOFTABBARBUTTON   4
#define TABBARHEIGHT    49

@interface RbtTabViewController ()

@end

@implementation RbtTabViewController

@synthesize btn_shezhi, btn_sijimuge, btn_wentifankui, btn_wodegongcheng;

@synthesize customTabbar, customTabbar_h;

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
    

    
    float screenHeight = 1024;

    
    customTabbar = [[RbtTabbarView alloc] initWithFrame:CGRectMake(0, 1024-49, 768, 49)];
    [self.view addSubview:customTabbar];
    
    customTabbar_h = [[micTabbarView alloc] initWithFrame:CGRectMake(0, 768-49, 1024, 49)];
    [self.view addSubview:customTabbar_h];
    

    
    [self setTabBarWithInterfaceOrientation:self.interfaceOrientation];
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [customTabbar setSelectBtn:310];
    [customTabbar_h setSelectBtn:310];
}

-(void)setTabbarHidden:(BOOL)isHidden
{
    if (isHidden) {
        customTabbar.hidden = YES;
    }
    else
    {
        customTabbar.hidden = NO;
    }
}

-(void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
{
    [super willRotateToInterfaceOrientation:toInterfaceOrientation duration:duration];
    [self setTabBarWithInterfaceOrientation:toInterfaceOrientation];
}

-(void)setTabBarWithInterfaceOrientation:(UIInterfaceOrientation)oreintation
{
    if (UIInterfaceOrientationIsLandscape(oreintation)) {
        customTabbar.hidden = YES;
        customTabbar_h.hidden = YES;
    }
    else
    {
        customTabbar.hidden = NO;
        customTabbar_h.hidden = YES;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
