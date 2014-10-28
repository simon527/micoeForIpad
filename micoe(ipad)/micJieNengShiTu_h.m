//
//  micJieNengShiTu_h.m
//  micoe(ipad)
//
//  Created by Simon on 14-5-8.
//  Copyright (c) 2014年 Simon. All rights reserved.
//

#import "micJieNengShiTu_h.h"
#import "RbtDataOfResponse.h"

@implementation micJieNengShiTu_h

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        [self postData];
        
        float gap1;
        float gap2;
        float gap3;
        float fontNum;
        
        gap1 = 10;
        gap2 = 10;
        gap3 = 40;
        fontNum = 120;
        
        float sideGap = 9;
        
        UIImageView *upImageView = [[UIImageView alloc] initWithFrame:CGRectMake(sideGap, gap1, self.width-(sideGap*2), 218)];
        [upImageView setImage:[UIImage imageNamed:@"jnst_shangImage"]];
        [self addSubview:upImageView];
        
        UIImageView *downImageView = [[UIImageView alloc] initWithFrame:CGRectMake(sideGap, gap1+upImageView.height+gap2, self.width-(sideGap*2), self.height-upImageView.height-gap2-20)];
        [downImageView setImage:[UIImage imageNamed:@"jnst_xiaImage"]];
        [self addSubview:downImageView];
        
        float timeButtonGap = (upImageView.width-164-167-157)/2;
        
        btn_week = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn_week setTag:4010];
        [btn_week setFrame:CGRectMake(timeButtonGap, gap1+7, 164, 37)];
        [btn_week setImage:[UIImage imageNamed:@"jnst_week"] forState:UIControlStateNormal];
        [btn_week setImage:[UIImage imageNamed:@"jnst_week_s"] forState:UIControlStateSelected];
        [btn_week addTarget:self action:@selector(timeButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:btn_week];
        
        btn_month = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn_month setTag:4011];
        [btn_month setFrame:CGRectMake(timeButtonGap+164, gap1+7, 167, 37)];
        [btn_month setImage:[UIImage imageNamed:@"jnst_month"] forState:UIControlStateNormal];
        [btn_month setImage:[UIImage imageNamed:@"jnst_month_s"] forState:UIControlStateSelected];
        [btn_month addTarget:self action:@selector(timeButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:btn_month];
        
        btn_year = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn_year setTag:4012];
        [btn_year setFrame:CGRectMake(timeButtonGap+164+167, gap1+7, 164, 37)];
        [btn_year setImage:[UIImage imageNamed:@"jnst_year"] forState:UIControlStateNormal];
        [btn_year setImage:[UIImage imageNamed:@"jnst_year_s"] forState:UIControlStateSelected];
        [btn_year addTarget:self action:@selector(timeButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:btn_year];
        
        btn_week.selected = YES;
        btn_month.selected = NO;
        btn_year.selected = NO;
        
        float top_btn = (268-218);
        float gap_btn = (upImageView.width-249*3)/6;
        
        btn_jireqi = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn_jireqi setTag:4000];
        [btn_jireqi setFrame:CGRectMake(sideGap+gap_btn, downImageView.origin.y+top_btn, 249, 218)];
        [btn_jireqi setImage:[UIImage imageNamed:@"jnst_jireqi"] forState:UIControlStateNormal];
        [btn_jireqi setImage:[UIImage imageNamed:@"jnst_jireqi_s"] forState:UIControlStateSelected];
        [btn_jireqi addTarget:self action:@selector(jienengBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:btn_jireqi];
        
        btn_leijijianpai = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn_leijijianpai setTag:4001];
        [btn_leijijianpai setFrame:CGRectMake(sideGap+gap_btn*3+249, downImageView.origin.y+top_btn, 249, 218)];
        [btn_leijijianpai setImage:[UIImage imageNamed:@"jnst_leijijianpai"] forState:UIControlStateNormal];
        [btn_leijijianpai setImage:[UIImage imageNamed:@"jnst_leijijianpai_s"] forState:UIControlStateSelected];
        [btn_leijijianpai addTarget:self action:@selector(jienengBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:btn_leijijianpai];
        
        btn_leijijieyue = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn_leijijieyue setTag:4002];
        [btn_leijijieyue setFrame:CGRectMake(sideGap+gap_btn*5+249*2, downImageView.origin.y+top_btn, 249, 218)];
        [btn_leijijieyue setImage:[UIImage imageNamed:@"jnst_leijijieyue"] forState:UIControlStateNormal];
        [btn_leijijieyue setImage:[UIImage imageNamed:@"jnst_leijijieyue_s"] forState:UIControlStateSelected];
        [btn_leijijieyue addTarget:self action:@selector(jienengBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:btn_leijijieyue];
        
        titleLbel = [[UILabel alloc] initWithFrame:CGRectMake(330, gap1+55, 250, 50)];
        titleLbel.text = @"累计减排二氧化碳";
        [titleLbel setTextAlignment:NSTextAlignmentLeft];
        [titleLbel setBackgroundColor:[UIColor clearColor]];
        [titleLbel setFont:[UIFont fontWithName:kFontName size:22]];
        [self addSubview:titleLbel];
        
        showLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, gap1+85, 580, 120)];
        showLabel.text = [[RbtDataOfResponse sharedInstance].jienengDic objectForKey:chooseType];
        [showLabel setTextAlignment:NSTextAlignmentRight];
        [showLabel setBackgroundColor:[UIColor clearColor]];
        
        [showLabel setFont:[UIFont fontWithName:kFontName size:fontNum]];
        //    [showLabel sizeToFit];
        
        [self addSubview:showLabel];
        
        unitLabel = [[UILabel alloc] initWithFrame:CGRectMake(600, gap1+160, 80, 40)];
        unitLabel.text = @"吨";
        [unitLabel setBackgroundColor:[UIColor clearColor]];
        
        [unitLabel setFont:[UIFont fontWithName:kFontName size:25]];
        [unitLabel sizeToFit];
        
        [self addSubview:unitLabel];
        
        btn_jireqi.selected = NO;
        btn_leijijianpai.selected = YES;
        btn_leijijieyue.selected = NO;
    }
    return self;
}

