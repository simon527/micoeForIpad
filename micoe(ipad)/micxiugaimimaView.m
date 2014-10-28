//
//  micxiugaimimaView.m
//  micoe(ipad)
//
//  Created by Simon on 14-1-20.
//  Copyright (c) 2014年 Simon. All rights reserved.
//

#import "micxiugaimimaView.h"

#define SCX 1.5

@implementation micxiugaimimaView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        UIImageView *bg = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.width, self.height)];
        [bg setImage:[UIImage imageNamed:@"sett_xiugaimimaBG"]];
        [self addSubview:bg];
        
        UILabel *lab1 = [[UILabel alloc] initWithFrame:CGRectMake(180*SCX, 5*SCX, 80*SCX, 40*SCX)];
        lab1.text = @"修改密码";
        [lab1 setFont:[UIFont fontWithName:kFontName size:20*SCX]];
        [lab1 setTextColor:[UIColor whiteColor]];
        [self addSubview:lab1];
        
        UILabel *lab2 = [[UILabel alloc] initWithFrame:CGRectMake(20*SCX, (52+8)*SCX, 100*SCX, 40*SCX)];
        lab2.text = @"原始密码";
        [lab2 setFont:[UIFont fontWithName:kFontName size:20*SCX]];
        [self addSubview:lab2];
        
        UILabel *lab3 = [[UILabel alloc] initWithFrame:CGRectMake(20*SCX, (52*2+8)*SCX, 100*SCX, 40*SCX)];
        lab3.text = @"新的密码";
        [lab3 setFont:[UIFont fontWithName:kFontName size:20*SCX]];
        [self addSubview:lab3];
        
        UILabel *lab4 = [[UILabel alloc] initWithFrame:CGRectMake(20*SCX, (52*3+8)*SCX, 100*SCX, 40*SCX)];
        lab4.text = @"确认密码";
        [lab4 setFont:[UIFont fontWithName:kFontName size:20*SCX]];
        [self addSubview:lab4];
        
        UIButton *querenBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [querenBtn setFrame:CGRectMake(20*SCX, (52*4+8)*SCX, 185*SCX, 45*SCX)];
        [querenBtn setImage:[UIImage imageNamed:@"sett_queren"] forState:UIControlStateNormal];
        [querenBtn addTarget:self action:@selector(querenButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:querenBtn];
        
        UIButton *fanhuiBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [fanhuiBtn setFrame:CGRectMake(self.width-20*SCX-185*SCX, (52*4+8)*SCX, 185*SCX, 45*SCX)];
        [fanhuiBtn setImage:[UIImage imageNamed:@"sett_fanhui"] forState:UIControlStateNormal];
        [fanhuiBtn addTarget:self action:@selector(fanhuiButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:fanhuiBtn];
        
        opw = [[UITextField alloc] initWithFrame:CGRectMake(130*SCX, (52+8)*SCX, 200*SCX, 40*SCX)];
        [self addSubview:opw];
        
        npw = [[UITextField alloc] initWithFrame:CGRectMake(130*SCX, (52*2+8)*SCX, 200*SCX, 40*SCX)];
        [self addSubview:npw];
        
        cpw = [[UITextField alloc] initWithFrame:CGRectMake(130*SCX, (52*3+8)*SCX, 200*SCX, 40*SCX)];
        [self addSubview:cpw];
    }
    return self;
}


-(void)querenButtonPressed:(UIButton *)button
{
    if ([npw.text isEqualToString:cpw.text]) {
        [self.hud1 show:YES];
        RbtWebManager *geDiGongCengWebManager = [[RbtWebManager alloc] init];
        geDiGongCengWebManager.name =@"updatePassword";
        geDiGongCengWebManager.delegate = self;
        [geDiGongCengWebManager updatepassword:[RbtUserModel sharedInstance].userName withOldPassword:opw.text andNewPasswork:cpw.text];
    }
    else{
        [RbtCommonTool showInfoAlert:@"新密码两次输入不一致"];
    }
}

-(void)fanhuiButtonPressed:(UIButton *)button
{
    [self removeFromSuperview];
    [self.delegeta fanhui];
}


- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}

#pragma mark- request delegate
- (void)onDataLoadWithService:(RbtWebManager *)webService
                  andResponse:(NSDictionary *)responseDic
{
    [super onDataLoadWithService:webService andResponse:responseDic];
    if ([webService.name isEqualToString:@"updatePassword"]) {
        if ([[responseDic objectForKey:@"rc"] isEqualToString:@"1"]) {
            [RbtCommonTool showInfoAlert:@"修改成功"];
            [[self viewController].navigationController popToRootViewControllerAnimated:YES];
        }
        else{
            [RbtCommonTool showInfoAlert:[responseDic objectForKey:@"rd"]];
        }
    }
}


-(void)setItemsFrame:(UIInterfaceOrientation)orientation
{
    
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
