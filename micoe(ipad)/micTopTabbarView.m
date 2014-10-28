//
//  micGongchengTabbarView.m
//  micoe(ipad)
//
//  Created by Simon on 14-1-10.
//  Copyright (c) 2014年 Simon. All rights reserved.
//

#import "micTopTabbarView.h"
#import "micTopTabbarData.h"

@implementation micTopTabbarView

@synthesize myDelegate;

@synthesize itemsArray, imageGap, imageHeight, selectIndex;

//-(id)init
//{
//    self = [super init];
//    if (self) {
//    }
//    return self;
//}

//-(id)initWithFrame:(CGRect)frame{
//    self = [super initWithFrame:frame];
//    
//    if (self) {
//        // Initialization code
//        [self setFrame:frame];
//        itemsArray = [micTopTabbarData shareInstance].itemsArray;
//        imageGap = [micTopTabbarData shareInstance].imageGap;
//        imageHeight = [micTopTabbarData shareInstance].imageHeight;
//        
//        int count = [itemsArray count];
//        float imageWidth = self.width/(count-2);
//        UIImage *bgImage = [itemsArray objectAtIndex:0];
//        //        UIImage *bgImage = [UIImage imageNamed:@"gcTabBg"];
//        bgImageView = [[UIImageView alloc] initWithFrame:self.bounds];
//        [bgImageView setImage:bgImage];
//        [self addSubview:bgImageView];
//        
//        
//        
//        for (int i = 2; i < count; i++) {
//            UIButton *topButton = [UIButton buttonWithType:UIButtonTypeCustom];
//            [topButton setFrame:CGRectMake(0+imageWidth*(i-2), imageGap, imageWidth, imageHeight)];
//            UIImage *buttonImage = [itemsArray objectAtIndex:i];
//            [topButton setImage:buttonImage forState:UIControlStateNormal];
//            [topButton setTag:(1000+i-2)];
//            [topButton addTarget:self action:@selector(topButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
//            [self addSubview:topButton];
//        }
//        
//        UIImage *biankuangImage = [itemsArray objectAtIndex:1];
//        biankuangImageView = [[UIImageView alloc] initWithImage:biankuangImage];
//        [self addSubview:biankuangImageView];
//        
//    }
//    return self;
//
//}
//

-(void)setFrame:(CGRect)frame
{
    [super setFrame:frame];
    for (UIView *view in self.subviews) {
        [view removeFromSuperview];
    }
    
    
    itemsArray = [micTopTabbarData shareInstance].itemsArray;
    imageGap = [micTopTabbarData shareInstance].imageGap;
    imageHeight = [micTopTabbarData shareInstance].imageHeight;
    selectIndex = [micTopTabbarData shareInstance].selectIndex;
    
    int count = [itemsArray count];
    float imageWidth = self.width/(count-2);
    UIImage *bgImage = [itemsArray objectAtIndex:0];
    //        UIImage *bgImage = [UIImage imageNamed:@"gcTabBg"];
    bgImageView = [[UIImageView alloc] initWithFrame:self.bounds];
    [bgImageView setImage:bgImage];
    [self addSubview:bgImageView];
    
    
    
    for (int i = 2; i < count; i++) {
        UIButton *topButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [topButton setFrame:CGRectMake(0+imageWidth*(i-2), imageGap, imageWidth, imageHeight)];
        UIImage *buttonImage = [itemsArray objectAtIndex:i];
        [topButton setImage:buttonImage forState:UIControlStateNormal];
        [topButton setTag:(1000+i-2)];
        [topButton addTarget:self action:@selector(topButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:topButton];
    }
    
    UIImage *biankuangImage = [itemsArray objectAtIndex:1];
    biankuangImageView = [[UIImageView alloc] initWithImage:biankuangImage];
    if (biankuangImageView.frame.size.width > imageWidth) {
        [biankuangImageView setSize:CGSizeMake(biankuangImageView.frame.size.width/2, biankuangImageView.frame.size.height/2)];
    }
    
//    UIButton *selectButton = (UIButton *)[self viewWithTag:selectIndex];
//    CGPoint buttonCenter = selectButton.center;
    CGPoint buttonCenter = CGPointMake(imageWidth*(selectIndex-1000+0.5), imageGap + imageHeight/2) ;
//    NSLog(@"aaa= %f", imageWidth*(selectIndex-1000+1/2));
//    NSLog(@"sss= %f", imageWidth*(selectIndex-1000+0.5));
    
    biankuangImageView.center = buttonCenter;
    

    
    
    [self addSubview:biankuangImageView];
}

-(void)topButtonClicked:(UIButton *)topButton
{
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.3];
    CGPoint center = topButton.center;
    biankuangImageView.center = center;
    [UIView commitAnimations];
    
    [myDelegate tabBarItemClicked:topButton.tag];
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
