//
//  RbtYckzDsViewController.m
//  micoe
//
//  Created by 黄川 on 13-12-23.
//  Copyright (c) 2013年 redbudtek. All rights reserved.
//

#import "RbtYckzDsViewController.h"

@interface RbtYckzDsViewController ()<UIPickerViewDataSource,UIPickerViewDelegate>
{
    NSMutableArray *arr_hour;
    NSMutableArray *arr_min;
    NSInteger space;
}
@end

@implementation RbtYckzDsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated{
//    [self initPickerView];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"定时设置";
    UIButton *submitButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [submitButton setImage:[UIImage imageNamed:@"yckz_tj"] forState:UIControlStateNormal];
    [submitButton addTarget:self action:@selector(submit) forControlEvents:UIControlEventTouchUpInside];
    submitButton.frame = CGRectMake(0, 0, 73, 37);
    UIBarButtonItem *submitBar = [[UIBarButtonItem alloc] initWithCustomView:submitButton];
    self.navigationItem.rightBarButtonItem = submitBar;
    
    space = 280;

    self.view.backgroundColor = [UIColor whiteColor];
    
    arr_hour = [[NSMutableArray alloc] init];
    for (int i = 0; i<24; i++) {
        NSString *string = [NSString stringWithFormat:@"%d",i];
        [arr_hour addObject:string];
    }
    
    arr_min = [[NSMutableArray alloc] init];
    for (int i = 0; i<60; i++) {
        NSString *string = [NSString stringWithFormat:@"%d",i];
        [arr_min addObject:string];
    }
    
    for (int i = 0; i<3; i++) {
        UILabel *lab1 = [[UILabel alloc] initWithFrame:CGRectMake(60, 100+space*i, 100, 60)];
        lab1.text = [NSString stringWithFormat:@"时段%d：",i+1];
        [lab1 setFont:[UIFont fontWithName:kFontName size:28]];
        lab1.textColor = [UIColor colorWithRed:71/255.0 green:190/255.0 blue:184/255.0 alpha:1];
        [self.view addSubview:lab1];
        
        UILabel *labks = [[UILabel alloc] initWithFrame:CGRectMake(60, 178+space*i, 90, 60)];
        labks.text = @"开始";
        [labks setFont:[UIFont fontWithName:kFontName size:28]];
        labks.textColor = [UIColor colorWithRed:71/255.0 green:190/255.0 blue:184/255.0 alpha:1];
        [self.view addSubview:labks];
        
        UIPickerView *timePicker = [[UIPickerView alloc] init];
        timePicker.delegate = self;
        timePicker.dataSource = self;
        timePicker.frame = CGRectMake(130, 100+space*i, 180, 324);
        [timePicker setShowsSelectionIndicator:YES];
        [self.view addSubview:timePicker];
        timePicker.tag = i*100+1;
        
        UILabel *labjs = [[UILabel alloc] initWithFrame:CGRectMake(370, 178+space*i, 90, 60)];
        labjs.text = @"结束";
        [labjs setFont:[UIFont fontWithName:kFontName size:28]];
        labjs.textColor = [UIColor colorWithRed:71/255.0 green:190/255.0 blue:184/255.0 alpha:1];
        [self.view addSubview:labjs];
        
        UIPickerView *timePicker_j = [[UIPickerView alloc] init];
        timePicker_j.delegate = self;
        timePicker_j.dataSource = self;
        timePicker_j.frame = CGRectMake(440, 100+space*i, 180, 324);
        [timePicker_j setShowsSelectionIndicator:YES];
        [self.view addSubview:timePicker_j];
        timePicker_j.tag = i*100+2;
    }
	// Do any additional setup after loading the view.
}

- (void)initTimes{
    self.startTime1 = @"";
    self.endTime1 = @"";
    self.startTime2 = @"";
    self.endTime2 = @"";
    self.startTime3 = @"";
    self.endTime3 = @"";
}

