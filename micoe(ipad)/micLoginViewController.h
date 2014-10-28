//
//  micLoginViewController.h
//  micoe(ipad)
//
//  Created by Simon on 14-1-13.
//  Copyright (c) 2014年 Simon. All rights reserved.
//

#import "RbtBaseViewController.h"

@interface micLoginViewController : RbtBaseViewController<UITextFieldDelegate,UIAlertViewDelegate>

@property (strong,nonatomic)UITextField *textF_Username;
@property (strong,nonatomic)UITextField *textF_Password;

@property (strong,nonatomic)UIControl *scrollView;
@property (assign,nonatomic)BOOL isAutoLogin;
@property(retain,nonatomic)NSString *intString;
@property (copy,nonatomic) NSString *jsonString;

@end
