//
//  micGongchengTabbarView.h
//  micoe(ipad)
//
//  Created by Simon on 14-1-10.
//  Copyright (c) 2014年 Simon. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol topTabbarDelegate <NSObject>

-(void)tabBarItemClicked:(int)tag;

@end


@interface micTopTabbarView : UIView
{
    UIImageView *bgImageView;
    UIImageView *biankuangImageView;
    
//    id <topTabbarDelegate> myDelegate;
}

@property (assign, nonatomic) id <topTabbarDelegate> myDelegate;

@property (assign, nonatomic) float imageHeight;

@property (assign, nonatomic) float imageGap;

@property (strong, nonatomic) NSArray * itemsArray;

@property (assign, nonatomic) NSInteger selectIndex;
 
//-(id)initWithFrame:(CGRect)frame withImageHeight:(float)imageHeight withImageGap:(float)imageGap withItemsArray:(NSArray *)itemsArray;

-(void)topButtonClicked:(UIButton *)topButton;


@end
