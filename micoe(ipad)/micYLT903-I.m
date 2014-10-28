//
//  micYLT903-I.m
//  micoe(ipad)
//
//  Created by Simon_Tang on 14-4-18.
//  Copyright (c) 2014年 Simon. All rights reserved.
//

#import "micYLT903-I.h"

#import "MDRadialProgressView.h"
#import "MDRadialProgressTheme.h"
#import "MDRadialProgressLabel.h"
#import "RbtDataOfResponse.h"

@implementation micYLT903_I

@synthesize imageView_E1, imageView_E2, imageView_EH1, imageView_EH2, imageView_T5, imageView_T4, imageView_T3, imageView_T2, imageView_P2, imageView_EH3, imageView_EH4, imageView_paiqifa, imageView_X, imageView_zengyabeng;


- (id)initWithFrame:(CGRect)frame
{
    self = [[[NSBundle mainBundle] loadNibNamed:@"micYLT903-II" owner:self options:nil] objectAtIndex:1];
    if (self) {
        // Initialization code
        float topgap = 130+20+44;
        
//        UIImageView *backGroungView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 768, 1024-194-49)];
//        [backGroungView setImage:[UIImage imageNamed:@"903-Ibg"]];
//        [self addSubview:backGroungView];
        
//        imageView_P2 = [[UIImageView alloc] initWithFrame:CGRectMake(644, 742-topgap, 51, 51)];
        [imageView_P2 setImage:[UIImage imageNamed:[NSString stringWithFormat:@"xunhuanbeng_%@", [self statusBysName:@"P2_P"]]]];
//        [self addSubview:imageView_P2];
        
//        imageView_EH4 = [[UIImageView alloc] initWithFrame:CGRectMake(568, 279-topgap, 51, 51)];
        [imageView_EH4 setImage:[UIImage imageNamed:[NSString stringWithFormat:@"EH2_%@", [self statusBysName:@"EH4_EH"]]]];
//        [self addSubview:imageView_EH4];
        
//        imageView_paiqifa = [[UIImageView alloc] initWithFrame:CGRectMake(552, 461-topgap, 51, 51)];
        [imageView_paiqifa setImage:[UIImage imageNamed:@"paiqifa_on"]];
//        [self addSubview:imageView_paiqifa];
        
//        imageView_EH3 = [[UIImageView alloc] initWithFrame:CGRectMake(369, 279-topgap, 51, 51)];
        [imageView_EH3 setImage:[UIImage imageNamed:[NSString stringWithFormat:@"EH2_%@", [self statusBysName:@"EH3_EH"]]]];
//        [self addSubview:imageView_EH3];
        
//        imageView_T3 = [[UIImageView alloc] initWithFrame:CGRectMake(341, 357-topgap, 106, 106)];
        [imageView_T3 setImage:[UIImage imageNamed:@"jireqi"]];
//        [self addSubview:imageView_T3];
        
//        imageView_T2 = [[UIImageView alloc] initWithFrame:CGRectMake(302, 508-topgap, 193, 193)];
        [imageView_T2 setImage:[UIImage imageNamed:@"shuixiang1"]];
//        [self addSubview:imageView_T2];
        
//        imageView_T5 = [[UIImageView alloc] initWithFrame:CGRectMake(341, 843-topgap, 106, 106)];
        [imageView_T5 setImage:[UIImage imageNamed:@"linyuqi"]];
//        [self addSubview:imageView_T5];
        
//        imageView_E1 = [[UIImageView alloc] initWithFrame:CGRectMake(163, 279-topgap, 51, 51)];
        [imageView_E1 setImage:[UIImage imageNamed:[NSString stringWithFormat:@"diancifa_%@", [self statusBysName:@"E1_E"]]]];
//        [self addSubview:imageView_E1];
        
//        imageView_X = [[UIImageView alloc] initWithFrame:CGRectMake(138, 553-topgap, 51, 51)];
        [imageView_X setImage:[UIImage imageNamed:@"EH2_on"]];
//        [self addSubview:imageView_X];
        
//        imageView_zengyabeng = [[UIImageView alloc] initWithFrame:CGRectMake(158, 870-topgap, 51, 51)];
        [imageView_zengyabeng setImage:[UIImage imageNamed:@"zengyabeng_on"]];
//        [self addSubview:imageView_zengyabeng];
        
//        imageView_EH2 = [[UIImageView alloc] initWithFrame:CGRectMake(85, 237-topgap, 51, 51)];
        [imageView_EH2 setImage:[UIImage imageNamed:[NSString stringWithFormat:@"EH2_%@", [self statusBysName:@"EH2_EH"]]]];
//        [self addSubview:imageView_EH2];
        
//        imageView_E2 = [[UIImageView alloc] initWithFrame:CGRectMake(85, 335-topgap, 51, 51)];
        [imageView_E2 setImage:[UIImage imageNamed:[NSString stringWithFormat:@"diancifa_%@", [self statusBysName:@"E2_E"]]]];
//        [self addSubview:imageView_E2];
        
//        imageView_T4 = [[UIImageView alloc] initWithFrame:CGRectMake(85, 461-topgap, 51, 51)];
        [imageView_T4 setImage:[UIImage imageNamed:@"xunhuanbeng_on"]];
//        [self addSubview:imageView_T4];
        
//        imageView_EH1 = [[UIImageView alloc] initWithFrame:CGRectMake(85, 742-topgap, 51, 51)];
        [imageView_EH1 setImage:[UIImage imageNamed:[NSString stringWithFormat:@"EH2_%@", [self statusBysName:@"EH1_EH"]]]];
//        [self addSubview:imageView_EH1];
        
        W_S1View = [[MDRadialProgressView alloc] init];
        [W_S1View setSize:CGSizeMake(210, 210)];
        W_S1View.center = imageView_T2.center;
        W_S1View.progressTotal = 100;
        W_S1View.progressCounter = [[RbtDataOfResponse sharedInstance].num_W1_S intValue];
        W_S1View.theme.completedColor = [UIColor colorWithRed:77/255.0 green:190/255.0 blue:183/255.0 alpha:1];
        W_S1View.theme.incompletedColor = [UIColor colorWithRed:200/255.0 green:235/255.0 blue:233/255.0 alpha:1];
        W_S1View.theme.sliceDividerHidden = YES;
        W_S1View.label.hidden = YES;
        UITapGestureRecognizer *tapInW_S1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapInW_S1)];
        [W_S1View addGestureRecognizer:tapInW_S1];
        
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
        
        [self insertSubview:W1_SLabelView belowSubview:imageView_T2];
        
        
        [self addSubview:W_S1View];
        
    }
    return self;
}

