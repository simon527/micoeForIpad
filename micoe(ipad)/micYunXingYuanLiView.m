//
//  micYunXingYuanLIView.m
//  micoe(ipad)
//
//  Created by Simon on 14-1-17.
//  Copyright (c) 2014年 Simon. All rights reserved.
//

#import "micYunXingYuanLiView.h"
#import "RbtDataOfResponse.h"


#define FRESHTIME   10.0

@implementation micYunXingYuanLiView
{
    NSString *timeStr;
}


@synthesize yltName, yltDic;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self initView];
        [self addObserver:self forKeyPath:@"hidden" options:NSKeyValueObservingOptionNew context:nil];
    }
    return self;
}

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    
//    [[NSNotificationCenter defaultCenter] postNotificationName:@"YLTHidden" object:nil];
    NSLog(@"ccv = %@", change);
    if ([change objectForKey:@"new"]) {
        [_timer invalidate];
    }
    else
    {
        self.timer=  [NSTimer scheduledTimerWithTimeInterval:FRESHTIME target:self selector:@selector(fresh) userInfo:nil repeats:YES];
    }
}


-(void)initView
{
    IphoneGap = 0;
    yltName = [[RbtDataOfResponse sharedInstance].yuanlituDic objectForKey:@"t"];
    yltDic =[[RbtDataOfResponse sharedInstance].yuanlituDic objectForKey:@"d"];
    
    timeLabel = [[UILabel alloc] initWithFrame:CGRectMake(30, 30, 200, 30)];
    
//    NSDate *now = [NSDate date];
//    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
//    [dateFormatter setDateFormat:@"HH:mm:ss"];
//    NSString *dateStr = [dateFormatter stringFromDate:now];
    //    timeLabel.text = timeStr;
    
    
    
    
    for (NSDictionary *tempDic in yltDic) {
        if ([tempDic objectForKey:@"time"]) {
            timeLabel.text = [tempDic objectForKey:@"time"];
        }
        if ([[tempDic objectForKey:@"n"] isEqualToString:@"W_S"]) {
            [RbtDataOfResponse sharedInstance].num_W1_S = [tempDic objectForKey:@"v"];
        }
        if ([[tempDic objectForKey:@"n"] isEqualToString:@"W1_S"]) {
            [RbtDataOfResponse sharedInstance].num_W1_S = [tempDic objectForKey:@"v"];
        }
        if ([[tempDic objectForKey:@"n"] isEqualToString:@"W2_S"]) {
            [RbtDataOfResponse sharedInstance].num_W2_S = [tempDic objectForKey:@"v"];
        }
        if ([[tempDic objectForKey:@"n"] isEqualToString:@"T2_S"]) {
            [RbtDataOfResponse sharedInstance].num_T1_S = [tempDic objectForKey:@"v"];
        }
        if ([[tempDic objectForKey:@"n"] isEqualToString:@"T4_S"]) {
            [RbtDataOfResponse sharedInstance].num_T2_S = [tempDic objectForKey:@"v"];
        }
    }
    
    if ([yltName isEqualToString:@"M903-II"]) {
        YLT903_II = [[RbtYLT903_II alloc] initWithFrame:CGRectMake(0, IphoneGap, 768, 1024-49-64-130)];
        YLT903_II.tag = 90320;
        [self addSubview:YLT903_II];
        viewTag = 90320;
    }
    
    if ([yltName isEqualToString:@"M903-I"]) {
        YLT903_I = [[RbtYLT903_I alloc] initWithFrame:CGRectMake(0, IphoneGap, 768, 1024-49-64-130)];
        YLT903_I.tag = 90310;
        [self addSubview:YLT903_I];
        viewTag = 90310;
    }
    
    if ([yltName isEqualToString:@"M905-III"]) {
        YLT905 = [[RbtYLT905 alloc] initWithFrame:CGRectMake(0, IphoneGap, 768, 1024-49-64-130)];
        YLT905.tag = 90500;
        [self addSubview:YLT905];
        viewTag = 90500;
    }
    
    if ([yltName isEqualToString:@"M906-I-03"]) {
        YLT906 = [[RbtYLT906 alloc] initWithFrame:CGRectMake(0, IphoneGap, 768, 1024-49-64-130)];
        YLT906.tag = 90630;
        [self addSubview:YLT906];
        viewTag = 90630;
    }
    
    if ([yltName isEqualToString:@"M906-I-02"]) {
        YLT906_2 = [[RbtYLT906_2 alloc] initWithFrame:CGRectMake(0, IphoneGap, 768, 1024-49-64-130)];
        YLT906_2.tag = 90620;
        [self addSubview:YLT906_2];
        viewTag = 90620;
    }
    
    [self addSubview:timeLabel];
    
        self.timer=  [NSTimer scheduledTimerWithTimeInterval:FRESHTIME target:self selector:@selector(fresh) userInfo:nil repeats:YES];
    
    
}


