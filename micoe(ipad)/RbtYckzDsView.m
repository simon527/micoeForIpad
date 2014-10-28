//
//  RbtYckzDsView.m
//  RedBudTek
//
//  Created by 黄川 on 13-12-9.
//  Copyright (c) 2013年 redbudtek. All rights reserved.
//

#import "RbtYckzDsView.h"

@implementation RbtYckzDsView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
//        UIImageView *bg = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight)];
//        bg.image = [UIImage imageNamed:@"yckz_blackbg"];
//        bg.alpha = 0.5;
//        [self addSubview:bg];
        self.backgroundColor = [UIColor whiteColor];
        
        
        for (int i = 0; i<3; i++) {
            UILabel *lab1 = [[UILabel alloc] initWithFrame:CGRectMake(10, 10+40*i, 50, 30)];
            lab1.text = [NSString stringWithFormat:@"时段%d：",i+1];
            [lab1 setFont:[UIFont fontWithName:kFontName size:14]];
            lab1.textColor = [UIColor colorWithRed:71/255.0 green:190/255.0 blue:184/255.0 alpha:1];
            [self addSubview:lab1];
            
            UILabel *labks = [[UILabel alloc] initWithFrame:CGRectMake(60, 10+40*i, 45, 30)];
            labks.text = @"开始";
            [labks setFont:[UIFont fontWithName:kFontName size:14]];
            labks.textColor = [UIColor colorWithRed:71/255.0 green:190/255.0 blue:184/255.0 alpha:1];
            [self addSubview:labks];
            
            UITextField *textF_kshour = [[UITextField alloc] init];
            textF_kshour.frame = CGRectMake(85, 10+40*i, 35, 30);
            textF_kshour.delegate = self;
            textF_kshour.tag  = 10*i+1;
            [textF_kshour setAutocapitalizationType:UITextAutocapitalizationTypeNone];
            [textF_kshour setReturnKeyType:UIReturnKeyDone];
            textF_kshour.keyboardType = UIKeyboardTypeNumberPad;
            textF_kshour.placeholder = @"hh";
            textF_kshour.textAlignment = NSTextAlignmentRight;
            [self addSubview:textF_kshour];
            
            UILabel *labmh = [[UILabel alloc] initWithFrame:CGRectMake(120, 10+40*i, 10, 30)];
            labmh.text = @"：";
            [labmh setFont:[UIFont fontWithName:kFontName size:15]];
            [self addSubview:labmh];
            
            UITextField *textF_ksmin = [[UITextField alloc] init];
            textF_ksmin.frame = CGRectMake(130, 10+40*i, 35, 30);
            textF_ksmin.delegate = self;
            textF_ksmin.tag  = 10*i+2;
            [textF_ksmin setAutocapitalizationType:UITextAutocapitalizationTypeNone];
            [textF_ksmin setReturnKeyType:UIReturnKeyDone];
            textF_ksmin.keyboardType = UIKeyboardTypeNumberPad;
            textF_ksmin.placeholder = @"mm";
            textF_ksmin.textAlignment = NSTextAlignmentRight;
            [self addSubview:textF_ksmin];
            
            UILabel *labjs = [[UILabel alloc] initWithFrame:CGRectMake(200, 10+40*i, 45, 30)];
            labjs.text = @"结束";
            [labjs setFont:[UIFont fontWithName:kFontName size:14]];
            labjs.textColor = [UIColor colorWithRed:71/255.0 green:190/255.0 blue:184/255.0 alpha:1];
            [self addSubview:labjs];
            
            UITextField *textF_jshour = [[UITextField alloc] init];
            textF_jshour.frame = CGRectMake(225, 10+40*i, 35, 30);
            textF_jshour.delegate = self;
            textF_jshour.tag  = 10*i+3;
            [textF_jshour setAutocapitalizationType:UITextAutocapitalizationTypeNone];
            [textF_jshour setReturnKeyType:UIReturnKeyDone];
            textF_jshour.keyboardType = UIKeyboardTypeNumberPad;
            textF_jshour.placeholder = @"hh";
            textF_jshour.textAlignment = NSTextAlignmentRight;
            [self addSubview:textF_jshour];
            
            UILabel *labmhj = [[UILabel alloc] initWithFrame:CGRectMake(260, 10+40*i, 10, 30)];
            labmhj.text = @"：";
            [labmhj setFont:[UIFont fontWithName:kFontName size:15]];
            [self addSubview:labmhj];
            
            UITextField *textF_jsmin = [[UITextField alloc] init];
            textF_jsmin.frame = CGRectMake(270, 10+40*i, 30, 30);
            textF_jsmin.delegate = self;
            textF_jsmin.tag  = 10*i+4;
            [textF_jsmin setAutocapitalizationType:UITextAutocapitalizationTypeNone];
            [textF_jsmin setReturnKeyType:UIReturnKeyDone];
            textF_jsmin.keyboardType = UIKeyboardTypeNumberPad;
            textF_jsmin.placeholder = @"mm";
            textF_jsmin.textAlignment = NSTextAlignmentRight;
            [self addSubview:textF_jsmin];
        }
        
        UIButton *btn_qr = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn_qr setImage:[UIImage imageNamed:@"btn_queren"] forState:UIControlStateNormal];
        [btn_qr setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        btn_qr.tag = 1;
        [btn_qr addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
        btn_qr.frame = CGRectMake(20, 130, 132, 40);
        [self addSubview:btn_qr];
        
        UIButton *btn_qx = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn_qx setImage:[UIImage imageNamed:@"btn_back"] forState:UIControlStateNormal];
        [btn_qx setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        btn_qx.tag = 2;
        [btn_qx addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
        btn_qx.frame = CGRectMake(170, 130, 132, 40);
        [self addSubview:btn_qx];
    }
    return self;
}

- (void)btnAction:(UIButton *)sender{
    if (sender.tag == 1) {
        [self.delegate dsbuttonTag:sender.tag andView:self];
    }
    else if(sender.tag == 2){
        if ([self isfuhegf]) {
            [self.delegate dsbuttonTag:sender.tag andView:self];
        }
    }
    for (int i = 0; i<3; i++) {
        UITextField *field1 = (UITextField *)[self viewWithTag:i*10+1];
        [field1 resignFirstResponder];
        
        UITextField *field2 = (UITextField *)[self viewWithTag:i*10+2];
        [field2 resignFirstResponder];
        
        UITextField *field3 = (UITextField *)[self viewWithTag:i*10+3];
        [field3 resignFirstResponder];
        
        UITextField *field4 = (UITextField *)[self viewWithTag:i*10+4];
        [field4 resignFirstResponder];
    }
}

- (BOOL)isfuhegf{
    BOOL isfuhe = YES;
    return isfuhe;
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
