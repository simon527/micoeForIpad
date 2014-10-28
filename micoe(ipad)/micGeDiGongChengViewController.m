//
//  micGeDiGongChengViewController.m
//  micoe(ipad)
//
//  Created by Simon on 14-1-13.
//  Copyright (c) 2014年 Simon. All rights reserved.
//

#import "micGeDiGongChengViewController.h"
#import "MyAnnotation.h"
#import "RbtProjectInfoModel.h"
#import "micTopTabbarData.h"


@interface micGeDiGongChengViewController ()
{
    micTopTabbarView *topTabbar;
    UIView *maskView;
    EGORefreshTableHeaderView *egoView;
    UIImageView *kehuleixing_xialabg;
}

@end

@implementation micGeDiGongChengViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated{
    isAlertShow = NO;
    
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:NO];
    [self.tableView reloadData];
    selectIndex = 1000;
    [self setItemsFrame:self.interfaceOrientation];
}

- (void) viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self mapViewAddPointAnnotation];
}

-(void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    self.kehuleixing_XialaView.hidden = YES;
    self.citySheetView.hidden = YES;
    [super viewWillDisappear:animated];
}


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    isMore = NO;
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    [self setTitle:@"各地工程"];
    
    self.arr_Projects =[[NSMutableArray alloc] init];
    if ([RbtCommonTool getJinRuMode] == WoDeGongCheng) {
        self.arr_OriginProjects =[RbtCommonModel sharedInstance].arr_myProject;
    }
    else if([RbtCommonTool getJinRuMode] == GongGGC){
        self.arr_OriginProjects = [RbtCommonModel sharedInstance].arr_publicProject;
    }
    else if ([RbtCommonTool getJinRuMode] == LiXianGongCheng)
    {
        self.arr_OriginProjects = [RbtCommonModel sharedInstance].arr_liXianProject;
    }
    
    [self setCityIndexTable];
    
    self.arr_LiuLanProjects = [[NSMutableArray alloc] init];
    if ([[NSFileManager defaultManager] fileExistsAtPath:[RbtCommonTool liuLanFilePath]]) {
        self.arr_LiuLanProjects = [NSKeyedUnarchiver unarchiveObjectWithFile:[RbtCommonTool liuLanFilePath]];
    }
    
    if (self.isLishijilu) {
        self.arr_Projects = self.arr_LiuLanProjects;
    }
    else{
        self.arr_Projects = self.arr_OriginProjects;
    }
    
    self.h = [self.arr_OriginProjects count]/100;
    if (self.h>0) {
        isMore = YES;
    }
    [self initViews];

}

-(void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    [micTopTabbarData shareInstance].selectIndex = 0;
}

- (void)setCityIndexTable{
    NSMutableArray *arr_state = [[NSMutableArray alloc] initWithObjects:@"全国", nil];
    for (int i = 0; [self.arr_OriginProjects count]>i; i++) {
        RbtProjectModel *oneModel = [self.arr_OriginProjects objectAtIndex:i];
        NSString *cityString = oneModel.city;
        NSArray *arr = [cityString componentsSeparatedByString:@","];
        if ([arr count] == 2) {
            if (![arr_state containsObject:[arr objectAtIndex:0]] ) {
                [arr_state addObject:[arr objectAtIndex:0]];
            }
        }
    }
    
    NSMutableArray *arr_Allcity = [[NSMutableArray alloc] init];
    for (int x = 0; [arr_state count]>x; x++) {
        NSMutableDictionary *dic_Procity = [[NSMutableDictionary alloc] init];
        [dic_Procity setObject:[arr_state objectAtIndex:x] forKey:@"State"];
        NSMutableArray *arr_city = [[NSMutableArray alloc] initWithObjects:[NSDictionary dictionaryWithObjectsAndKeys:@"全部",@"city", nil], nil];
        for (int i = 0; [self.arr_OriginProjects count]>i; i++) {
            RbtProjectModel *oneModel = [self.arr_OriginProjects objectAtIndex:i];
            NSString *cityString = oneModel.city;
            NSArray *arr = [cityString componentsSeparatedByString:@","];
            if ([arr count] == 2) {
                if ([(NSString *)[arr_state objectAtIndex:x] isEqualToString:(NSString *)[arr objectAtIndex:0]] ) {
                    BOOL isHasCity = NO;
                    //                    NSLog(@"arr_city = %@",arr_city);
                    for (int y = 0; [arr_city count]>y; y++) {
                        if ([(NSString *)[(NSDictionary *)[arr_city objectAtIndex:y] objectForKey:@"city"] isEqualToString:(NSString *) [arr objectAtIndex:1]]) {
                            isHasCity = YES;
                            break;
                        }
                    }
                    if (!isHasCity) {
                        NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:[arr objectAtIndex:1],@"city", nil];
                        [arr_city addObject:dic];
                    }
                }
            }
        }
        [dic_Procity setObject:arr_city forKey:@"Cities"];
        [arr_Allcity addObject:dic_Procity];
    }
    [RbtCommonTool setProvincesAndCities:arr_Allcity];
}

