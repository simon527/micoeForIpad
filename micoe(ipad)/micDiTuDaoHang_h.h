//
//  micDiTuDaoHang_h.h
//  micoe(ipad)
//
//  Created by Simon_Tang on 14-5-12.
//  Copyright (c) 2014年 Simon. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface micDiTuDaoHang_h : UIView<MKMapViewDelegate>

@property (nonatomic,strong)MKMapView *myMapView;

@end