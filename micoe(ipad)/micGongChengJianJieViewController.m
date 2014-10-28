//
//  micGongChengJianJieViewController.m
//  micoe(ipad)
//
//  Created by Simon on 14-1-17.
//  Copyright (c) 2014年 Simon. All rights reserved.
//

#import "micGongChengJianJieViewController.h"

#define TOP 40
#define GAP 20

@interface micGongChengJianJieViewController ()
{
    UIButton *btn;
    UILabel *titleLabel;
    UIImageView *buttomImageView;
    UIButton *buttomBtn;
    UILabel *buttomLabel;
}

@end

@implementation micGongChengJianJieViewController

@synthesize gcTableView;

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
    
    [super viewDidLoad];
    self.title = @"工程简介";
    
    btn = [UIButton buttonWithType:UIButtonTypeCustom];
//    btn.frame = CGRectMake((self.view.bounds.size.width - 596)/2, 64+TOP, 596, 96);
    [btn setImage:[UIImage imageNamed:@"headerBtn"] forState:UIControlStateNormal];
    //    [btn setTitle:[RbtProjectModel sharedInstance].name forState:UIControlStateNormal];
    titleLabel = [[UILabel alloc] init];
    [titleLabel setBackgroundColor:[UIColor clearColor]];
    titleLabel.text = [RbtProjectModel sharedInstance].name;
    [titleLabel setTextColor:[UIColor whiteColor]];
    [titleLabel setFont:[UIFont fontWithName:kFontName size:38]];
    [titleLabel setTextAlignment:NSTextAlignmentCenter];
    [btn addSubview:titleLabel];
    [btn addTarget:self action:@selector(getinProject) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
	// Do any additional setup after loading the view.
    
    
    gcTableView = [[UITableView alloc] init];
    //    gcTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [gcTableView setSectionIndexColor:[UIColor clearColor]];
    [gcTableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    [gcTableView setSeparatorColor:[UIColor clearColor]];
    [gcTableView setBackgroundView:nil];
    gcTableView.dataSource = self;
    gcTableView.delegate = self;
    //    gcTableView.userInteractionEnabled = NO;
    [self.view addSubview:gcTableView];
    
    buttomImageView = [[UIImageView alloc] init];
    [buttomImageView setImage:[UIImage imageNamed:@"cellBGImage"]];
    [self.view addSubview:buttomImageView];
    
    buttomBtn = [UIButton buttonWithType:UIButtonTypeCustom];
//    buttomBtn.frame = CGRectMake(buttomImageView.frame.origin.x + 40, buttomImageView.origin.y+24, 596-80, 70);
    [buttomBtn setImage:[UIImage imageNamed:@"buttomBtn"] forState:UIControlStateNormal];
    buttomLabel = [[UILabel alloc] init];
    [buttomLabel setBackgroundColor:[UIColor clearColor]];
//    buttomLabel.text = [RbtProjectModel sharedInstance].name;
    buttomLabel.text = @"进入";
    [buttomLabel setTextAlignment:NSTextAlignmentCenter];
    [buttomLabel setTextColor:[UIColor whiteColor]];
    [buttomLabel setFont:[UIFont fontWithName:kFontName size:34]];
    [buttomBtn addSubview:buttomLabel];
    [buttomBtn addTarget:self action:@selector(getinProject) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:buttomBtn];
    
    row2BtnClicked = NO;
    
    jieshaoLabel = [[UILabel alloc] init];
    jieshaoLabel.text = [RbtProjectInfoModel sharedInstance].i;
    CGSize size = [jieshaoLabel.text sizeWithFont:jieshaoLabel.font constrainedToSize:self.view.bounds.size lineBreakMode:jieshaoLabel.lineBreakMode];
    labelHeight = (size.height+60)*2;
    [jieshaoLabel setFont:[UIFont fontWithName:kFontName size:30]];
    [jieshaoLabel setTextColor:[UIColor grayColor]];
    
    wdgcVc = [[micWoDeGongChengViewController alloc] init];
    
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self setItemsFrame:self.interfaceOrientation];
    
    [[NSUserDefaults standardUserDefaults] setObject:@"1000" forKey:@"selectIndex"];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 8;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 2) {
        if (row2BtnClicked) {
            return labelHeight;
        }
        else
        {
            return 0;
        }
    }

        return 346/4;

}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ProjectCell"];
//    //
//    if (cell == nil) {
        UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"ProjectCell"];
//    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    
    NSInteger row = [indexPath row];
    