- (void)initViews{

    topTabbar = [[micTopTabbarView alloc] init];
    topTabbar.myDelegate = self;
    
    [self.view addSubview:topTabbar];
    
    self.tableView = [[UITableView alloc] init];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    
    if ([RbtCommonTool getJinRuMode] == WoDeGongCheng) {
        if (_refreshHeaderView == nil) {
            
            egoView = [[EGORefreshTableHeaderView alloc] init];
            egoView.delegate = self;
            [self.tableView addSubview:egoView];
            _refreshHeaderView = egoView;
        }
        
        //  update the last update date
        [_refreshHeaderView refreshLastUpdatedDate];
    }
    
    self.myMapView = [[MKMapView alloc] initWithFrame:CGRectMake(0, 180, ScreenWidth, ScreenHeight-180)];
    self.myMapView.mapType = MKMapTypeStandard;
    self.myMapView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    self.myMapView.delegate = self;
    CLLocationCoordinate2D center;
    center.latitude = 39.910;
    center.longitude = 106.404;
    MKCoordinateSpan span;
    span = MKCoordinateSpanMake(40.0, 50.0);
    MKCoordinateRegion regionCenter = MKCoordinateRegionMake(center, span);
    self.myMapView.region = regionCenter;
    self.myMapView.hidden = YES;
    [self.view addSubview:self.myMapView];
    
    self.kehuleixing_XialaView = [[UIView alloc] init];
    [self initkehuleixing_XialaView];
    [self.view addSubview:self.kehuleixing_XialaView];
    
    if (([RbtUserModel sharedInstance].userName== nil)||[[RbtUserModel sharedInstance].userName length]<1) {
        if ([RbtCommonTool getJinRuMode] == LiXianGongCheng) {
            maskView = [[UIView alloc] init];
            maskView.backgroundColor = [UIColor blackColor];
            maskView.alpha = 0.5;
//            maskView.frame = CGRectMake(0, 64, ScreenWidth, 116);
            [self.view addSubview:maskView];
        }
    }
    else{
        if (self.isLishijilu) {
//            [btn_Liulanjilu setSelected:YES];
        }
        else{
//            [btn_Kehuleixing setSelected:YES];
        }
    }
    
//    [self setItemsFrame:self.interfaceOrientation];
}

- (void)initkehuleixing_XialaView{
    kehuleixing_xialabg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"gdgc_khlxBG"]];
//    kehuleixing_xialabg.frame = CGRectMake(0, 0, 768, 42);
    [self.kehuleixing_XialaView addSubview:kehuleixing_xialabg];
    
//    NSArray *btnArray = [[NSArray alloc] initWithObjects:@"gdgc_quanbu", @"gdgc_dichan", @"gdgc_jiudian", @"gdgc_xuexiao", @"gdgc_gongkuang", @"gdgc_zhengfu", @"gdgc_nonglin", @"gdgc_qita", nil];
    NSArray *btnArray = [[NSArray alloc] initWithObjects:@"gdgc_quanbu", @"gdgc_dichan", @"gdgc_jiudian", @"gdgc_xuexiao", @"gdgc_gongkuang", @"gdgc_qita", nil];
    
    for (int i = 201; i<207; i++) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
