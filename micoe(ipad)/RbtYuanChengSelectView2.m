//
//  RbtYuanChengSelectView2.m
//  micoe(ipad)
//
//  Created by 黄川 on 14-2-8.
//  Copyright (c) 2014年 Simon. All rights reserved.
//

#import "RbtYuanChengSelectView2.h"

@implementation RbtYuanChengSelectView2

- (id)initWithFrame:(CGRect)frame withImages:(NSArray *)imageArray andParam:(NSArray *)paramArray{
    //    self.preTag = 10;
    self = [super initWithFrame:frame];
//    float imageWidth = [(NSString *)[paramArray objectAtIndex:0] floatValue];
//    float imageHeight = [(NSString *)[paramArray objectAtIndex:1] floatValue];
//    float horizontal_blank = [(NSString *)[paramArray objectAtIndex:2] floatValue];
//    float vertical_blank = [(NSString *)[paramArray objectAtIndex:3] floatValue];
//    
//    btn1 = [UIButton buttonWithType:UIButtonTypeCustom];
//    [btn1 setTag:10];
//    [btn1 setImage:[UIImage imageNamed:[imageArray objectAtIndex:0]] forState:UIControlStateNormal];
//    [btn1 setImage:[UIImage imageNamed:[imageArray objectAtIndex:1]] forState:UIControlStateSelected];
//    [btn1 setFrame:CGRectMake(horizontal_blank, vertical_blank,  imageWidth, imageHeight)];
//    [btn1 addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
//    [self addSubview:btn1];
//    
//    btn2 = [UIButton buttonWithType:UIButtonTypeCustom];
//    [btn2 setTag:11];
//    [btn2 setImage:[UIImage imageNamed:[imageArray objectAtIndex:2]] forState:UIControlStateNormal];
//    [btn2 setImage:[UIImage imageNamed:[imageArray objectAtIndex:3]] forState:UIControlStateSelected];
//    [btn2 setFrame:CGRectMake(horizontal_blank*2+imageWidth, vertical_blank, imageWidth, imageHeight)];
//    [btn2 addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
//    [self addSubview:btn2];
//    
//    btn3= [UIButton buttonWithType:UIButtonTypeCustom];
//    [btn3 setTag:12];
//    [btn3 setImage:[UIImage imageNamed:[imageArray objectAtIndex:4]] forState:UIControlStateNormal];
//    [btn3 setImage:[UIImage imageNamed:[imageArray objectAtIndex:5]] forState:UIControlStateSelected];
//    [btn3 setFrame:CGRectMake(horizontal_blank*3+imageWidth*2, vertical_blank, imageWidth, imageHeight)];
//    [btn3 addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
//    [self addSubview:btn3];
    
    [self viewset];
    
    return self;
}

//- (void)buttonPressed:(UIButton *)sender{
//    [self.delegate buttonAcitons:sender.tag andView:self];
//    [self setSelectBtn:sender.tag];
//}

- (void)setSelectBtn:(NSInteger) btnTag{
    [[NSUserDefaults standardUserDefaults] setObject:[NSString stringWithFormat:@"%d", btnTag] forKey:@"controlButton"];
    if (btnTag != 0) {
            for (int i = 1; i<4; i++) {
                for (int j = 0; j<3; j++) {
                    int tempTag = 2000+i*10+j;
                    [(UIButton *)[self viewWithTag:tempTag] setHidden:YES];
                }
            }
            if (btnTag%10 == 0) {
                [(UIButton *)[self viewWithTag:2020] setHidden:NO];
                [(UIButton *)[self viewWithTag:2011] setHidden:NO];
                [(UIButton *)[self viewWithTag:2032] setHidden:NO];
            }
            else if(btnTag%10 == 1) {
                [(UIButton *)[self viewWithTag:2021] setHidden:NO];
                [(UIButton *)[self viewWithTag:2010] setHidden:NO];
                [(UIButton *)[self viewWithTag:2032] setHidden:NO];
            }
            else if(btnTag%10 == 2) {
                [(UIButton *)[self viewWithTag:2022] setHidden:NO];
                [(UIButton *)[self viewWithTag:2011] setHidden:NO];
                [(UIButton *)[self viewWithTag:2030] setHidden:NO];
            }
        }
    
}

