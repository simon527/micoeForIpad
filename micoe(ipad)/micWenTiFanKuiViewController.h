//
//  micWenTiFanKuiViewController.h
//  micoe(ipad)
//
//  Created by Simon on 13-12-26.
//  Copyright (c) 2013年 Simon. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RbtBaseViewController.h"

@interface micWenTiFanKuiViewController : RbtBaseViewController<UITextViewDelegate>

@property (strong,nonatomic) UITextView *textF_wenti;
@property (copy,nonatomic) NSString *i;

-(void)setItemsFrame:(UIInterfaceOrientation)orientation;

@end