//        btn.frame = CGRectMake((i-201)*768/8+3, 5, 90, 31);
        NSString *btnName = [btnArray objectAtIndex:(i -201)];
        [btn setBackgroundImage:[UIImage imageNamed:btnName] forState:UIControlStateNormal];
        [btn setBackgroundImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@_s",btnName]] forState:UIControlStateSelected];
        btn.tag = i;
        if (i == 201) {
            btn.selected = YES;
        }
        [btn addTarget:self action:@selector(kehuleixing_XialaViewBtnPressed:) forControlEvents:UIControlEventTouchUpInside];
        [self.kehuleixing_XialaView addSubview:btn];
    }
}

- (void)mapViewAddPointAnnotation{
    for (RbtProjectModel *oneModel in self.arr_OriginProjects) {
        CLLocationCoordinate2D center;
        center.latitude = (double)[oneModel.latitude doubleValue];
        center.longitude = (double)[oneModel.longitude doubleValue];
        MyAnnotation *annotation = [[MyAnnotation alloc] initWithCoordinates:center
                                                                       title:oneModel.name
                                                                    subTitle:oneModel.city];
        [self.myMapView addAnnotation:annotation];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (void)kehuleixing_XialaViewBtnPressed:(UIButton *)sender{
    self.arr_Projects = [[NSMutableArray alloc] init];

    for (int i = 201; i < 209; i++) {
        UIButton *button = (UIButton *)[self.view viewWithTag:i];
        button.selected = NO;
    }
    sender.selected = YES;
    if (sender.tag == 201) {
        self.arr_Projects = self.arr_OriginProjects;

    }
    else if (sender.tag == 202)
    {
        for (RbtProjectModel *oneP in self.arr_OriginProjects) {
            if ([oneP.leixing isEqualToString:@"地产住宅类"]) {
                [self.arr_Projects addObject:oneP];
            }
        }

    }
    else if (sender.tag == 203)
    {
        for (RbtProjectModel *oneP in self.arr_OriginProjects) {
            if ([oneP.leixing isEqualToString:@"酒店宾馆类"]) {
                [self.arr_Projects addObject:oneP];
            }
        }

    }
    else if (sender.tag == 204)
    {
        for (RbtProjectModel *oneP in self.arr_OriginProjects) {
            if ([oneP.leixing isEqualToString:@"学校医院类"]) {
                [self.arr_Projects addObject:oneP];
            }
        }

    }
    else if (sender.tag == 205)
    {
        for (RbtProjectModel *oneP in self.arr_OriginProjects) {
            if ([oneP.leixing isEqualToString:@"企业单位类"]) {
                [self.arr_Projects addObject:oneP];
            }
        }
////        btn_KehuleixingTitle = [[NSAttributedString alloc] initWithString:@"工矿企业类" attributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIFont fontWithName:kFontName size:15],UITextAttributeFont,[UIColor whiteColor],UITextAttributeTextColor, nil]];
    }
//    else if (sender.tag == 206)
//    {
//        for (RbtProjectModel *oneP in self.arr_OriginProjects) {
//            if ([oneP.leixing isEqualToString:@"政府部队类"]) {
//                [self.arr_Projects addObject:oneP];
//            }
//        }
//
//    }
//    else if (sender.tag == 207)
//    {
//        for (RbtProjectModel *oneP in self.arr_OriginProjects) {
//            if ([oneP.leixing isEqualToString:@"农林畜牧类"]) {
//                [self.arr_Projects addObject:oneP];
//            }
//        }
//
//    }
    else if (sender.tag == 206)
    {
        for (RbtProjectModel *oneP in self.arr_OriginProjects) {
            if ([oneP.leixing isEqualToString:@"其它"]) {
                [self.arr_Projects addObject:oneP];
            }
        }
    }
    [self.tableView reloadData];

}
#pragma mark - tableview delegate methods
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if ([RbtCommonTool getJinRuMode] == WoDeGongCheng) {
        if ([self.arr_Projects count] > 100) {
            if (isMore) {
                return [self.arr_Projects count];
            }
            else{
                return 100;
            }
        }
        else{
            return [self.arr_Projects count];
        }
    }
    else{
        return [self.arr_Projects count];
    }
    return [self.arr_Projects count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *result = nil;
    if ([tableView isEqual:self.tableView]){
        static NSString *TableViewCellIdentifier = @"MyCells";
        result = [tableView dequeueReusableCellWithIdentifier:TableViewCellIdentifier];
        if (result == nil){
            result = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:TableViewCellIdentifier];
            result.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"gdgc_cellBG"]];
//            result.accessoryView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"next"]];
        }
        RbtProjectModel *oneProject =(RbtProjectModel *)[self.arr_Projects objectAtIndex:indexPath.row];
        result.textLabel.text = oneProject.name;
        result.textLabel.font = [UIFont fontWithName:kFontName size:15];
        NSString *detailString = [oneProject.leixing stringByAppendingFormat:@" | %@",oneProject.city];
        result.detailTextLabel.text = detailString;
        result.detailTextLabel.font = [UIFont fontWithName:kFontName size:11];
        result.detailTextLabel.textColor = [UIColor grayColor];
    }
    return result;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 59;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    BOOL doit = YES;
    if ([RbtCommonTool getJinRuMode] == GongGGC) {
        doit = NO;
        if (indexPath.row == 0) {
            doit = YES;
        }
    }
    
    if (doit) {
        RbtProjectModel *oneProject =(RbtProjectModel *)[self.arr_Projects objectAtIndex:indexPath.row];
        [RbtProjectModel sharedInstance].projectid = oneProject.projectid;
        [RbtProjectModel sharedInstance].name = oneProject.name;
        [RbtProjectModel sharedInstance].city = oneProject.city;
        [RbtProjectModel sharedInstance].citycode = oneProject.citycode;
        [RbtProjectModel sharedInstance].longitude = oneProject.longitude;
        [RbtProjectModel sharedInstance].latitude = oneProject.latitude;
        
        //保存浏览记录
        if ([RbtCommonTool getJinRuMode] == WoDeGongCheng) {
            for (RbtProjectModel *p in self.arr_LiuLanProjects) {
                if ([p.projectid isEqualToString:oneProject.projectid]) {
                    [self.arr_LiuLanProjects removeObject:p];
                    break;
                }
            }
            [self.arr_LiuLanProjects insertObject:oneProject atIndex:0];
            [self liuLanBaoCun];
        }
        [tableView deselectRowAtIndexPath:indexPath animated:YES];
        
        [RbtProjectInfoModel sharedInstance].pid = oneProject.projectid;
        [self.hud1 show:YES];
        
        RbtWebManager *webmanager;
        if ([RbtCommonTool getJinRuMode] != LiXianGongCheng) {
            webmanager = [RbtWebManager getRbtManager:YES];
        }
        else{
            webmanager = [RbtWebManager getRbtManager:NO];
        }
        webmanager.name = @"getProjectInfo";
        webmanager.delegate = self;
        [webmanager getProjectInfo:oneProject.projectid];
    }
    else{
        [RbtCommonTool showInfoAlert:@"请登录后查看"];
    }
}

