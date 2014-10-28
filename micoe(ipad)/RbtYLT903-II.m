//
//  RbtYLT903-II-V.m
//  RedBudTek
//
//  Created by Simon on 13-12-3.
//  Copyright (c) 2013年 redbudtek. All rights reserved.
//

#import "RbtYLT903-II.h"
#import "MDRadialProgressView.h"
#import "MDRadialProgressTheme.h"
#import "MDRadialProgressLabel.h"
#import "RbtDataOfResponse.h"

@implementation RbtYLT903_II


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        float topgap = 130+20+44;
        
        UIImageView *backGroungView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 768, 1024-194-49)];
        [backGroungView setImage:[UIImage imageNamed:@"903-IIbg"]];
        [self addSubview:backGroungView];
       
        imageView_qiufa1 = [[UIImageView alloc] initWithFrame:CGRectMake(672, 224-topgap, 51,51)];
        [imageView_qiufa1 setImage:[UIImage imageNamed:@"qiufa_on"]];
        [self addSubview:imageView_qiufa1];
        
        imageView_danxiangfa1 = [[UIImageView alloc] initWithFrame:CGRectMake(672, 418-topgap, 51,51)];
        [imageView_danxiangfa1 setImage:[UIImage imageNamed:@"danxiangfa_on"]];
        [self addSubview:imageView_danxiangfa1];
        
        imageView_EH2 = [[UIImageView alloc] initWithFrame:CGRectMake(630, 511-topgap, 51,51)];
        [imageView_EH2 setImage:[UIImage imageNamed:[NSString stringWithFormat:@"EH2_%@", [self statusBysName:@"EH2_EH"]]]];
        [self addSubview:imageView_EH2];
        
        imageView_T1 = [[UIImageView alloc] initWithFrame:CGRectMake(549, 242-topgap, 51,51)];
        [imageView_T1 setImage:[UIImage imageNamed:@"paiqifa_on"]];
        [self addSubview:imageView_T1];
        
        imageView_E1 = [[UIImageView alloc] initWithFrame:CGRectMake(573, 443-topgap, 51,51)];
        [imageView_E1 setImage:[UIImage imageNamed:[NSString stringWithFormat:@"diancifa_%@", [self statusBysName:@"E1_E"]]]];
        [self addSubview:imageView_E1];
        
        imageView_E2 = [[UIImageView alloc] initWithFrame:CGRectMake(577, 674-topgap, 51,51)];
        [imageView_E2 setImage:[UIImage imageNamed:[NSString stringWithFormat:@"diancifa_%@", [self statusBysName:@"E2_E"]]]];
        [self addSubview:imageView_E2];
        
        
        imageView_T3 = [[UIImageView alloc] initWithFrame:CGRectMake(328, 215-topgap, 106,106)];
        [imageView_T3 setImage:[UIImage imageNamed:@"jireqi"]];
        [self addSubview:imageView_T3];
        
        imageView_T2 = [[UIImageView alloc] initWithFrame:CGRectMake(288, 346-topgap, 193,193)];
        [imageView_T2 setImage:[UIImage imageNamed:@"shuixiang1"]];
        [self addSubview:imageView_T2];
        
        imageView_P4 = [[UIImageView alloc] initWithFrame:CGRectMake(355, 554-topgap, 51,51)];
        [imageView_P4 setImage:[UIImage imageNamed:[NSString stringWithFormat:@"xunhuanbeng_%@", [self statusBysName:@"P4_P"]]]];
        [self addSubview:imageView_P4];
        
        imageView_T4 = [[UIImageView alloc] initWithFrame:CGRectMake(289, 631-topgap, 193,193)];
        [imageView_T4 setImage:[UIImage imageNamed:@"shuixiang2"]];
        [self addSubview:imageView_T4];
        
        imageView_T5 = [[UIImageView alloc] initWithFrame:CGRectMake(328, 842-topgap, 106,106)];
        [imageView_T5 setImage:[UIImage imageNamed:@"linyuqi"]];
        [self addSubview:imageView_T5];
        
        imageView_danxiangfa2 = [[UIImageView alloc] initWithFrame:CGRectMake(172, 242-topgap, 51,51)];
        [imageView_danxiangfa2 setImage:[UIImage imageNamed:@"danxiangfa_on"]];
        [self addSubview:imageView_danxiangfa2];
        
        imageView_qiufa2 = [[UIImageView alloc] initWithFrame:CGRectMake(149, 392-topgap, 51,51)];
        [imageView_qiufa2 setImage:[UIImage imageNamed:@"qiufa_on"]];
        [self addSubview:imageView_qiufa2];
        
        imageView_P1 = [[UIImageView alloc] initWithFrame:CGRectMake(95, 315-topgap, 51,51)];
        [imageView_P1 setImage:[UIImage imageNamed:[NSString stringWithFormat:@"xunhuanbeng_%@", [self statusBysName:@"P1_P"]]]];
        [self addSubview:imageView_P1];
         
        imageView_P3 = [[UIImageView alloc] initWithFrame:CGRectMake(95, 557-topgap, 51,51)];
        [imageView_P3 setImage:[UIImage imageNamed:[NSString stringWithFormat:@"xunhuanbeng_%@", [self statusBysName:@"P3_P"]]]];
        [self addSubview:imageView_P3];
         
        imageView_P2 = [[UIImageView alloc] initWithFrame:CGRectMake(95, 796-topgap, 51,51)];
         [imageView_P2 setImage:[UIImage imageNamed:[NSString stringWithFormat:@"xunhuanbeng_%@", [self statusBysName:@"P2_P"]]]];
         [self addSubview:imageView_P2];
        
        imageViewEH1 = [[UIImageView alloc] initWithFrame:CGRectMake(458, 785-topgap, 51,51)];
        [imageViewEH1 setImage:[UIImage imageNamed:[NSString stringWithFormat:@"EH2_%@", [self statusBysName:@"EH1_EH"]]]];
        [self addSubview:imageViewEH1];
        
        W1_SLabelView = [[UIView alloc] initWithFrame:imageView_T2.frame];
        [W1_SLabelView setBackgroundColor:[UIColor whiteColor]];
        W1_Slabel = [[UILabel alloc] initWithFrame:CGRectMake(60, 30, 70, 70)];
        W1_Slabel.text = [NSString stringWithFormat:@"%@", [RbtDataOfResponse sharedInstance].num_W1_S];
        W1_SLabelView.backgroundColor = [UIColor clearColor];
        [W1_Slabel setFont:[UIFont fontWithName:kFontName size:60]];
        [W1_Slabel setTextAlignment:NSTextAlignmentCenter];
        [W1_SLabelView addSubview:W1_Slabel];
        UILabel *danwei1 = [[UILabel alloc] initWithFrame:CGRectMake(130, 60, 60, 30)];
        danwei1.text = @"%";
        [danwei1 setFont:[UIFont fontWithName:kFontName size:24]];
        [W1_SLabelView addSubview:danwei1];
        
        T1_Slabel = [[UILabel alloc] initWithFrame:CGRectMake(60, 110, 70, 50)];
        T1_Slabel.text = [NSString stringWithFormat:@"%@", [RbtDataOfResponse sharedInstance].num_T1_S];
        [T1_Slabel setFont:[UIFont fontWithName:kFontName size:60]];
        [T1_Slabel setTextAlignment:NSTextAlignmentCenter];
        [W1_SLabelView addSubview:T1_Slabel];
        UILabel *danwei2 = [[UILabel alloc] initWithFrame:CGRectMake(136, 130, 60, 30)];
        danwei2.text = @"℃";
        [danwei2 setFont:[UIFont fontWithName:kFontName size:24]];
        [W1_SLabelView addSubview:danwei2];
        