-(void)jienengBtnClicked:(UIButton *)btn
{
    btn_jireqi.selected = NO;
    btn_leijijianpai.selected = NO;
    btn_leijijieyue.selected = NO;
    int tag = btn.tag;
     chooseTypeTag = [NSString stringWithFormat:@"%d", tag];
    switch (tag) {
        case 4000:
            btn_jireqi.selected = YES;
            titleLbel.text = @"集热器方阵累计热量";
            unitLabel.text = @"焦";
            chooseType = @"sc";
            break;
        case 4001:
            btn_leijijianpai.selected = YES;
            titleLbel.text = @"累计减排二氧化碳";
            unitLabel.text = @"吨";
            //            showLabel.text = [RbtDataOfjienengshitu sharedInstance].sco;
            chooseType = @"sco";
            break;
        case 4002:
            btn_leijijieyue.selected = YES;
            titleLbel.text = @"累计节约电量";
            unitLabel.text = @"度";
            //            showLabel.text = [RbtDataOfjienengshitu sharedInstance].sp;
            chooseType = @"sp";
            break;
            
        default:
            break;
    }
    [self postData];
}

-(void)timeButtonClicked:(UIButton *)sender
{
    btn_week.selected = NO;
    btn_month.selected = NO;
    btn_year.selected = NO;
    chooseTimeTag = [NSString stringWithFormat:@"%d", sender.tag];
    switch (sender.tag) {
        case 4010:
            btn_week.selected = YES;
            chooseTime = @"1";
            break;
            
        case 4011:
            btn_month.selected = YES;
            chooseTime = @"3";
            break;
            
        case 4012:
            btn_year.selected = YES;
            chooseTime = @"12";
            break;
            
        default:
            break;
    }
    [self postData];
}