- (UIView *) tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    if (_refreshFooterView == nil) {
        _refreshFooterView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 40)];
        _activityView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
        _activityView.frame = CGRectMake(130, 0, 60, 40);
        [_refreshFooterView addSubview:_activityView];
        [_activityView startAnimating];
        _refreshFooterView.hidden = YES;
        [self.tableView.tableFooterView addSubview:_refreshFooterView];
    }
    return _refreshFooterView;
}

- (void)liuLanBaoCun{
    NSString *liuLanFilePath = [RbtCommonTool liuLanFilePath];
    if ([self.arr_LiuLanProjects count]>5) {
        [self.arr_LiuLanProjects removeLastObject];
    }
    BOOL success = [NSKeyedArchiver archiveRootObject:self.arr_LiuLanProjects toFile:liuLanFilePath];
    if (!success) {
        NSLog(@"保存浏览记录失败");
    }
}


#pragma mark -UIActionSheet delegate
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    TSLocateView *locateView = (TSLocateView *)actionSheet;
    TSLocation *location = locateView.locate;
    if(buttonIndex == 0) {
        NSLog(@"Cancel");
    }else {
        self.arr_Projects =[[NSMutableArray alloc] init];
        if ([location.state isEqualToString:@"全部"]) {
            self.arr_Projects = self.arr_OriginProjects;
        } else {
//            self.arr_Projects =[[NSMutableArray alloc] init];
            for (RbtProjectModel *oneProject in self.arr_OriginProjects) {
                if ([location.city isEqualToString:@"全部"]) {
                    if ([oneProject.city rangeOfString:location.state].length != NSNotFound&&[oneProject.city rangeOfString:location.state].length != 0) {
                        [self.arr_Projects addObject:oneProject];
                    }
                }
                else{
                    if ([oneProject.city rangeOfString:location.city].length != NSNotFound&&[oneProject.city rangeOfString:location.city].length != 0) {
                        [self.arr_Projects addObject:oneProject];
                    }
                }
            }
        }
        
        
        
        
        [self.tableView reloadData];
    }
