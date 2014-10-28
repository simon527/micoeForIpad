//
//  micDiTuDaoHang.m
//  micoe(ipad)
//
//  Created by Simon on 14-1-17.
//  Copyright (c) 2014年 Simon. All rights reserved.
//

#import "micDiTuDaoHang.h"
#import "MyAnnotation.h"

@implementation micDiTuDaoHang

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        self.myMapView = [[MKMapView alloc] initWithFrame:CGRectMake(0, 0, 768, 1024-194-49)];
        self.myMapView.mapType = MKMapTypeStandard;
        self.myMapView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        [self addSubview:self.myMapView];
        self.myMapView.delegate = self;
        
        if ([RbtCommonTool getJinRuMode] == LiXianGongCheng) {
            CLLocationCoordinate2D center;
            center.latitude = 34.595346;
            center.longitude = 119.176297;
            MKCoordinateSpan span;
            span = MKCoordinateSpanMake(5.0, 5.0);
            MKCoordinateRegion regionCenter = MKCoordinateRegionMake(center, span);
            self.myMapView.region = regionCenter;
        }
        else{
            RbtProjectModel *oneModel  = [RbtProjectModel sharedInstance];
            CLLocationCoordinate2D center2;
            center2.latitude = [oneModel.latitude doubleValue];
            center2.longitude = [oneModel.longitude doubleValue];
            MKCoordinateSpan span2;
            span2 = MKCoordinateSpanMake(5.0, 5.0);
            MKCoordinateRegion regionCenter2 = MKCoordinateRegionMake(center2, span2);
            self.myMapView.region = regionCenter2;
        }
        [self mapViewAddPointAnnotation];

    }
    return self;
}

- (void)mapViewAddPointAnnotation{
    if ([RbtCommonTool getJinRuMode] == LiXianGongCheng) {
        RbtProjectModel *oneModel  = [RbtProjectModel sharedInstance];
        CLLocationCoordinate2D center;
        center.latitude = 32.407210485134414;
        center.longitude = 105.8134454199219;
        MyAnnotation *annotation = [[MyAnnotation alloc] initWithCoordinates:center
                                                                       title:oneModel.name
                                                                    subTitle:oneModel.city];
        [self.myMapView addAnnotation:annotation];
    }
    else{
        RbtProjectModel *oneModel  = [RbtProjectModel sharedInstance];
        CLLocationCoordinate2D center;
        center.latitude = [oneModel.latitude doubleValue];
        center.longitude = [oneModel.longitude doubleValue];
        MyAnnotation *annotation = [[MyAnnotation alloc] initWithCoordinates:center
                                                                       title:oneModel.name
                                                                    subTitle:oneModel.city];
        [self.myMapView addAnnotation:annotation];
    }
}

- (void)mapView:(MKMapView *)mapView didSelectAnnotationView:(MKAnnotationView *)view{
    NSLog(@"select");
}

- (void)mapView:(MKMapView *)mapView annotationView:(MKAnnotationView *)view calloutAccessoryControlTapped:(UIControl *)control{
    NSLog(@"calloutAccessoryControlTapped");
}

- (void)mapViewDidFinishLoadingMap:(MKMapView *)mapView{
    
}

- (void)mapViewDidFailLoadingMap:(MKMapView *)mapView withError:(NSError *)error{
    NSLog(@"load map error = %@",error);
    [RbtCommonTool showInfoAlert:@"加载地图失败"];
}

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id < MKAnnotation >)annotation{
    //判断是否为当前设备位置的annotation
    if ([annotation isKindOfClass:[MKUserLocation class]]) {
        //返回nil，就使用默认的标注视图
        return nil;
    }
    //-------------------创建大头针视图---------------------
    static NSString *identifier = @"Annotationgis";
    MKAnnotationView *annotationView = (MKAnnotationView *)[mapView dequeueReusableAnnotationViewWithIdentifier:identifier];
    if (annotationView == nil) {
        //MKPinAnnotationView 是大头针视图
        annotationView = [[MKAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:identifier];
        
        //设置是否显示标题视图
        annotationView.canShowCallout = YES;
        
        //        UIButton *button = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
        //        [button addTarget:self action:@selector(buttonAction) forControlEvents:UIControlEventTouchUpInside];
        
        //标题右边视图
        //        annotationView.rightCalloutAccessoryView = button;
        //标题左边视图
        //        annotationView.leftCalloutAccessoryView
    }
    annotationView.annotation = annotation;
    annotationView.image = [UIImage imageNamed:@"map"];
    //设置大头针的颜色
    //    annotationView.pinColor = MKPinAnnotationColorRed;
    //从天上落下的动画
    //    annotationView.animatesDrop = NO;
    return annotationView;
    //-------------------使用图片作为标注视图---------------------
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