//        [self addSubview:W1_SLabelView];
        [self insertSubview:W1_SLabelView belowSubview:imageView_T2];
        
        W2_SLabelView = [[UIView alloc] initWithFrame:imageView_T4.frame];
        [W2_SLabelView setBackgroundColor:[UIColor whiteColor]];
        W2_Slabel = [[UILabel alloc] initWithFrame:CGRectMake(60, 40, 75, 50)];
        W2_Slabel.text = [NSString stringWithFormat:@"%@", [RbtDataOfResponse sharedInstance].num_W2_S];
        W2_SLabelView.backgroundColor = [UIColor clearColor];
        [W2_Slabel setFont:[UIFont fontWithName:kFontName size:60]];
        [W2_Slabel setTextAlignment:NSTextAlignmentCenter];
        [W2_SLabelView addSubview:W2_Slabel];
        UILabel *danwei3 = [[UILabel alloc] initWithFrame:CGRectMake(136, 60, 60, 30)];
        danwei3.text = @"%";
        [danwei3 setFont:[UIFont fontWithName:kFontName size:24]];
        [W2_SLabelView addSubview:danwei3];
        
        T2_Slabel = [[UILabel alloc] initWithFrame:CGRectMake(60, 110, 70, 50)];
        T2_Slabel.text = [NSString stringWithFormat:@"%@", [RbtDataOfResponse sharedInstance].num_T2_S];
        [T2_Slabel setFont:[UIFont fontWithName:kFontName size:60]];
        [T2_Slabel setTextAlignment:NSTextAlignmentCenter];
        [W2_SLabelView addSubview:T2_Slabel];
        UILabel *danwei4 = [[UILabel alloc] initWithFrame:CGRectMake(136, 130, 60, 30)];
        danwei4.text = @"℃";
        [danwei4 setFont:[UIFont fontWithName:kFontName size:24]];
        [W2_SLabelView addSubview:danwei4];
        