-(void)fresh
{
//    NSDate *now = [NSDate date];
//    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
//    [dateFormatter setDateFormat:@"HH:mm:ss"];
//    NSString *dateStr = [dateFormatter stringFromDate:now];
//    timeLabel.text = dateStr;
    
    if (([RbtCommonTool getJinRuMode] != LiXianGongCheng) && ([[[NSUserDefaults standardUserDefaults] objectForKey:@"wodegongcheng"] intValue])) {
        [self postData];
    }
}

-(void)postData
{
    RbtWebManager *webManager;
    if([RbtCommonTool getJinRuMode] != LiXianGongCheng){
        webManager = [RbtWebManager getRbtManager:YES];
    }
    else{
        webManager = [RbtWebManager getRbtManager:NO];
    }
    
    if ([[RbtUserModel sharedInstance].yxyl isEqualToString:@"n"]) {
        [RbtCommonTool showInfoAlert:@"用户无权限"];
    }
    else{
        webManager.name = @"yuanlituWeb";
        webManager.delegate = self;
        //        [self.hud1 show:YES];
        [webManager getrunprincipleWithP:[RbtProjectModel sharedInstance].projectid];
    }
}

-(void)onDataLoadWithService:(RbtWebManager *)webService andResponse:(NSDictionary *)responseDic
{
    [super onDataLoadWithService:webService andResponse:responseDic];
    if ([webService.name isEqualToString:@"yuanlituWeb"]) {
//        NSDate *now = [NSDate date];
//        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
//        [dateFormatter setDateFormat:@"HH:mm:ss"];
//        NSString *dateStr = [dateFormatter stringFromDate:now];
//        timeLabel.text = dateStr;
        
        if ([RbtCommonTool getJinRuMode] == LiXianGongCheng) {
            [RbtDataOfResponse sharedInstance].yuanlituDic = responseDic;
        }
        else{
            if ([[responseDic objectForKey:@"rc"] intValue]) {
                NSDictionary *tempDIc = [responseDic objectForKey:@"rt"];
                [RbtDataOfResponse sharedInstance].yuanlituDic = tempDIc;
                 timeStr = [[[tempDIc objectForKey:@"d"] objectAtIndex:0] objectForKey:@"time"];
                timeLabel.text = timeStr;
            }
            else
            {
                [RbtCommonTool showInfoAlert:[responseDic objectForKey:@"rd"]];
            }
        }
        
        if (YLT903_I) {
            [YLT903_I setStatus];
        }
        if (YLT903_II) {
            [YLT903_II setStatus];
        }
        if (YLT905) {
            [YLT905 setStatus];
        }
        if (YLT906) {
            [YLT906 setStatus];
        }
        if (YLT906_2) {
            [YLT906_2 setStatus];
        }
        
        
        [[NSNotificationCenter defaultCenter] postNotificationName:@"yuanlituDicGet" object:nil userInfo:nil];
        
    }
    
}

-(void)dealloc
{
    [self removeObserver:self forKeyPath:@"hidden" context:nil];
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