//    self.citySheetView.hidden = YES;
}

#pragma mark - mapView delegate
- (void)mapView:(MKMapView *)mapView didSelectAnnotationView:(MKAnnotationView *)view{
    NSLog(@"select");
}

- (void)mapView:(MKMapView *)mapView annotationView:(MKAnnotationView *)view calloutAccessoryControlTapped:(UIControl *)control{
    NSLog(@"calloutAccessoryControlTapped");
    
    BOOL doit = YES;
    if ([RbtCommonTool getJinRuMode] == GongGGC) {
        doit = NO;
        [RbtCommonTool showInfoAlert:@"请登录后查看"];
    }
    
    if (doit) {
        if ([view.annotation isKindOfClass:[MyAnnotation class]]) {
            MyAnnotation *myAnn = (MyAnnotation *)view.annotation;
            for (RbtProjectModel *oneProject in self.arr_OriginProjects) {
                if([myAnn.title isEqualToString:oneProject.name]){
                    [RbtProjectModel sharedInstance].projectid = oneProject.projectid;
                    [RbtProjectModel sharedInstance].name = oneProject.name;
                    [RbtProjectModel sharedInstance].city = oneProject.city;
                    [RbtProjectModel sharedInstance].citycode = oneProject.citycode;
                    [RbtProjectModel sharedInstance].longitude = oneProject.longitude;
                    [RbtProjectModel sharedInstance].latitude = oneProject.latitude;
                    
                    //保存浏览记录
                    if ([RbtCommonTool getJinRuMode] == WoDeGongCheng) {
                        for (RbtProjectModel *p in self.arr_LiuLanProjects) {
                            if ([p.projectid isEqualToString:oneProject.projectid]) {
                                [self.arr_LiuLanProjects removeObject:p];
                                break;
                            }
                        }
                        [self.arr_LiuLanProjects insertObject:oneProject atIndex:0];
                        [self liuLanBaoCun];
                    }
                    
                    [RbtProjectInfoModel sharedInstance].pid = oneProject.projectid;
                    [self.hud1 show:YES];
                    
                    RbtWebManager *webmanager;
                    if ([RbtCommonTool getJinRuMode] != LiXianGongCheng) {
                        webmanager = [RbtWebManager getRbtManager:YES];
                    }
                    else{
                        webmanager = [RbtWebManager getRbtManager:NO];
                    }
                    webmanager.name = @"getProjectInfo";
                    webmanager.delegate = self;
                    [webmanager getProjectInfo:oneProject.projectid];
                    break;
                }
            }
        }
    }
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
    static NSString *identifier = @"Annotation";
    MKPinAnnotationView *annotationView = (MKPinAnnotationView *)[mapView dequeueReusableAnnotationViewWithIdentifier:identifier];
    if (annotationView == nil) {
        //MKPinAnnotationView 是大头针视图
        annotationView = [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:identifier];
        
        //设置是否显示标题视图
        annotationView.canShowCallout = YES;
        annotationView.image = [UIImage imageNamed:@"map"];
        
        UIButton *button = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
        //        [button addTarget:self action:@selector(buttonAction) forControlEvents:UIControlEventTouchUpInside];
        //
        //        //标题右边视图
        annotationView.rightCalloutAccessoryView = button;
        //标题左边视图
        //        annotationView.leftCalloutAccessoryView
    }
    annotationView.annotation = annotation;
    //设置大头针的颜色
    //    annotationView.pinColor = MKPinAnnotationColorRed;
    //从天上落下的动画
    //    annotationView.animatesDrop = NO;
    return annotationView;
    //-------------------使用图片作为标注视图---------------------
}

