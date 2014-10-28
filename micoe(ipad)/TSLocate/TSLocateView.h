//
//  UICityPicker.h
//  DDMates
//
//  Created by ShawnMa on 12/16/11.
//  Copyright (c) 2011 TelenavSoftware, Inc. All rights reserved.
//


#import <QuartzCore/QuartzCore.h>
#import "TSLocation.h"
@class TSLocateView;

@protocol TSLocateViewDelegate <NSObject>

- (void)actionSheet:(TSLocateView *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex;

@end

@interface TSLocateView : UIView<UIPickerViewDelegate, UIPickerViewDataSource> {
@private
    NSArray *provinces;
    NSArray	*cities;
}

@property (strong, nonatomic) IBOutlet UILabel *titleLabel;
@property (strong, nonatomic) IBOutlet UIPickerView *locatePicker;
@property (strong, nonatomic) IBOutlet UIImageView *titleView;
@property (strong, nonatomic) IBOutlet UIButton *localButton;
@property (strong, nonatomic) TSLocation *locate;
@property (nonatomic ,assign) id<TSLocateViewDelegate> delegate;

- (id)initWithTitle:(NSString *)title delegate:(id /*<UIActionSheetDelegate>*/)delegate;

- (void)showInView:(UIView *)view;

@end
