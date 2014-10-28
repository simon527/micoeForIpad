//
//  micTianQiYuBaoViewController.h
//  micoe(ipad)
//
//  Created by Simon on 14-1-20.
//  Copyright (c) 2014年 Simon. All rights reserved.
//

#import "RbtBaseViewController.h"
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>
#import <CoreLocation/CLAvailability.h>
#import <MapKit/MKMapView.h>

@interface micTianQiYuBaoViewController : RbtBaseViewController<CLLocationManagerDelegate>
{
    CLLocationManager *locationManager;
    UIImageView *imgv;
}


@property (strong,nonatomic) NSDictionary *weatherInfo;
@property (assign,nonatomic) BOOL isShouYe;
@property (strong,nonatomic) NSString *xiaBiao;
@property (assign,nonatomic) BOOL isFirstJia;

-(void)postData;

- (void)initViews;

- (void)initViewswithBaidu;
-(void)setItemsFrame:(UIInterfaceOrientation)orientation;

@end
