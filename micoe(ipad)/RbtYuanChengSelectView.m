//
//  RbtYuanChengSelectView.m
//  RedBudTek
//
//  Created by 黄川 on 13-12-9.
//  Copyright (c) 2013年 redbudtek. All rights reserved.
//

#import "RbtYuanChengSelectView.h"

@implementation RbtYuanChengSelectView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame withImages:(NSArray *)imageArray andParam:(NSArray *)paramArray{
//    self.preTag = 10;
    self = [super initWithFrame:frame];
    float imageWidth = [(NSString *)[paramArray objectAtIndex:0] floatValue];
    float imageHeight = [(NSString *)[paramArray objectAtIndex:1] floatValue];
    float horizontal_blank = [(NSString *)[paramArray objectAtIndex:2] floatValue];
    float vertical_blank = [(NSString *)[paramArray objectAtIndex:3] floatValue];
    
    btn1 = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn1 setTag:10];
    [btn1 setImage:[UIImage imageNamed:[imageArray objectAtIndex:0]] forState:UIControlStateNormal];
    [btn1 setImage:[UIImage imageNamed:[imageArray objectAtIndex:1]] forState:UIControlStateSelected];
    [btn1 setFrame:CGRectMake(horizontal_blank, vertical_blank,  imageWidth, imageHeight)];
    [btn1 addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:btn1];
    
    btn2 = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn2 setTag:11];
    [btn2 setImage:[UIImage imageNamed:[imageArray objectAtIndex:2]] forState:UIControlStateNormal];
    [btn2 setImage:[UIImage imageNamed:[imageArray objectAtIndex:3]] forState:UIControlStateSelected];
    [btn2 setFrame:CGRectMake(horizontal_blank*2+imageWidth, vertical_blank, imageWidth, imageHeight)];
    [btn2 addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:btn2];
    
    btn3= [UIButton buttonWithType:UIButtonTypeCustom];
    [btn3 setTag:12];
    [btn3 setImage:[UIImage imageNamed:[imageArray objectAtIndex:4]] forState:UIControlStateNormal];
    [btn3 setImage:[UIImage imageNamed:[imageArray objectAtIndex:5]] forState:UIControlStateSelected];
    [btn3 setFrame:CGRectMake(horizontal_blank*3+imageWidth*2, vertical_blank, imageWidth, imageHeight)];
    [btn3 addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:btn3];
    
    NSInteger select = [[[NSUserDefaults standardUserDefaults] objectForKey:@"showButton"] integerValue];
    if (select) {
        [self setSelectBtn:select];
    }
    else
    {
        [self setSelectBtn:10];
    }
    
    return self;
}
//远程控制的下面的按钮 的点击方法
- (void)buttonPressed:(UIButton *)sender{

    [self.delegate buttonAcitons:sender.tag andView:self];
    [self setSelectBtn:sender.tag];
}

- (void)setSelectBtn:(NSInteger) btnTag{
    [[NSUserDefaults standardUserDefaults] setObject:[NSString stringWithFormat:@"%d", btnTag] forKey:@"showButton"];
    [btn1 setSelected:NO];
    [btn2 setSelected:NO];
    [btn3 setSelected:NO];
    
    UIButton *sender = (UIButton *)[self viewWithTag:btnTag];

    if (btnTag != 0) {
        [sender setSelected:YES];
    }
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