//        [self addSubview:W2_SLabelView];
        [self insertSubview:W2_SLabelView belowSubview:imageView_T4];
        
        W_S1View = [[MDRadialProgressView alloc] init];
        [W_S1View setSize:CGSizeMake(210, 210)];
        W_S1View.center = imageView_T2.center;
        W_S1View.progressTotal = 100;
        W_S1View.progressCounter = [[RbtDataOfResponse sharedInstance].num_W1_S intValue];
//        W_S1View.theme.completedColor = [UIColor redColor];
//        W_S1View.theme.incompletedColor = [UIColor grayColor];
        W_S1View.theme.completedColor = [UIColor colorWithRed:77/255.0 green:190/255.0 blue:183/255.0 alpha:1];
        W_S1View.theme.incompletedColor = [UIColor colorWithRed:200/255.0 green:235/255.0 blue:233/255.0 alpha:1];
        W_S1View.theme.sliceDividerHidden = YES;
        W_S1View.label.hidden = YES;
        UITapGestureRecognizer *tapInW_S1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapInW_S1)];
        [W_S1View addGestureRecognizer:tapInW_S1];
        
        [self addSubview:W_S1View];

        
        W_S2View = [[MDRadialProgressView alloc] init];
        [W_S2View setSize:CGSizeMake(210, 210)];
        W_S2View.center = imageView_T4.center;
        W_S2View.progressTotal = 100;
        W_S2View.progressCounter = [[RbtDataOfResponse sharedInstance].num_W2_S intValue];
//        W_S2View.theme.completedColor = [UIColor redColor];
//        W_S2View.theme.incompletedColor = [UIColor grayColor];
        W_S2View.theme.completedColor = [UIColor colorWithRed:77/255.0 green:190/255.0 blue:183/255.0 alpha:1];
        W_S2View.theme.incompletedColor = [UIColor colorWithRed:200/255.0 green:235/255.0 blue:233/255.0 alpha:1];
        W_S2View.theme.sliceDividerHidden = YES;
        W_S2View.label.hidden = YES;
        UITapGestureRecognizer *tapInW_S2 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapInW_S2)];
        [W_S2View addGestureRecognizer:tapInW_S2];
        
        [self addSubview:W_S2View];
        

    }
    return self;
}

-(void)tapInW_S1
{
    imageView_T2.hidden = !imageView_T2.hidden;
}

-(void)tapInW_S2
{
    imageView_T4.hidden = !imageView_T4.hidden;
}

-(void)setStatus
{
    [imageView_EH2 setImage:[UIImage imageNamed:[NSString stringWithFormat:@"EH2_%@", [self statusBysName:@"EH2_EH"]]]];
    [imageView_E1 setImage:[UIImage imageNamed:[NSString stringWithFormat:@"diancifa_%@", [self statusBysName:@"E1_E"]]]];
    [imageView_E2 setImage:[UIImage imageNamed:[NSString stringWithFormat:@"diancifa_%@", [self statusBysName:@"E2_E"]]]];
    [imageView_P4 setImage:[UIImage imageNamed:[NSString stringWithFormat:@"xunhuanbeng_%@", [self statusBysName:@"P4_P"]]]];
    [imageView_P1 setImage:[UIImage imageNamed:[NSString stringWithFormat:@"xunhuanbeng_%@", [self statusBysName:@"P1_P"]]]];
    [imageView_P3 setImage:[UIImage imageNamed:[NSString stringWithFormat:@"xunhuanbeng_%@", [self statusBysName:@"P3_P"]]]];
    [imageView_P2 setImage:[UIImage imageNamed:[NSString stringWithFormat:@"xunhuanbeng_%@", [self statusBysName:@"P2_P"]]]];
    [imageViewEH1 setImage:[UIImage imageNamed:[NSString stringWithFormat:@"EH2_%@", [self statusBysName:@"EH1_EH"]]]];
    W1_Slabel.text = [NSString stringWithFormat:@"%@", [RbtDataOfResponse sharedInstance].num_W1_S];
    T1_Slabel.text = [NSString stringWithFormat:@"%@", [RbtDataOfResponse sharedInstance].num_T1_S];
    W2_Slabel.text = [NSString stringWithFormat:@"%@", [RbtDataOfResponse sharedInstance].num_W2_S];
    T2_Slabel.text = [NSString stringWithFormat:@"%@", [RbtDataOfResponse sharedInstance].num_T2_S];
    W_S1View.progressCounter = [[RbtDataOfResponse sharedInstance].num_W1_S intValue];
    W_S2View.progressCounter = [[RbtDataOfResponse sharedInstance].num_W2_S intValue];
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