//- (void)buttonAction{
//    NSLog(@"buttonAction");
//}

#pragma mark- request delegate
- (void)onDataLoadWithService:(RbtWebManager *)webService
                  andResponse:(NSDictionary *)responseDic
{
    [super onDataLoadWithService:webService andResponse:responseDic];
    if([webService.name isEqualToString:@"getProjectInfo"]){
        if ([RbtCommonTool getJinRuMode] == LiXianGongCheng) {
            micGongChengJianJieViewController *gcjjVc = [[micGongChengJianJieViewController alloc] init];
            [self.navigationController pushViewController:gcjjVc animated:YES];
        }
        else{
            if ([[responseDic objectForKey:@"rc"] isEqualToString:@"1"]) {
                responseDic = [responseDic objectForKey:@"rt"];
                [RbtProjectInfoModel sharedInstance].n = [responseDic objectForKey:@"n"];
                [RbtProjectInfoModel sharedInstance].i = [responseDic objectForKey:@"i"];
                [RbtProjectInfoModel sharedInstance].w = [responseDic objectForKey:@"w"];
                [RbtProjectInfoModel sharedInstance].c = [responseDic objectForKey:@"c"];
                [RbtProjectInfoModel sharedInstance].t = [responseDic objectForKey:@"t"];
                [RbtProjectInfoModel sharedInstance].p = [responseDic objectForKey:@"p"];
                [RbtProjectInfoModel sharedInstance].ct = [responseDic objectForKey:@"ct"];
                micGongChengJianJieViewController *gcjjVc = [[micGongChengJianJieViewController alloc] init];
                [self.navigationController pushViewController:gcjjVc animated:YES];
            }
            else if ([[responseDic objectForKey:@"rc"] isEqualToString:@"0"]){
                if (!isAlertShow) {
//                    [RbtCommonTool showInfoAlert:[responseDic objectForKey:@"rd"]];
                    isAlertShow = YES;
                }
                
            }
        }
    }
    else if([webService.name isEqualToString:@"getMyProjectWebManager"]){
        if ([[responseDic objectForKey:@"rc"] isEqualToString:@"1"]) {
            [RbtCommonModel sharedInstance].arr_myProject = [[NSMutableArray alloc] init];
            NSArray *arrRt = [responseDic objectForKey:@"rt"];
            for (int i = 0;i < [arrRt count]; i++) {
                NSDictionary *oneLeixing = [arrRt objectAtIndex:i];
                NSArray *arr = [oneLeixing objectForKey:@"l"];
                NSString *string_leixing =[oneLeixing objectForKey:@"ct"];
                for (int j = 0; j<[arr count]; j++) {
                    NSDictionary *onePro = [arr objectAtIndex:j];
                    RbtProjectModel *oneProject = [[RbtProjectModel alloc] init];
                    oneProject.leixing = string_leixing;
                    oneProject.name = [onePro objectForKey:@"n"];
                    oneProject.projectid = [onePro objectForKey:@"id"];
                    oneProject.city = [onePro objectForKey:@"a"];
                    oneProject.citycode = [onePro objectForKey:@"c"];
                    [[RbtCommonModel sharedInstance].arr_myProject addObject:oneProject];
                }
            }
            self.arr_Projects = [RbtCommonModel sharedInstance].arr_myProject;
            [self.tableView reloadData];
            [self doneLoadingTableViewData];
        }
        else if ([[responseDic objectForKey:@"rc"] isEqualToString:@"0"]){
            [RbtCommonTool showInfoAlert:@"用户名不存在"];
        }
    }
}