//    cell.height = IS_IPHONE_5?346/8:258/8;
    cell.height = 346/4;
    if (row == 2) {
        if (row2BtnClicked) {
            cell.height = labelHeight;
        }
        else
        {
//            cell.height = 346/4;
             cell.hidden = YES;
//            cell.frame = CGRectMake(0, 0, 0, 0);
        }
    }
    
    UIImageView *bgImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 596, cell.height)];
    [bgImageView setImage:[UIImage imageNamed:@"cellBGImage"]];
    [cell addSubview:bgImageView];
    
    UIImageView *lineImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, cell.height-4, 596, 8)];
    [lineImageView setImage:[UIImage imageNamed:@"cellLine"]];
    [cell addSubview:lineImageView];
    
    NSLog(@"size %f, %f", bgImageView.width, bgImageView.height);
    
    UILabel *leftLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 0, 240, cell.frame.size.height)];
    [leftLabel setFont:[UIFont fontWithName:kFontName size:30]];
    [cell addSubview:leftLabel];
    
    UIButton *cellBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [cellBtn setFrame:CGRectMake(596/2-42-20, (cell.frame.size.height-24)/2, 42, 24)];
    NSString *imageName = row2BtnClicked?@"row2ImageUp":@"row2Image";
    
    [cellBtn setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    [cellBtn addTarget:self action:@selector(cellBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    
    UILabel *rightLabel = [[UILabel alloc] initWithFrame:CGRectMake(596-300-20, 0, 300, cell.frame.size.height)];
    [rightLabel setFont:[UIFont fontWithName:kFontName size:30]];
    [rightLabel setTextColor:[UIColor colorWithRed:0/255.0f green:162/255.0f blue:233/255.0f alpha:1]];
    [rightLabel setTextAlignment:NSTextAlignmentRight];
    
    if (row2BtnClicked) {
        [jieshaoLabel setLineBreakMode:NSLineBreakByCharWrapping];
        [jieshaoLabel setNumberOfLines:0];
        
        CGRect rect = jieshaoLabel.frame;
        rect.size.height = labelHeight;
        rect.size.width = gcTableView.width-40;
        
        jieshaoLabel.frame = rect;
    }
    else
    {
        [jieshaoLabel setNumberOfLines:1];
        [jieshaoLabel setFrame:CGRectMake(20, 0, 120, cell.height)];
    }
    
    [jieshaoLabel setBackgroundColor:[UIColor clearColor]];
    
    if (row == 1)
    {
        [cell setAccessoryView:cellBtn];
    }
    else if (row == 2)
    {
        [cell addSubview:jieshaoLabel];
    }
    else{
        
        [cell addSubview:rightLabel];
    }
    
    switch (row) {
        case 0:
        {
            leftLabel.text = @"项目类型";
            rightLabel.text = [RbtProjectInfoModel sharedInstance].n;
        }
            break;
            
        case 1:
        {
            leftLabel.text = @"项目介绍";
        }
            break;
        case 2:
        {
            //            jieshaoLabel.text = [RbtProjectInfoModel sharedInstance].i;
        }
            break;
        case 3:
        {
            leftLabel.text = @"设计用水量";
            rightLabel.text = [RbtProjectInfoModel sharedInstance].w;
        }
            break;
        case 4:
        {
            leftLabel.text = @"甲方单位";
            rightLabel.text = [RbtProjectInfoModel sharedInstance].c;
        }
            break;
        case 5:
        {
            leftLabel.text = @"联系人";
            rightLabel.text = [RbtProjectInfoModel sharedInstance].t;
        }
            break;
        case 6:
        {
            leftLabel.text = @"联系电话";
            rightLabel.text = [RbtProjectInfoModel sharedInstance].p;
        }
            break;
        case 7:
        {
            leftLabel.text = @"竣工时间";
            rightLabel.text = [RbtProjectInfoModel sharedInstance].ct;
        }            
            break;
        default:
            break;
    }
    return cell;
}

-(void)cellBtnClicked:(UIButton *)sender
{
    sender.selected = !sender.selected;
    row2BtnClicked = !row2BtnClicked;
    [gcTableView reloadData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)getinProject{
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
}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}

-(void)onDataLoadWithService:(RbtWebManager *)webService andResponse:(NSDictionary *)responseDic
{
    [super onDataLoadWithService:webService andResponse:responseDic];
    
    if ([webService.name isEqualToString:@"yuanlituWeb"]) {
        if ([RbtCommonTool getJinRuMode] == LiXianGongCheng) {
            [RbtDataOfResponse sharedInstance].yuanlituDic = responseDic;
            [self.navigationController pushViewController:wdgcVc animated:YES];
        }
        else{
            if ([[responseDic objectForKey:@"rc"] intValue]) {
                NSDictionary *tempDIc = [responseDic objectForKey:@"rt"];
                [RbtDataOfResponse sharedInstance].yuanlituDic = tempDIc;
                [self.navigationController pushViewController:wdgcVc animated:YES];
            }
            else
            {
                [RbtCommonTool showInfoAlert:[responseDic objectForKey:@"rd"]];
            }
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
        btn.frame = CGRectMake((ScreenHeight - 596)/2, 64+20, 596, 96);
        titleLabel.frame = [btn bounds];
        gcTableView.frame = CGRectMake((ScreenHeight - 596)/2, 64+20+96, 596, ScreenWidth-64-TOP*2-96*2);
        buttomImageView.frame = CGRectMake((ScreenHeight - 596)/2, gcTableView.height + gcTableView.frame.origin.y, 596, 120);
        buttomBtn.frame = CGRectMake(buttomImageView.frame.origin.x + 40, buttomImageView.origin.y+24, 596-80, 70);
        buttomLabel.frame = [buttomBtn bounds];
    }
    else
    {
        btn.frame = CGRectMake((ScreenWidth - 596)/2, 64+TOP, 596, 96);
        titleLabel.frame = [btn bounds];
        gcTableView.frame = CGRectMake((ScreenWidth - 596)/2, 64+TOP+96, 596, ScreenHeight-64-TOP*2-96*2);
        buttomImageView.frame = CGRectMake((ScreenWidth - 596)/2, gcTableView.height + gcTableView.frame.origin.y, 596, 120);
        buttomBtn.frame = CGRectMake(buttomImageView.frame.origin.x + 40, buttomImageView.origin.y+24, 596-80, 70);
        buttomLabel.frame = [buttomBtn bounds];
    }

}

@end
