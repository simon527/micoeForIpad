//
//  RbtYLT906-H.m
//  RedBudTek
//
//  Created by Simon on 13-12-3.
//  Copyright (c) 2013年 redbudtek. All rights reserved.
//

#import "RbtYLT906.h"
#import "MDRadialProgressView.h"
#import "MDRadialProgressTheme.h"
#import "MDRadialProgressLabel.h"
#import "RbtDataOfResponse.h"


@implementation RbtYLT906

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        float topgap = 130+20+44;
        
        UIImageView *backGroungView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 768, 1024-194-49)];
        [backGroungView setImage:[UIImage imageNamed:@"906-03bg"]];
        [self addSubview:backGroungView];
        
        imageView_T6 = [[UIImageView alloc] initWithFrame:CGRectMake(429, 876-topgap, 74, 74)];
        [imageView_T6 setImage:[UIImage imageNamed:@"wenxiang"]];
        [self addSubview:imageView_T6];
        
        imageView_T5 = [[UIImageView alloc] initWithFrame:CGRectMake(264, 876-topgap, 74, 74)];
        [imageView_T5 setImage:[UIImage imageNamed:@"wenxiang"]];
        [self addSubview:imageView_T5];
        
        imageView_P42 = [[UIImageView alloc] initWithFrame:CGRectMake(516, 840-topgap, 51, 51)];
        [self addSubview:imageView_P42];
        
        imageView_P52 = [[UIImageView alloc] initWithFrame:CGRectMake(196, 840-topgap, 51, 51)];
        [self addSubview:imageView_P52];
        
        imageView_P41 = [[UIImageView alloc] initWithFrame:CGRectMake(516, 755-topgap, 51, 51)];
        [self addSubview:imageView_P41];
        
        imageView_P51 = [[UIImageView alloc] initWithFrame:CGRectMake(196, 755-topgap, 51, 51)];
        [self addSubview:imageView_P51];
        
        imageView_T4 = [[UIImageView alloc] initWithFrame:CGRectMake(634, 685-topgap, 51, 51)];
        [imageView_T4 setImage:[UIImage imageNamed:@"danxiangfa_on"]];
        [self addSubview:imageView_T4];
        
        imageView_DDF2 = [[UIImageView alloc] initWithFrame:CGRectMake(553, 685-topgap, 51, 51)];
        [imageView_DDF2 setImage:[UIImage imageNamed:@"danxiangfa_on"]];
        [self addSubview:imageView_DDF2];
        
        imageView_P3 = [[UIImageView alloc] initWithFrame:CGRectMake(125, 685-topgap, 51, 51)];
        [self addSubview:imageView_P3];
        
        imageView_X1 = [[UIImageView alloc] initWithFrame:CGRectMake(673, 619-topgap, 51, 51)];
        [imageView_X1 setImage:[UIImage imageNamed:@"EH2_on"]];
        [self addSubview:imageView_X1];
        
        imageView_DDF1 = [[UIImageView alloc] initWithFrame:CGRectMake(595, 619-topgap, 51, 51)];
        [imageView_DDF1 setImage:[UIImage imageNamed:@"danxiangfa_on"]];
        [self addSubview:imageView_DDF1];
        
        imageView_X2 = [[UIImageView alloc] initWithFrame:CGRectMake(513, 619-topgap, 51, 51)];
        [imageView_X2 setImage:[UIImage imageNamed:@"EH2_on"]];
        [self addSubview:imageView_X2];
        
        imageView_T2 = [[UIImageView alloc] initWithFrame:CGRectMake(292, 559-topgap, 193, 193)];
        [imageView_T2 setImage:[UIImage imageNamed:@"shuixiang1"]];
        [self addSubview:imageView_T2];
        
        imageView_P2 = [[UIImageView alloc] initWithFrame:CGRectMake(167, 623-topgap, 51, 51)];
        [self addSubview:imageView_P2];
        
        imageView_linyuqi = [[UIImageView alloc] initWithFrame:CGRectMake(62, 610-topgap, 74, 74)];
        [imageView_linyuqi setImage:[UIImage imageNamed:@"linyuqi"]];
        [self addSubview:imageView_linyuqi];
        
        imageView_T1_4 = [[UIImageView alloc] initWithFrame:CGRectMake(615, 475-topgap, 51, 51)];
        [imageView_T1_4 setImage:[UIImage imageNamed:@"danxiangfa_on"]];
        [self addSubview:imageView_T1_4];
        imageView_jireqi4 =  [[UIImageView alloc] initWithFrame:CGRectMake(485, 464-topgap, 74, 74)];
        [imageView_jireqi4 setImage:[UIImage imageNamed:@"jireqi"]];
        [self addSubview:imageView_jireqi4];
        imageView_P1_4 = [[UIImageView alloc] initWithFrame:CGRectMake(353, 475-topgap, 51, 51)];
        [self addSubview:imageView_P1_4];
        imageView_EH5 = [[UIImageView alloc] initWithFrame:CGRectMake(224, 475-topgap, 51, 51)];
        [self addSubview:imageView_EH5];
        
        imageView_T1_3 = [[UIImageView alloc] initWithFrame:CGRectMake(615, 395-topgap, 51, 51)];
        [imageView_T1_3 setImage:[UIImage imageNamed:@"danxiangfa_on"]];
        [self addSubview:imageView_T1_3];
        imageView_jireqi3 =  [[UIImageView alloc] initWithFrame:CGRectMake(485, 384-topgap, 74, 74)];
        [imageView_jireqi3 setImage:[UIImage imageNamed:@"jireqi"]];
        [self addSubview:imageView_jireqi3];
        imageView_P1_3 = [[UIImageView alloc] initWithFrame:CGRectMake(353, 395-topgap, 51, 51)];
        [self addSubview:imageView_P1_3];
        imageView_EH4 = [[UIImageView alloc] initWithFrame:CGRectMake(224, 395-topgap, 51, 51)];
        [self addSubview:imageView_EH4];
        
        imageView_T1_2 = [[UIImageView alloc] initWithFrame:CGRectMake(615, 318-topgap, 51, 51)];
        [imageView_T1_2 setImage:[UIImage imageNamed:@"danxiangfa_on"]];
        [self addSubview:imageView_T1_2];
        imageView_jireqi2 =  [[UIImageView alloc] initWithFrame:CGRectMake(485, 306-topgap, 74, 74)];
        [imageView_jireqi2 setImage:[UIImage imageNamed:@"jireqi"]];
        [self addSubview:imageView_jireqi2];
        imageView_P1_2 = [[UIImageView alloc] initWithFrame:CGRectMake(353, 318-topgap, 51, 51)];
        [self addSubview:imageView_P1_2];
        imageView_EH3 = [[UIImageView alloc] initWithFrame:CGRectMake(224, 318-topgap, 51, 51)];
        [self addSubview:imageView_EH3];
        
        imageView_qiufa = [[UIImageView alloc] initWithFrame:CGRectMake(91, 286-topgap, 51, 51)];
        [imageView_qiufa setImage:[UIImage imageNamed:@"qiufa_on"]];
        [self addSubview:imageView_qiufa];
        
        imageView_T1_1 = [[UIImageView alloc] initWithFrame:CGRectMake(615, 227-topgap, 51, 51)];
        [imageView_T1_1 setImage:[UIImage imageNamed:@"paiqifa_on"]];
        [self addSubview:imageView_T1_1];
        imageView_jireqi1 =  [[UIImageView alloc] initWithFrame:CGRectMake(485, 216-topgap, 74, 74)];
        [imageView_jireqi1 setImage:[UIImage imageNamed:@"jireqi"]];
        [self addSubview:imageView_jireqi1];
        imageView_P1_1 = [[UIImageView alloc] initWithFrame:CGRectMake(353, 227-topgap, 51, 51)];
        [self addSubview:imageView_P1_1];
        imageView_EH2 = [[UIImageView alloc] initWithFrame:CGRectMake(224, 227-topgap, 51, 51)];
        [self addSubview:imageView_EH2];
        
        imageView_T3 = [[UIImageView alloc] initWithFrame:CGRectMake(91, 227-topgap, 51, 51)];
        [imageView_T3 setImage:[UIImage imageNamed:@"danxiangfa_on"]];
        [self addSubview:imageView_T3];
        
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
        
        
        [self setStatus];
    }
    return self;
}