#pragma mark -
#pragma mark UIScrollViewDelegate Methods

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
	[_refreshHeaderView egoRefreshScrollViewDidScroll:scrollView];
}

- (void)hideNow{
    _refreshFooterView.hidden = YES;
    [self.tableView reloadData];
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
	
	[_refreshHeaderView egoRefreshScrollViewDidEndDragging:scrollView];
    if (isMore) {
        float sh = [self.arr_Projects count]*59-self.tableView.bounds.size.height;
        if (sh > 0) {
            if (self.tableView.bounds.origin.y > sh) {
                _refreshFooterView.hidden = NO;
                if (self.h>0) {
                    NSLog(@"reloaddata");
                }
                isMore = NO;
                [self performSelector:@selector(hideNow) withObject:self afterDelay:0.3];
            }
        }
    }
}

//- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
//    [self hiddenSearchBar];
//}

#pragma mark -
#pragma mark Data Source Loading / Reloading Methods

- (void)reloadTableViewDataSource{
	
	//  should be calling your tableviews data source model to reload
	//  put here just for demo
    
	_reloading = YES;
	
}

- (void)doneLoadingTableViewData{
	
	//  model should call this when its done loading
	_reloading = NO;
	[_refreshHeaderView egoRefreshScrollViewDataSourceDidFinishedLoading:self.tableView];
	
}

#pragma mark -
#pragma mark EGORefreshTableHeaderDelegate Methods

- (void)egoRefreshTableHeaderDidTriggerRefresh:(EGORefreshTableHeaderView*)view{
	[self reloadTableViewDataSource];
    RbtWebManager *getMyProjectWebManager = [RbtWebManager getRbtManager:YES];
    getMyProjectWebManager.name = @"getMyProjectWebManager";
    getMyProjectWebManager.delegate = self;
    NSString *userName =[RbtUserModel sharedInstance].userName;
    [getMyProjectWebManager getMyProjectWithUser:userName andH:@"1"];
    [self.hud1 show:YES];
}

- (BOOL)egoRefreshTableHeaderDataSourceIsLoading:(EGORefreshTableHeaderView*)view{
	return _reloading; // should return if data source model is reloading
}

- (NSDate*)egoRefreshTableHeaderDataSourceLastUpdated:(EGORefreshTableHeaderView*)view{
	return [NSDate date]; // should return date data source was last changed
}

-(void)tabBarItemClicked:(int)tag
{
    selectIndex = tag;
    if (tag == 1000) {
        self.kehuleixing_XialaView.hidden = NO;
        self.myMapView.hidden = YES;
        self.citySheetView.hidden = YES;
    }
    else if (tag == 1001)
    {
        self.kehuleixing_XialaView.hidden = YES;
//        [self changeBackBtnKehuleixing];
        if (!self.citySheetView) {
            self.citySheetView = [[TSLocateView alloc] initWithTitle:@"城市索引" delegate:self];
            [self.citySheetView showInView:self.view];
        }
        self.citySheetView.hidden = NO;
        self.myMapView.hidden = YES;
    }
    else if (tag == 1002)
    {
        self.kehuleixing_XialaView.hidden = YES;
        self.myMapView.hidden = NO;
        self.citySheetView.hidden = YES;
    }
    else if (tag == 1003)
    {
        self.kehuleixing_XialaView.hidden = YES;
        self.arr_Projects = self.arr_LiuLanProjects;
        [self.tableView reloadData];
        self.myMapView.hidden = YES;
        self.citySheetView.hidden = YES;
    }

}