-(void)jienengBtnWithTagstr:(NSString *)tagStr
{
    btn_jireqi.selected = NO;
    btn_leijijianpai.selected = NO;
    btn_leijijieyue.selected = NO;
    int tag = [tagStr integerValue];
   
    switch (tag) {
        case 4000:
            btn_jireqi.selected = YES;
            titleLbel.text = @"集热器方阵累计热量";
            unitLabel.text = @"焦";
            chooseType = @"sc";
            break;
        case 4001:
            btn_leijijianpai.selected = YES;
            titleLbel.text = @"累计减排二氧化碳";
            unitLabel.text = @"吨";
            //            showLabel.text = [RbtDataOfjienengshitu sharedInstance].sco;
            chooseType = @"sco";
            break;
        case 4002:
            btn_leijijieyue.selected = YES;
            titleLbel.text = @"累计节约电量";
            unitLabel.text = @"度";
            //            showLabel.text = [RbtDataOfjienengshitu sharedInstance].sp;
            chooseType = @"sp";
            break;
            
        default:
            break;
    }
    
}

-(void)timeBtnWithTagstr:(NSString *)tagStr
{
    btn_week.selected = NO;
    btn_month.selected = NO;
    btn_year.selected = NO;
    int tag = [tagStr integerValue];
    switch (tag) {
        case 4010:
            btn_week.selected = YES;
            chooseTime = @"1";
            break;
            
        case 4011:
            btn_month.selected = YES;
            chooseTime = @"3";
            break;
            
        case 4012:
            btn_year.selected = YES;
            chooseTime = @"12";
            break;
            
        default:
            break;
    }
}



-(void)postData
{
    if (!chooseTime) {
        chooseTime = @"1";
        chooseTimeTag = @"4010";
    }
    if (!chooseType) {
        chooseType = @"sco";
        chooseTypeTag = @"4001";
    }
    RbtWebManager *webManager;
    if([RbtCommonTool getJinRuMode] != LiXianGongCheng){
        webManager = [RbtWebManager getRbtManager:YES];
    }
    else{
        webManager = [RbtWebManager getRbtManager:NO];
    }
    webManager.name = @"jienengweb";
    webManager.delegate = self;
    [self.hud1 show:YES];
    [webManager getJieNengInfoWithU:[RbtUserModel sharedInstance].userName withP:[RbtProjectModel sharedInstance].projectid andT:chooseTime];
    
}

#pragma mark- request delegate
- (void)onDataLoadWithService:(RbtWebManager *)webService
                  andResponse:(NSDictionary *)responseDic
{
    [super onDataLoadWithService:webService andResponse:responseDic];
    
    [[NSUserDefaults standardUserDefaults] setObject:chooseTimeTag forKey:@"jienengChooseTime"];
    [[NSUserDefaults standardUserDefaults] setObject:chooseTypeTag forKey:@"jienengChooseType"];
    if ([webService.name isEqualToString:@"jienengweb"]) {
        if ([RbtCommonTool getJinRuMode] == LiXianGongCheng) {
            [RbtDataOfResponse sharedInstance].jienengDic = responseDic;
        }
        else{
            if ([(NSString *)[responseDic objectForKey:@"rc"] isEqualToString:@"1"]) {
                NSDictionary *tempDIc = [responseDic objectForKey:@"rt"];
                [RbtDataOfResponse sharedInstance].jienengDic = tempDIc;
            }
            else
            {
                [RbtCommonTool showInfoAlert:[responseDic objectForKey:@"rd"]];
            }
        }
    }
    
    
    
    showLabel.text = [[RbtDataOfResponse sharedInstance].jienengDic objectForKey:chooseType];
    
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