-(void)tapInW_S1
{
    imageView_T2.hidden = !imageView_T2.hidden;
}

-(void)setStatus
{
    [imageView_P42 setImage:[UIImage imageNamed:[NSString stringWithFormat:@"xunhuanbeng_%@", [self statusBysName:@"P42_P"]]]];
    [imageView_P52 setImage:[UIImage imageNamed:[NSString stringWithFormat:@"xunhuanbeng_%@", [self statusBysName:@"P52_P"]]]];
    [imageView_P41 setImage:[UIImage imageNamed:[NSString stringWithFormat:@"xunhuanbeng_%@", [self statusBysName:@"P41_P"]]]];
    [imageView_P51 setImage:[UIImage imageNamed:[NSString stringWithFormat:@"xunhuanbeng_%@", [self statusBysName:@"P51_P"]]]];
    [imageView_P3 setImage:[UIImage imageNamed:[NSString stringWithFormat:@"xunhuanbeng_%@", [self statusBysName:@"P3_P"]]]];
    [imageView_P2 setImage:[UIImage imageNamed:[NSString stringWithFormat:@"xunhuanbeng_%@", [self statusBysName:@"P2_P"]]]];
    [imageView_P1_4 setImage:[UIImage imageNamed:[NSString stringWithFormat:@"xunhuanbeng_%@", [self statusBysName:@"P14_P"]]]];
    [imageView_EH5 setImage:[UIImage imageNamed:[NSString stringWithFormat:@"EH2_%@", [self statusBysName:@"EH5_EH"]]]];
    [imageView_P1_3 setImage:[UIImage imageNamed:[NSString stringWithFormat:@"xunhuanbeng_%@", [self statusBysName:@"P13_P"]]]];
    [imageView_EH4 setImage:[UIImage imageNamed:[NSString stringWithFormat:@"EH2_%@", [self statusBysName:@"EH4_EH"]]]];
    [imageView_P1_2 setImage:[UIImage imageNamed:[NSString stringWithFormat:@"xunhuanbeng_%@", [self statusBysName:@"P12_P"]]]];
    [imageView_EH3 setImage:[UIImage imageNamed:[NSString stringWithFormat:@"EH2_%@", [self statusBysName:@"EH3"]]]];
    [imageView_P1_1 setImage:[UIImage imageNamed:[NSString stringWithFormat:@"xunhuanbeng_%@", [self statusBysName:@"P11_P"]]]];
    [imageView_EH2 setImage:[UIImage imageNamed:[NSString stringWithFormat:@"EH2_%@", [self statusBysName:@"EH2_EH"]]]];
    
    [imageView_DDF1 setImage:[UIImage imageNamed:[NSString stringWithFormat:@"diancifa_%@", [self statusBysName:@"DDF1_F"]]]];
    [imageView_DDF2 setImage:[UIImage imageNamed:[NSString stringWithFormat:@"diancifa_%@", [self statusBysName:@"DDF2_F"]]]];
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