-(void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
{
    [super willRotateToInterfaceOrientation:toInterfaceOrientation duration:duration];
    [self setItemsFrame:toInterfaceOrientation];
}


-(void)setItemsFrame:(UIInterfaceOrientation)orientation
{
    if (orientation == UIInterfaceOrientationLandscapeLeft || orientation == UIInterfaceOrientationLandscapeRight)
    {
        NSArray *itemsArray = [[NSArray alloc] initWithObjects:[UIImage imageNamed:@"gdgc_tabBG_h"], [UIImage imageNamed:@"gdgc_biankuang_h"], [UIImage imageNamed:@"gdgc_kehuleixing_h"], [UIImage imageNamed:@"gdgc_chengshisuoyin_h"], [UIImage imageNamed:@"gdgc_ditusuoyin_h"], [UIImage imageNamed:@"gdgc_liulanjilu_h"], nil];
        float imageHeight = 200/2;
        float imageGap = 7;
        [micTopTabbarData shareInstance].imageGap = imageGap;
        [micTopTabbarData shareInstance].imageHeight = imageHeight;
        [micTopTabbarData shareInstance].itemsArray = itemsArray;
        [micTopTabbarData shareInstance].selectIndex = selectIndex;
        [topTabbar setFrame:CGRectMake(0, 64, 1024, 231/2)];
        self.tableView.frame = CGRectMake(0, 222, ScreenHeight, ScreenWidth-222);
        egoView.frame = CGRectMake(0.0f, 0.0f - self.tableView.bounds.size.height, self.view.frame.size.width, self.tableView.bounds.size.height);
        self.kehuleixing_XialaView.frame = CGRectMake(0, 180, 1024, 42);
        for (id obj in self.kehuleixing_XialaView.subviews){
            if ([obj isKindOfClass:[UIButton class]]) {
                UIButton *tempButton = (UIButton *)obj;
                for (int i = 201; i<209; i++) {
                    if (tempButton.tag == i) {
                        tempButton.frame = CGRectMake((i-201)*1024/8+3, 5, 90, 31);
                    }
                    
                }
            }
            
        }

        
        kehuleixing_xialabg.frame = CGRectMake(0, 0, 1024, 42);
    }
    else
    {
        NSArray *itemsArray = [[NSArray alloc] initWithObjects:[UIImage imageNamed:@"gdgc_tabBG"], [UIImage imageNamed:@"gdgc_biankuang"], [UIImage imageNamed:@"gdgc_kehuleixing"], [UIImage imageNamed:@"gdgc_chengshisuoyin"], [UIImage imageNamed:@"gdgc_ditusuoyin"], [UIImage imageNamed:@"gdgc_liulanjilu"], nil];
        float imageHeight = 101;
        float imageGap = 7;
        [micTopTabbarData shareInstance].imageGap = imageGap;
        [micTopTabbarData shareInstance].imageHeight = imageHeight;
        [micTopTabbarData shareInstance].itemsArray = itemsArray;
        [micTopTabbarData shareInstance].selectIndex = selectIndex;
        [topTabbar setFrame:CGRectMake(0, 64, 768, 116)];
        self.tableView.frame = CGRectMake(0, 222, ScreenWidth, ScreenHeight-222);
//        maskView.frame = CGRectMake(0, 64, ScreenWidth, 116);
        egoView.frame = CGRectMake(0.0f, 0.0f - self.tableView.bounds.size.height, self.view.frame.size.width, self.tableView.bounds.size.height);
        self.kehuleixing_XialaView.frame = CGRectMake(0, 180, 768, 42);
        for (id obj in self.kehuleixing_XialaView.subviews){
            if ([obj isKindOfClass:[UIButton class]]) {
                UIButton *tempButton = (UIButton *)obj;
                for (int i = 201; i<209; i++) {
                    if (tempButton.tag == i) {
                        tempButton.frame = CGRectMake((i-201)*768/8+3, 5, 90, 31);
                    }
                    
                }
            }
            
        }
        kehuleixing_xialabg.frame = CGRectMake(0, 0, 768, 42);
    }
    
}


@end