- (void)initPickerView{
    for (int i = 0; i<3; i++) {
        UIPickerView *timePicker = (UIPickerView *)[self.view viewWithTag:i*100+1];
        NSArray *time_Arr;
        if (i == 0) {
            time_Arr = [self.startTime1 componentsSeparatedByString:@":"];
        }
        else if(i == 1){
            time_Arr = [self.startTime2 componentsSeparatedByString:@":"];
        }
        else if(i == 2){
            time_Arr = [self.startTime3 componentsSeparatedByString:@":"];
        }
        if ([time_Arr count] == 2) {
            NSInteger hour  = [[time_Arr objectAtIndex:0] integerValue];
            NSInteger min =  [[time_Arr objectAtIndex:1] integerValue];
            [timePicker selectRow:hour inComponent:0 animated:YES];
            [timePicker selectRow:min inComponent:1 animated:YES];
        }
        
        UIPickerView *timePicker_j = (UIPickerView *)[self.view viewWithTag:i*100+2];
        NSArray *timeend_Arr;
        if (i == 0) {
            timeend_Arr = [self.endTime1 componentsSeparatedByString:@":"];
        }
        else if(i == 1){
            timeend_Arr = [self.endTime2 componentsSeparatedByString:@":"];
        }
        else if(i == 2){
            timeend_Arr = [self.endTime3 componentsSeparatedByString:@":"];
        }
        if ([timeend_Arr count] == 2) {
            NSInteger hour  = [[time_Arr objectAtIndex:0] integerValue];
            NSInteger min =  [[time_Arr objectAtIndex:1] integerValue];
            [timePicker_j selectRow:hour inComponent:0 animated:YES];
            [timePicker_j selectRow:min inComponent:1 animated:YES];
        }
    }
}

- (void)submit{
    if ([self isfuhegf]) {
        if (!(self.startTime1 && self.endTime1)) {
            self.startTime1 = nil;
            self.endTime1 = nil;
        }
        if (!(self.startTime2 && self.endTime2)) {
            self.startTime2 = nil;
            self.endTime2 = nil;
        }
        if (!(self.startTime3 && self.endTime3)) {
            self.startTime3 = nil;
            self.endTime3 = nil;
        }
        
        
        NSMutableDictionary *info = [[NSMutableDictionary alloc] init];
        if (self.startTime1) {
            [info setObject:self.startTime1 forKey:@"startTime1"];
        }
        else{
            [info setObject:@"" forKey:@"startTime1"];
        }
        
        if (self.endTime1) {
            [info setObject:self.endTime1 forKey:@"endTime1"];
        }
        else{
            [info setObject:@"" forKey:@"endTime1"];
        }

        if (self.startTime2) {
            [info setObject:self.startTime2 forKey:@"startTime2"];
        }
        else{
            [info setObject:@"" forKey:@"startTime2"];
        }

        if (self.endTime2) {
            [info setObject:self.endTime2 forKey:@"endTime2"];
        }
        else{
            [info setObject:@"" forKey:@"endTime2"];
        }

        if (self.startTime3) {
            [info setObject:self.startTime3 forKey:@"startTime3"];
        }
        else{
            [info setObject:@"" forKey:@"startTime3"];
        }

        if (self.endTime3) {
            [info setObject:self.endTime3 forKey:@"endTime3"];
        }
        else{
            [info setObject:@"" forKey:@"endTime3"];
        }

        
        [self.delegate dsVc:self andInfo:info isBack:NO];
        [self.navigationController popViewControllerAnimated:YES];
    }
    else{
        [RbtCommonTool showInfoAlert:@"所选时段不符合规范"];
    }
}

- (void)back{
    [self.delegate dsVc:self andInfo:nil isBack:YES];
    [self.navigationController popViewControllerAnimated:YES];
}

- (BOOL)isfuhegf{
    BOOL isfuhe = YES;
    NSDate *date_startTime1 = [self convertToDate:self.startTime1];
    NSDate *date_endTime1 = [self convertToDate:self.endTime1];
    NSDate *date_startTime2 = [self convertToDate:self.startTime2];
    NSDate *date_endTime2 = [self convertToDate:self.endTime2];
    NSDate *date_startTime3 = [self convertToDate:self.startTime3];
    NSDate *date_endTime3 = [self convertToDate:self.endTime3];
    
    if ([ date_startTime1 compare:date_endTime1] >= 0&&date_startTime1 &&date_endTime1) {
        isfuhe = NO;
        return isfuhe;
    }
    if ([date_startTime2 compare:date_endTime2] >= 0&&date_startTime2&&date_endTime2) {
        isfuhe = NO;
        return isfuhe;
    }
    if ([date_startTime3 compare:date_endTime3] >= 0&&date_startTime3&&date_endTime3) {
        isfuhe = NO;
        return isfuhe;
    }
    
    NSArray *arr = [self isShiJianDuan];
    if ([arr count] >0) {
        if ([arr count] == 2) {
            isfuhe = [self compareTime:[arr objectAtIndex:0] andTime:[arr objectAtIndex:1]];
        }
        else if([arr count] == 3){
        isfuhe = [self compareTime:[arr objectAtIndex:0] andTime:[arr objectAtIndex:1]]
            &&[self compareTime:[arr objectAtIndex:0] andTime:[arr objectAtIndex:2]]&&[self compareTime:[arr objectAtIndex:1] andTime:[arr objectAtIndex:2]];
        }
    }
    else{
        isfuhe = NO;
    }
    return isfuhe;
}