-(void)viewset
{
    UIButton *dingshiButton_left = [UIButton buttonWithType:UIButtonTypeCustom];
    [dingshiButton_left setFrame:CGRectMake(60, 180, 137, 166)];
    [dingshiButton_left setImage:[UIImage imageNamed:@"yckz_dingshiBtn"] forState:UIControlStateNormal];
    [dingshiButton_left addTarget:self action:@selector(buttonCLicked:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:dingshiButton_left];
    
    UIButton *zidongButton_left = [UIButton buttonWithType:UIButtonTypeCustom];
    [zidongButton_left setFrame:CGRectMake(60, 180, 137, 166)];
    [zidongButton_left setImage:[UIImage imageNamed:@"yckz_zidongBtn"] forState:UIControlStateNormal];
    [zidongButton_left addTarget:self action:@selector(buttonCLicked:) forControlEvents:UIControlEventTouchUpInside];
    [zidongButton_left setHidden:YES];
    [self addSubview:zidongButton_left];
    
    UIButton *tingzhiButton_left = [UIButton buttonWithType:UIButtonTypeCustom];
    [tingzhiButton_left setFrame:CGRectMake(60, 180, 137, 166)];
    [tingzhiButton_left setImage:[UIImage imageNamed:@"yckz_tingzhiBtn"] forState:UIControlStateNormal];
    [tingzhiButton_left addTarget:self action:@selector(buttonCLicked:) forControlEvents:UIControlEventTouchUpInside];
    [tingzhiButton_left setHidden:YES];
    [self addSubview:tingzhiButton_left];
    
    UIButton *dingshiButton_mid = [UIButton buttonWithType:UIButtonTypeCustom];
    [dingshiButton_mid setFrame:CGRectMake(60+137+77, 180-45, 220, 257)];
    [dingshiButton_mid setImage:[UIImage imageNamed:@"yckz_dingshiBtn_s"] forState:UIControlStateNormal];
    //        [dingshiButton_mid addTarget:self action:@selector(buttonCLicked:) forControlEvents:UIControlEventTouchUpInside];
    [dingshiButton_mid setHidden:YES];
    [self addSubview:dingshiButton_mid];
    
    UIButton *zidongButton_mid = [UIButton buttonWithType:UIButtonTypeCustom];
    [zidongButton_mid setFrame:CGRectMake(60+137+77, 180-45, 220, 257)];
    [zidongButton_mid setImage:[UIImage imageNamed:@"yckz_zidongBtn_s"] forState:UIControlStateNormal];
    //        [zidongButton_mid addTarget:self action:@selector(buttonCLicked:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:zidongButton_mid];
    
    UIButton *tingzhiButton_mid = [UIButton buttonWithType:UIButtonTypeCustom];
    [tingzhiButton_mid setFrame:CGRectMake(60+137+77, 180-45, 220, 257)];
    [tingzhiButton_mid setImage:[UIImage imageNamed:@"yckz_tingzhiBtn_s"] forState:UIControlStateNormal];
    //        [tingzhiButton_mid addTarget:self action:@selector(buttonCLicked:) forControlEvents:UIControlEventTouchUpInside];
    [tingzhiButton_mid setHidden:YES];
    [self addSubview:tingzhiButton_mid];
    
    UIButton *dingshiButton_right = [UIButton buttonWithType:UIButtonTypeCustom];
    [dingshiButton_right setFrame:CGRectMake(768-60-137, 180, 137, 166)];
    [dingshiButton_right setImage:[UIImage imageNamed:@"yckz_dingshiBtn"] forState:UIControlStateNormal];
    [dingshiButton_right addTarget:self action:@selector(buttonCLicked:) forControlEvents:UIControlEventTouchUpInside];
    [dingshiButton_right setHidden:YES];
    [self addSubview:dingshiButton_right];
    
    UIButton *zidongButton_right = [UIButton buttonWithType:UIButtonTypeCustom];
    [zidongButton_right setFrame:CGRectMake(768-60-137, 180, 137, 166)];
    [zidongButton_right setImage:[UIImage imageNamed:@"yckz_zidongBtn"] forState:UIControlStateNormal];
    [zidongButton_right addTarget:self action:@selector(buttonCLicked:) forControlEvents:UIControlEventTouchUpInside];
    [zidongButton_right setHidden:YES];
    [self addSubview:zidongButton_right];
    
    UIButton *tingzhiButton_right = [UIButton buttonWithType:UIButtonTypeCustom];
    [tingzhiButton_right setFrame:CGRectMake(768-60-137, 180, 137, 166)];
    [tingzhiButton_right setImage:[UIImage imageNamed:@"yckz_tingzhiBtn"] forState:UIControlStateNormal];
    [tingzhiButton_right addTarget:self action:@selector(buttonCLicked:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:tingzhiButton_right];
    
    [dingshiButton_left setTag:2010];
    [zidongButton_left setTag:2011];
    [tingzhiButton_left setTag:2012];
    
    [dingshiButton_mid setTag:2020];
    [zidongButton_mid setTag:2021];
    [tingzhiButton_mid setTag:2022];
    
    [dingshiButton_right setTag:2030];
    [zidongButton_right setTag:2031];
    [tingzhiButton_right setTag:2032];
    
    self.preTag = 2021;
    
    NSInteger select = [[[NSUserDefaults standardUserDefaults] objectForKey:@"controlButton"] integerValue];
    if (select) {
        [self setSelectBtn:select];
    }
}

-(void)buttonCLicked:(UIButton *)button
{
    [self.delegate buttonAcitons:button.tag andView:self];
    [self setSelectBtn:button.tag];
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
