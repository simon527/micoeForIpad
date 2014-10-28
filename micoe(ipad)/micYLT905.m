//
//  micYLT905.m
//  micoe(ipad)
//
//  Created by Simon_Tang on 14-4-18.
//  Copyright (c) 2014年 Simon. All rights reserved.
//

#import "micYLT905.h"
#import "MDRadialProgressView.h"
#import "MDRadialProgressTheme.h"
#import "MDRadialProgressLabel.h"
#import "RbtDataOfResponse.h"

@implementation micYLT905

@synthesize imageView_P2, imageView_T2, imageView_T4, imageView_T5, imageView_EH2, imageView_E2, imageView_E1, imageView_danxiangfa, imageView_dianguolu, imageView_E3, imageView_E4, imageView_E5, imageView_jireqi, imageView_linyuqi, imageView_P1, imageView_P1b, imageView_P2b, imageView_P3, imageView_P3b, imageView_P4, imageView_P4b, imageView_P5, imageView_P5b, imageView_paikongshuixiang, imageView_T1, imageView_yalichuanganqi, imageView_yaliguan;

- (id)initWithFrame:(CGRect)frame
{
    self = [[[NSBundle mainBundle] loadNibNamed:@"micYLT903-II" owner:self options:nil] objectAtIndex:2];
    if (self) {
        // Initialization code
        
        float topgap = 130+20+44;
        
//        UIImageView *backGroungView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 768, 1024-194-49)];
//        [backGroungView setImage:[UIImage imageNamed:@"905bg"]];
//        [self addSubview:backGroungView];
        
//        imageView_P5b = [[UIImageView alloc] initWithFrame:CGRectMake(694, 345-topgap, 51, 51)];
        [imageView_P5b setImage:[UIImage imageNamed:@"xunhuanbeng_on"]];
        //        [imageView_P5b setImage:[UIImage imageNamed:[NSString stringWithFormat:@"xunhuanbeng_%@", [self statusBysName:@"P5b_P"]]]];
//        [self addSubview:imageView_P5b];
        
        imageView_P5 = [[UIImageView alloc] initWithFrame:CGRectMake(635, 345-topgap, 51, 51)];
        [imageView_P5 setImage:[UIImage imageNamed:[NSString stringWithFormat:@"xunhuanbeng_%@", [self statusBysName:@"P5_P"]]]];
//        [self addSubview:imageView_P5];
        
//        imageView_linyuqi = [[UIImageView alloc] initWithFrame:CGRectMake(633, 620-topgap, 106, 106)];
        [imageView_linyuqi setImage:[UIImage imageNamed:@"linyuqi"]];
//        [self addSubview:imageView_linyuqi];
        
//        imageView_yalichuanganqi = [[UIImageView alloc] initWithFrame:CGRectMake(674, 735-topgap, 28, 28)];
        [imageView_yalichuanganqi setImage:[UIImage imageNamed:@"chuanganqi_on"]];
//        [self addSubview:imageView_yalichuanganqi];
        
//        imageView_yaliguan = [[UIImageView alloc] initWithFrame:CGRectMake(674, 765-topgap, 28, 28)];
        [imageView_yaliguan setImage:[UIImage imageNamed:@"yaliguan"]];
//        [self addSubview:imageView_yaliguan];
        
//        imageView_danxiangfa = [[UIImageView alloc] initWithFrame:CGRectMake(661, 800-topgap, 51, 51)];
        [imageView_danxiangfa setImage:[UIImage imageNamed:@"danxiangfa_on"]];
//        [self addSubview:imageView_danxiangfa];
        
//        imageView_T1 = [[UIImageView alloc] initWithFrame:CGRectMake(556, 450-topgap, 51, 51)];
        [imageView_T1 setImage:[UIImage imageNamed:@"paiqifa_on"]];
//        [self addSubview:imageView_T1];
        
//        imageView_T5 = [[UIImageView alloc] initWithFrame:CGRectMake(610, 564-topgap, 51, 51)];
        [imageView_T5 setImage:[UIImage imageNamed:@"paiqifa_on"]];
//        [self addSubview:imageView_T5];
        
//        imageView_E3 = [[UIImageView alloc] initWithFrame:CGRectMake(504, 564-topgap, 51, 51)];
        [imageView_E3 setImage:[UIImage imageNamed:@"diancifa_on"]];
//        [self addSubview:imageView_E3];
        
//        imageView_P2 = [[UIImageView alloc] initWithFrame:CGRectMake(533, 811-topgap, 51, 51)];
        [imageView_P2 setImage:[UIImage imageNamed:@"xunhuanbeng_on"]];
//        [self addSubview:imageView_P2];
        
//        imageView_P2b = [[UIImageView alloc] initWithFrame:CGRectMake(533, 865-topgap, 51, 51)];
        [imageView_P2b setImage:[UIImage imageNamed:@"xunhuanbeng_on"]];
//        [self addSubview:imageView_P2b];
        
//        imageView_jireqi = [[UIImageView alloc] initWithFrame:CGRectMake(446, 278-topgap, 106, 106)];
        [imageView_jireqi setImage:[UIImage imageNamed:@"jireqi"]];
//        [self addSubview:imageView_jireqi];
        
//        imageView_dianguolu = [[UIImageView alloc] initWithFrame:CGRectMake(454, 409-topgap, 51, 51)];
        [imageView_dianguolu setImage:[UIImage imageNamed:@"dianguolu"]];
//        [self addSubview:imageView_dianguolu];
        
//        imageView_T2 = [[UIImageView alloc] initWithFrame:CGRectMake(321, 445-topgap, 147, 147)];
        [imageView_T2 setImage:[UIImage imageNamed:@"shuixiang1"]];
//        [self addSubview:imageView_T2];
        
//        imageView_P3 = [[UIImageView alloc] initWithFrame:CGRectMake(308, 666-topgap, 51, 51)];
        [imageView_P3 setImage:[UIImage imageNamed:@"xunhuanbeng_on"]];
//        [self addSubview:imageView_P3];
        
//        imageView_P3b = [[UIImageView alloc] initWithFrame:CGRectMake(432, 666-topgap, 51, 51)];
        [imageView_P3b setImage:[UIImage imageNamed:@"xunhuanbeng_on"]];
//        [self addSubview:imageView_P3b];
        
//        imageView_T4 = [[UIImageView alloc] initWithFrame:CGRectMake(321, 787-topgap, 147, 147)];
        [imageView_T4 setImage:[UIImage imageNamed:@"shuixiang2"]];
//        [self addSubview:imageView_T4];
        
//        imageView_paikongshuixiang = [[UIImageView alloc] initWithFrame:CGRectMake(267, 213-topgap, 106, 106)];
        [imageView_paikongshuixiang setImage:[UIImage imageNamed:@"paikongshuixiang"]];
//        [self addSubview:imageView_paikongshuixiang];
        
//        imageView_P4 = [[UIImageView alloc] initWithFrame:CGRectMake(312, 339-topgap, 51, 51)];
        [imageView_P4 setImage:[UIImage imageNamed:@"xunhuanbeng_on"]];
//        [self addSubview:imageView_P4];
        
//        imageView_P4b = [[UIImageView alloc] initWithFrame:CGRectMake(312, 394-topgap, 51, 51)];
        [imageView_P4b setImage:[UIImage imageNamed:@"xunhuanbeng_on"]];
//        [self addSubview:imageView_P4b];
        
//        imageView_P1 = [[UIImageView alloc] initWithFrame:CGRectMake(230, 473-topgap, 51, 51)];
        [imageView_P1 setImage:[UIImage imageNamed:@"xunhuanbeng_on"]];
//        [self addSubview:imageView_P1];
        
//        imageView_P1b = [[UIImageView alloc] initWithFrame:CGRectMake(230, 529-topgap, 51, 51)];
        [imageView_P1b setImage:[UIImage imageNamed:@"xunhuanbeng_on"]];
//        [self addSubview:imageView_P1b];
        
//        imageView_E2 = [[UIImageView alloc] initWithFrame:CGRectMake(186, 842-topgap, 51, 51)];
        [imageView_E2 setImage:[UIImage imageNamed:@"diancifa_on"]];
//        [self addSubview:imageView_E2];
        
//        imageView_E5 = [[UIImageView alloc] initWithFrame:CGRectMake(61, 387-topgap, 51, 51)];
        [imageView_E5 setImage:[UIImage imageNamed:@"diancifa_on"]];
//        [self addSubview:imageView_E5];
        
//        imageView_E4 = [[UIImageView alloc] initWithFrame:CGRectMake(49, 564-topgap, 51, 51)];
        [imageView_E4 setImage:[UIImage imageNamed:@"diancifa_on"]];
//        [self addSubview:imageView_E4];
        
//        imageView_E1 = [[UIImageView alloc] initWithFrame:CGRectMake(85, 702-topgap, 51, 51)];
        [imageView_E1 setImage:[UIImage imageNamed:@"diancifa_on"]];
//        [self addSubview:imageView_E1];
        
//        imageView_EH2 = [[UIImageView alloc] initWithFrame:CGRectMake(85, 882-topgap, 51, 51)];
        [imageView_EH2 setImage:[UIImage imageNamed:@"EH2_on"]];
//        [self addSubview:imageView_EH2];
        
        W1_SLabelView = [[UIView alloc] initWithFrame:imageView_T2.frame];
        [W1_SLabelView setBackgroundColor:[UIColor whiteColor]];
        W1_Slabel = [[UILabel alloc] initWithFrame:CGRectMake(48-10, 24-10, 56, 56)];
        W1_Slabel.text = [NSString stringWithFormat:@"%@", [RbtDataOfResponse sharedInstance].num_W1_S];
        W1_SLabelView.backgroundColor = [UIColor clearColor];
        [W1_Slabel setFont:[UIFont fontWithName:kFontName size:48]];
        [W1_Slabel setTextAlignment:NSTextAlignmentCenter];
        [W1_SLabelView addSubview:W1_Slabel];
        UILabel *danwei1 = [[UILabel alloc] initWithFrame:CGRectMake(104-10, 48-10, 56, 56)];
        danwei1.text = @"%";
        [danwei1 setFont:[UIFont fontWithName:kFontName size:18]];
        [W1_SLabelView addSubview:danwei1];
        
        T1_Slabel = [[UILabel alloc] initWithFrame:CGRectMake(48-10, 88-10, 56, 40)];
        T1_Slabel.text = [NSString stringWithFormat:@"%@", [RbtDataOfResponse sharedInstance].num_T1_S];
        [T1_Slabel setFont:[UIFont fontWithName:kFontName size:48]];
        [T1_Slabel setTextAlignment:NSTextAlignmentCenter];
        [W1_SLabelView addSubview:T1_Slabel];
        UILabel *danwei2 = [[UILabel alloc] initWithFrame:CGRectMake(104-10, 104-10, 48, 24)];
        danwei2.text = @"℃";
        [danwei2 setFont:[UIFont fontWithName:kFontName size:18]];
        [W1_SLabelView addSubview:danwei2];
        
        //        [self addSubview:W1_SLabelView];
        [self insertSubview:W1_SLabelView belowSubview:imageView_T2];
        
        W2_SLabelView = [[UIView alloc] initWithFrame:imageView_T4.frame];
        [W2_SLabelView setBackgroundColor:[UIColor whiteColor]];
        W2_Slabel = [[UILabel alloc] initWithFrame:CGRectMake(48-10, 32-10, 60, 40)];
        W2_Slabel.text = [NSString stringWithFormat:@"%@", [RbtDataOfResponse sharedInstance].num_W2_S];
        W2_SLabelView.backgroundColor = [UIColor clearColor];
        [W2_Slabel setFont:[UIFont fontWithName:kFontName size:48]];
        [W2_Slabel setTextAlignment:NSTextAlignmentCenter];
        [W2_SLabelView addSubview:W2_Slabel];
        UILabel *danwei3 = [[UILabel alloc] initWithFrame:CGRectMake(108-10, 48-10, 48, 24)];
        danwei3.text = @"%";
        [danwei3 setFont:[UIFont fontWithName:kFontName size:18]];
        [W2_SLabelView addSubview:danwei3];
        
        T2_Slabel = [[UILabel alloc] initWithFrame:CGRectMake(48-10, 88-10, 56, 40)];
        T2_Slabel.text = [NSString stringWithFormat:@"%@", [RbtDataOfResponse sharedInstance].num_T2_S];
        [T2_Slabel setFont:[UIFont fontWithName:kFontName size:48]];
        [T2_Slabel setTextAlignment:NSTextAlignmentCenter];
        [W2_SLabelView addSubview:T2_Slabel];
        UILabel *danwei4 = [[UILabel alloc] initWithFrame:CGRectMake(104-10, 104-10, 48, 24)];
        danwei4.text = @"℃";
        [danwei4 setFont:[UIFont fontWithName:kFontName size:18]];
        [W2_SLabelView addSubview:danwei4];
        
        //        [self addSubview:W2_SLabelView];
        [self insertSubview:W2_SLabelView belowSubview:imageView_T4];
        
        W_S1View = [[MDRadialProgressView alloc] init];
        [W_S1View setSize:CGSizeMake(155, 155)];
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
        [W_S2View setSize:CGSizeMake(155, 155)];
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
        
        
        [self setStatus];
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
    [imageView_P5b setImage:[UIImage imageNamed:[NSString stringWithFormat:@"xunhuanbeng_%@", [self statusBysName:@"P5b_P"]]]];
    [imageView_P5 setImage:[UIImage imageNamed:[NSString stringWithFormat:@"xunhuanbeng_%@", [self statusBysName:@"P5_P"]]]];
    [imageView_P4b setImage:[UIImage imageNamed:[NSString stringWithFormat:@"xunhuanbeng_%@", [self statusBysName:@"P4b_P"]]]];
    [imageView_P4 setImage:[UIImage imageNamed:[NSString stringWithFormat:@"xunhuanbeng_%@", [self statusBysName:@"P4_P"]]]];
    
    [imageView_P3b setImage:[UIImage imageNamed:[NSString stringWithFormat:@"xunhuanbeng_%@", [self statusBysName:@"P3b_P"]]]];
    [imageView_P3 setImage:[UIImage imageNamed:[NSString stringWithFormat:@"xunhuanbeng_%@", [self statusBysName:@"P3_P"]]]];
    [imageView_P2b setImage:[UIImage imageNamed:[NSString stringWithFormat:@"xunhuanbeng_%@", [self statusBysName:@"P2b_P"]]]];
    [imageView_P2 setImage:[UIImage imageNamed:[NSString stringWithFormat:@"xunhuanbeng_%@", [self statusBysName:@"P2_P"]]]];
    [imageView_P1b setImage:[UIImage imageNamed:[NSString stringWithFormat:@"xunhuanbeng_%@", [self statusBysName:@"P1b_P"]]]];
    [imageView_P1 setImage:[UIImage imageNamed:[NSString stringWithFormat:@"xunhuanbeng_%@", [self statusBysName:@"P1_P"]]]];
    
    [imageView_E1 setImage:[UIImage imageNamed:[NSString stringWithFormat:@"diancifa_%@", [self statusBysName:@"E1_E"]]]];
    [imageView_E2 setImage:[UIImage imageNamed:[NSString stringWithFormat:@"diancifa_%@", [self statusBysName:@"E2_E"]]]];
    [imageView_E3 setImage:[UIImage imageNamed:[NSString stringWithFormat:@"diancifa_%@", [self statusBysName:@"E3_E"]]]];
    [imageView_E4 setImage:[UIImage imageNamed:[NSString stringWithFormat:@"diancifa_%@", [self statusBysName:@"E4_E"]]]];
    [imageView_E5 setImage:[UIImage imageNamed:[NSString stringWithFormat:@"diancifa_%@", [self statusBysName:@"E5_E"]]]];
    
    [imageView_dianguolu setImage:[UIImage imageNamed:[NSString stringWithFormat:@"EH2_%@", [self statusBysName:@"EH1_EH"]]]];
    [imageView_EH2 setImage:[UIImage imageNamed:[NSString stringWithFormat:@"EH2_%@", [self statusBysName:@"EH2_EH"]]]];
    
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