- (NSArray *)isShiJianDuan{
    NSMutableArray *mu_arr = [[NSMutableArray alloc] init];
    if (self.startTime1&& self.endTime1) {
        NSArray *arr = [NSArray arrayWithObjects:self.startTime1,self.endTime1, nil];
        [mu_arr addObject:arr];
    }
    if (self.startTime2&& self.endTime2) {
        NSArray *arr = [NSArray arrayWithObjects:self.startTime2,self.endTime2, nil];
        [mu_arr addObject:arr];
    }
    if (self.startTime3&& self.endTime3) {
        NSArray *arr = [NSArray arrayWithObjects:self.startTime3,self.endTime3, nil];
        [mu_arr addObject:arr];
    }
    return mu_arr;
}


#pragma mark PickerView delegate

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    NSInteger result = 0;
    
    result = 2;
    return result;
}

- (NSInteger) pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    NSInteger result = 0;
    
    if (component == 0) {
        result = [arr_hour count];
    }
    else if(component == 1){
        result = [arr_min count];
    }
    return result;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row
            forComponent:(NSInteger)component{
    NSString *result = nil;
    
    /* Row is zero-based and we want the first row (with index 0) to be rendered as Row 1 so we have to +1 every row index */
    if (component == 0) {
        result = [arr_hour objectAtIndex:row];
    }
    else if (component == 1){
        result = [arr_min objectAtIndex:row];
    }
    return result;
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    NSString *hour;
    NSString *min;
    NSInteger hour_row;
    NSInteger min_row;
    hour_row = [pickerView selectedRowInComponent:0];
    min_row = [pickerView selectedRowInComponent:1];
    hour = [arr_hour objectAtIndex:hour_row];
    min = [arr_min objectAtIndex:min_row];
    if (pickerView.tag == 1) {
        self.startTime1 = [hour stringByAppendingString:[NSString stringWithFormat:@":%@",min]];
    }
    else if (pickerView.tag == 2){
        self.endTime1 = [hour stringByAppendingString:[NSString stringWithFormat:@":%@",min]];
    }
    else if (pickerView.tag == 101){
        self.startTime2 = [hour stringByAppendingString:[NSString stringWithFormat:@":%@",min]];
    }
    else if (pickerView.tag == 102){
        self.endTime2 = [hour stringByAppendingString:[NSString stringWithFormat:@":%@",min]];
    }
    else if (pickerView.tag == 201){
        self.startTime3 = [hour stringByAppendingString:[NSString stringWithFormat:@":%@",min]];
    }
    else if (pickerView.tag == 202){
        self.endTime3 = [hour stringByAppendingString:[NSString stringWithFormat:@":%@",min]];
    }
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL )compareTime:(NSArray *)arr1 andTime:(NSArray *)arr2{
    BOOL result = true;
    if ([arr1 count] !=2 || [arr2 count] !=2 ) {
        result = false;
        return result;
    }
    
    NSDate *arr1_0 = [self convertToDate:(NSString *)[arr1 objectAtIndex:0]];
    NSDate *arr1_1 = [self convertToDate:(NSString *)[arr1 objectAtIndex:1]];
    NSDate *arr2_0 = [self convertToDate:(NSString *)[arr2 objectAtIndex:0]];
    NSDate *arr2_1 = [self convertToDate:(NSString *)[arr2 objectAtIndex:1]];
    
    if ( [arr2_0 compare:arr1_0] >= 0&& [arr2_0 compare:arr1_1] <= 0) {
        result = false;
        return result;
    }
    
    if ( [arr2_1 compare:arr1_0] >= 0&& [arr2_1 compare:arr1_1] <= 0) {
        result = false;
        return result;
    }
    
    return result;
}

- (NSDate *)convertToDate:(NSString *)dateString{
    NSDate *result;
    
    NSDateFormatter *df=[[NSDateFormatter alloc] init];
    [df setDateFormat:@"h:m"];
    
    result=[df dateFromString:dateString];
    NSLog(@"dateDay =%@",result);
    
    
    return result;
}

@end