-(void)tapInW_S1
{
    imageView_T2.hidden = !imageView_T2.hidden;
}

-(void)setStatus
{
    [imageView_P2 setImage:[UIImage imageNamed:[NSString stringWithFormat:@"xunhuanbeng_%@", [self statusBysName:@"P2_P"]]]];
    [imageView_EH4 setImage:[UIImage imageNamed:[NSString stringWithFormat:@"EH2_%@", [self statusBysName:@"EH4_EH"]]]];
    [imageView_EH3 setImage:[UIImage imageNamed:[NSString stringWithFormat:@"EH2_%@", [self statusBysName:@"EH3_EH"]]]];
    [imageView_E1 setImage:[UIImage imageNamed:[NSString stringWithFormat:@"diancifa_%@", [self statusBysName:@"E1_E"]]]];
    [imageView_EH2 setImage:[UIImage imageNamed:[NSString stringWithFormat:@"EH2_%@", [self statusBysName:@"EH2_EH"]]]];
    [imageView_E2 setImage:[UIImage imageNamed:[NSString stringWithFormat:@"diancifa_%@", [self statusBysName:@"E2_E"]]]];
    [imageView_EH1 setImage:[UIImage imageNamed:[NSString stringWithFormat:@"EH2_%@", [self statusBysName:@"EH1_EH"]]]];
    
    
    W_S1View.progressCounter = [[RbtDataOfResponse sharedInstance].num_W1_S intValue];
    W1_Slabel.text = [NSString stringWithFormat:@"%@", [RbtDataOfResponse sharedInstance].num_W1_S];
    T1_Slabel.text = [NSString stringWithFormat:@"%@", [RbtDataOfResponse sharedInstance].num_T1_S];
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
