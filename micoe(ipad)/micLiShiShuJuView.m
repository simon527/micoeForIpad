//
//  micLiShiShuJuView.m
//  micoe(ipad)
//
//  Created by Simon on 14-1-17.
//  Copyright (c) 2014年 Simon. All rights reserved.
//

#import "micLiShiShuJuView.h"

@implementation micLiShiShuJuView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
//        [self initViews];
        [self postData];
        

    }
    return self;
}

-(void)initViews
{
    danw =@"℃";
    
    shebeiArray = [[NSMutableArray alloc] initWithArray:[self sheibeiArrayFromresponse]];;
    shebeiCount = [shebeiArray count];
    
    float gap1 = 8;
    
    float gap2 = 10;
    
    float gap3 = self.height - 226 - 60;
    
    float tableViewHeight = gap3-gap2-64-86/2;
    
    UIImageView *topImageView = [[UIImageView alloc] initWithFrame:CGRectMake(gap1, gap2, 752, 60)];
    [topImageView setImage:[UIImage imageNamed:@"lssj_topBG"]];
    [self addSubview:topImageView];
    
    weekBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [weekBtn setFrame:CGRectMake(gap1+10, gap2+11, 167, 37)];
    [weekBtn setTag:3000];
    [weekBtn setImage:[UIImage imageNamed:@"lssj_week"] forState:UIControlStateNormal];
    [weekBtn setImage:[UIImage imageNamed:@"lssj_week_s"] forState:UIControlStateSelected];
    weekBtn.selected = YES;
    [weekBtn addTarget:self action:@selector(timeButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:weekBtn];
    
    monthBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [monthBtn setFrame:CGRectMake(gap1+10+167, gap2+11, 167, 37)];
    [monthBtn setTag:3001];
    [monthBtn setImage:[UIImage imageNamed:@"lssj_month"] forState:UIControlStateNormal];
    [monthBtn setImage:[UIImage imageNamed:@"lssj_month_s"] forState:UIControlStateSelected];
    [monthBtn addTarget:self action:@selector(timeButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:monthBtn];
    
    yearBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [yearBtn setFrame:CGRectMake(gap1+10+167*2, gap2+11, 167, 37)];
    [yearBtn setTag:3002];
    [yearBtn setImage:[UIImage imageNamed:@"lssj_year"] forState:UIControlStateNormal];
    [yearBtn setImage:[UIImage imageNamed:@"lssj_year_s"] forState:UIControlStateSelected];
    [yearBtn addTarget:self action:@selector(timeButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:yearBtn];
    
    lbBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [lbBtn setFrame:CGRectMake(675, gap2+15, 29, 29)];
    [lbBtn setImage:[UIImage imageNamed:@"lssj_lb"] forState:UIControlStateNormal];
    [lbBtn setImage:[UIImage imageNamed:@"lssj_lb_s"] forState:UIControlStateSelected];
    lbBtn.selected = YES;
    [lbBtn addTarget:self action:@selector(lnButtonClicked) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:lbBtn];
    
    xxtBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [xxtBtn setFrame:CGRectMake(715, gap2+15, 29, 29)];
    [xxtBtn setImage:[UIImage imageNamed:@"lssj_xx"] forState:UIControlStateNormal];
    [xxtBtn setImage:[UIImage imageNamed:@"lssj_xx_s"] forState:UIControlStateSelected];
    [xxtBtn addTarget:self action:@selector(xxtButtonClicked) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:xxtBtn];
    
    dataTabelView = [[UITableView alloc] initWithFrame:CGRectMake(gap1, gap2+topImageView.height, topImageView.width, tableViewHeight)];
    [dataTabelView setSectionIndexColor:[UIColor clearColor]];
    [dataTabelView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    [dataTabelView setSeparatorColor:[UIColor clearColor]];
    [dataTabelView setBackgroundView:nil];
    [dataTabelView setShowsVerticalScrollIndicator:NO];
    dataTabelView.delegate = self;
    dataTabelView.dataSource = self;
    //        [dataTabelView setBackgroundColor:[UIColor redColor]];
    [self addSubview:dataTabelView];
    
    
    values = dataArray;
//    NSLog(@"values = %@", values);
    chartView = [[FYChartView alloc] initWithFrame:dataTabelView.frame];
    chartView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    chartView.rectangleLineColor = [UIColor grayColor];
    chartView.lineColor = [UIColor blueColor];
    chartView.dataSource = self;
    
    chartView.hidden = YES;
    [self addSubview:chartView];
    
    UIImageView *imageView_downBG = [[UIImageView alloc] initWithFrame:CGRectMake(gap1, gap3, topImageView.width, 226)];
    [imageView_downBG setImage:[UIImage imageNamed:@"lssj_xiaBG"]];
    [self addSubview:imageView_downBG];
    
    sc = [[UIScrollView alloc] initWithFrame:imageView_downBG.frame];
    scCount = (shebeiCount%4)?(shebeiCount/4+1):(shebeiCount/4);
    sc.contentSize = CGSizeMake(topImageView.width * scCount, 226);
    //        sc.contentSize = CGSizeMake(600, 226);
    sc.pagingEnabled = YES;
    sc.delegate = self;
    sc.showsHorizontalScrollIndicator = NO;
    
    float gap4 = (topImageView.width - 138*4)/8 ;
    
    float btnX = gap4;
    float btnY = 40;
    
    float gap6 = (topImageView.width - 138*4)/8;
    
    for (int i=0; i < shebeiCount; i++) {
        UIButton *cButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [cButton setTag:2000+i];
        [cButton setFrame:CGRectMake(btnX, btnY, 138, 138)];
        UILabel *cLabel = [[UILabel alloc] init];
        [cLabel setSize:CGSizeMake(138, 60)];
        CGPoint center;
        center.x = cButton.center.x;
        center.y = cButton.center.y +138/2 +15;
        cLabel.center = center;
        [cLabel setTextAlignment:NSTextAlignmentCenter];
        [cLabel setFont:[UIFont fontWithName:kFontName size:15]];
        [cLabel setBackgroundColor:[UIColor clearColor]];
        cLabel.lineBreakMode = UILineBreakModeWordWrap;
        cLabel.numberOfLines = 0;
        NSString *tubiaoName;
        NSString *shebeiName = [shebeiArray objectAtIndex:i];
        NSArray *temArray = [shebeiName componentsSeparatedByString:@"_"];
        NSString *sb = [temArray objectAtIndex:0];
        NSString *labelStr;
        if ([shebeiName hasPrefix:@"W"] && [shebeiName hasSuffix:@"S"]) {
            tubiaoName = @"lssj_W_S";
            labelStr = [NSString stringWithFormat:@"水箱%@水位", sb];
        }
        if ([shebeiName hasPrefix:@"T"] && [shebeiName hasSuffix:@"S"]) {
            tubiaoName = @"lssj_T_S";
            labelStr = [NSString stringWithFormat:@"水箱%@温度", sb];
        }
        if ([shebeiName hasPrefix:@"T"] && [shebeiName hasSuffix:@"A"]) {
            tubiaoName = @"lssj_T_A";
            labelStr = [NSString stringWithFormat:@"上水管道%@温度", sb];
        }
        if ([shebeiName hasPrefix:@"T"] && [shebeiName hasSuffix:@"G"]) {
            tubiaoName = @"lssj_T_G";
            labelStr = [NSString stringWithFormat:@"水箱间管道%@温度", sb];
        }
        if ([shebeiName hasPrefix:@"T"] && [shebeiName hasSuffix:@"U"]) {
            tubiaoName = @"lssj_T_U";
            labelStr = [NSString stringWithFormat:@"用水管道%@温度", sb];
        }
        if ([shebeiName hasPrefix:@"T"] && [shebeiName hasSuffix:@"J"]) {
            tubiaoName = @"lssj_T_J";
            labelStr = [NSString stringWithFormat:@"集热器%@温度", sb];
        }
        if ([shebeiName hasPrefix:@"T"] && [shebeiName hasSuffix:@"H"]) {
            tubiaoName = @"lssj_T_H";
            labelStr = [NSString stringWithFormat:@"室内温度%@", sb];
        }
        cLabel.text = labelStr;
        [cButton setTag:(800+i)];
        int i_8 = i%8;
        [cButton setBackgroundImage:[UIImage imageNamed:[NSString stringWithFormat:@"colorBg%d", i_8]] forState:UIControlStateNormal];
        [cButton addTarget:self action:@selector(typeButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
        [cButton setImage:[UIImage imageNamed:tubiaoName] forState:UIControlStateNormal];
        [sc addSubview:cButton];
        [sc addSubview:cLabel];
        btnX += 2*gap4 + 138;
        UIImageView *shadowImageView = [[UIImageView alloc] initWithFrame:CGRectMake((138 + gap6*2)*i, cLabel.origin.y+cLabel.height-5, 188, 6)];
        shadowImageView.hidden = YES;
        [shadowImageView setTag:(1000+i)];
        [shadowImageView setImage:[UIImage imageNamed:@"shadow"]];
        [sc addSubview:shadowImageView];
    }
    [self addSubview:sc];
    
    
    [sc viewWithTag:1001].hidden = NO;
    float gap5 = 10;
    
    float scCountF = (float) scCount;
    float pointX = 160 - (scCountF/2*7/2 + (scCountF-1)/2*gap5);
    
    for (int j = 0; j<scCount; j++) {
        UIImageView *pointImgaeView = [[UIImageView alloc] initWithFrame:CGRectMake(pointX+j*(7/2+gap5), gap3+296/2+8, 7, 7)];
        [pointImgaeView setTag:(900+j)];
        if (j == 0) {
            [pointImgaeView setImage:[UIImage imageNamed:@"point_s"]];
        }
        else
        {
            [pointImgaeView setImage:[UIImage imageNamed:@"point"]];
        }
        [self addSubview:pointImgaeView];
    }

//    if ([[NSUserDefaults standardUserDefaults] objectForKey:@"isLishishujuTableShow"]) {
//        [self lnButtonClicked];
//    }
//    else{
//        [self xxtButtonClicked];
//    }
}

-(NSMutableArray *)sheibeiArrayFromresponse
{
    NSMutableArray *tempArray = [[NSMutableArray alloc] init];
    NSArray *dArray = [[NSArray alloc] init];
    dArray = [[RbtDataOfResponse sharedInstance].lishishujuGongChengLieBiaoDic objectForKey:@"d"];
    NSLog(@"aaa= %@", [RbtDataOfResponse sharedInstance].lishishujuGongChengLieBiaoDic);
    for (NSDictionary *tempDic in dArray) {
        if ([[tempDic objectForKey:@"t"] isEqualToString:@"analog"]) {
            NSString *sbName = [tempDic objectForKey:@"n"];
            if ([sbName hasPrefix:@"W"]||[sbName hasPrefix:@"T"]) {
                [tempArray addObject:sbName];
            }
        }
    }
    
    return tempArray;
    
    
}


-(void)timeButtonClicked:(UIButton *)sender
{
    int tt = sender.tag;
    weekBtn.selected = NO;
    monthBtn.selected = NO;
    yearBtn.selected = NO;
    sender.selected = YES;
    switch (sender.tag) {
        case 3000:
            chooseTime = @"day";
            break;
            
        case 3001:
            chooseTime = @"week";
            break;
            
        case 3002:
            chooseTime = @"month";
            break;
            
        default:
            break;
    }
    [self postData];
}



-(void)lnButtonClicked
{
    [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"isLishishujuTableShow"];
    lbBtn.selected = YES;
    xxtBtn.selected = NO;
    dataTabelView.hidden = NO;
    chartView.hidden = YES;
}

-(void)xxtButtonClicked
{
    [[NSUserDefaults standardUserDefaults] setBool:NO forKey:@"isLishishujuTableShow"];
    lbBtn.selected = NO;
    xxtBtn.selected = YES;
    dataTabelView.hidden = YES;
    chartView.hidden = NO;
}

#pragma tableview
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return numOfRow;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return dataTabelView.height/7;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"ProjectCell"];
    
    cell.height = dataTabelView.height/7;
    
    UIImageView *bgImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, dataTabelView.width, cell.height)];
    [bgImageView setImage:[UIImage imageNamed:@"cellBGImage"]];
    [cell addSubview:bgImageView];
    
    UIImageView *lineImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, cell.height-2, dataTabelView.width, 4)];
    [lineImageView setImage:[UIImage imageNamed:@"cellLine"]];
    [cell addSubview:lineImageView];
    
    UIImageView *imageView_clock = [[UIImageView alloc] initWithFrame:CGRectMake(30, (cell.height-20)/2, 20, 20)];
    [imageView_clock setImage:[UIImage imageNamed:@"cellClock"]];
    [cell addSubview:imageView_clock];
    
    UILabel *leftLabel = [[UILabel alloc] initWithFrame:CGRectMake(60, 0, 250, cell.frame.size.height)];
    [leftLabel setFont:[UIFont fontWithName:kFontName size:22]];
    [leftLabel setBackgroundColor:[UIColor clearColor]];
    if ([timeArray count] > 0) {
        leftLabel.text = [timeArray objectAtIndex:indexPath.row];
    }
    [cell addSubview:leftLabel];
    
    UILabel *rightLabel = [[UILabel alloc] initWithFrame:CGRectMake(dataTabelView.width-150-30, 0, 150, cell.height)];
    [rightLabel setFont:[UIFont fontWithName:kFontName size:22]];
    if ([dataArray count] > 0) {
        NSString *rightText =(NSString *)[dataArray objectAtIndex:indexPath.row];
        [rightLabel setText:[NSString stringWithFormat:@"%@%@",rightText,danw]];
    }
    [rightLabel setTextAlignment:NSTextAlignmentRight];
    [cell addSubview:rightLabel];
    
    return cell;
}

-(void)typeButtonPressed:(UIButton *)button
{
    int index = button.tag - 800;
    chooseNameTag = [NSString stringWithFormat:@"%d", index];
    chooseName = [shebeiArray objectAtIndex:index];
    for (int n = 0; n < shebeiCount; n++) {
        [sc viewWithTag:(1000+ n)].hidden = YES;
    }
    [sc viewWithTag:(1000+ index)].hidden = NO;
    [self postData];
}

-(void)timeButtonWithName:(NSString *)name
{
    NSLog(@"name === %@", name);
    
    int taggg;
    if ([name isEqualToString:@"day"]) {
        taggg = 3000;
    }
    if ([name isEqualToString:@"week"]) {
        taggg = 3001;
    }
    if ([name isEqualToString:@"month"]) {
        taggg = 3002;
    }
    
    weekBtn.selected = NO;
    monthBtn.selected = NO;
    yearBtn.selected = NO;
    
    UIButton *tmpButton = (UIButton *)[self viewWithTag:taggg];
    tmpButton.selected = YES;
    chooseTime = name;
}

-(void)typeButtonWithIndex:(NSString *)index
{
    int indexxx = [index integerValue];
    chooseName = [shebeiArray objectAtIndex:indexxx];
    for (int n = 0; n < shebeiCount; n++) {
        [sc viewWithTag:(1000+ n)].hidden = YES;
    }
    [sc viewWithTag:(1000+ indexxx)].hidden = NO;

}

-(void)postData
{
    if (!chooseName) {
        if (shebeiArray&&[shebeiArray count]>0) {
            chooseName = [shebeiArray objectAtIndex:1];
        }
        else{
            chooseName =@"T1_J";
        }
    }
    
    if (!chooseTime) {
        chooseTime = @"day";
    }
    
    timeArray = [[NSMutableArray alloc] init];
    dataArray = [[NSMutableArray alloc] init];
    xxtimeArray = [[NSMutableArray alloc] init];
    values = [[NSMutableArray alloc] init];
    RbtWebManager *webManager;
    if([RbtCommonTool getJinRuMode] != LiXianGongCheng){
        webManager = [RbtWebManager getRbtManager:YES];
    }
    else{
        webManager = [RbtWebManager getRbtManager:NO];
    }
    webManager.name = @"lishishuju2";
    webManager.delegate = self;
    [self.hud1 show:YES];
    [timeArray removeAllObjects];
    [dataArray removeAllObjects];
    [webManager gethisdataitemvalue:[RbtProjectModel sharedInstance].projectid withD:chooseName andT:chooseTime];
    
}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    if (scrollView == sc) {
        int page = scrollView.contentOffset.x/sc.width;
        for (int k = 0; k < scCount; k++) {
            UIImageView *tempImageView = (UIImageView *)[self viewWithTag:(900+k)];
            if (k == page) {
                [tempImageView setImage:[UIImage imageNamed:@"point_s"]];
            }
            else
            {
                [tempImageView setImage:[UIImage imageNamed:@"point"]];
            }
        }
    }
    else if (scrollView == dataTabelView)
    {
        NSLog(@"EndDecelerating");
    }
}

#pragma mark- request delegate
- (void)onDataLoadWithService:(RbtWebManager *)webService
                  andResponse:(NSDictionary *)responseDic
{
    NSLog(@"resdic= %@", responseDic);
    [[NSUserDefaults standardUserDefaults] setObject:chooseTime forKey:@"lishiChooseTime"];
    [[NSUserDefaults standardUserDefaults] setObject:chooseNameTag forKey:@"lishiChooseNameTag"];
    [super onDataLoadWithService:webService andResponse:responseDic];
    if ([webService.name isEqualToString:@"lishishuju2"]) {
        if ([RbtCommonTool getJinRuMode] == LiXianGongCheng) {
            [RbtDataOfResponse sharedInstance].lishishujuSheBeiShuJuDic = responseDic;
        }
        else if([RbtCommonTool getJinRuMode] == GongGGC){
            
            NSLog(@"rc=%d", [[responseDic objectForKey:@"rc"] intValue]);
            
            if ([[responseDic objectForKey:@"rc"] intValue]) {
                
                //                NSLog(@"resdic= %@", responseDic);
                NSDictionary *tempDIc = [responseDic objectForKey:@"rt"];
                //                NSLog(@"tempdic= %@", tempDIc)
                
                
                [RbtDataOfResponse sharedInstance].lishishujuSheBeiShuJuDic = tempDIc;
            }
            else
            {
                [RbtCommonTool showInfoAlert:[responseDic objectForKey:@"rd"]];
            }
        }
        
        else{
            
            //            NSLog(@"rc=%d", [[responseDic objectForKey:@"rc"] intValue]);
            if ([[responseDic objectForKey:@"rc"] intValue]) {
                
                //                NSLog(@"resdic= %@", responseDic);
                NSDictionary *tempDIc = [responseDic objectForKey:@"rt"];
                //                NSLog(@"tempdic= %@", tempDIc)
                
                
                [RbtDataOfResponse sharedInstance].lishishujuSheBeiShuJuDic = tempDIc;
            }
            else
            {
                [RbtCommonTool showInfoAlert:[responseDic objectForKey:@"rd"]];
            }
        }
    }
    
    NSString *shebei =[[RbtDataOfResponse sharedInstance].lishishujuSheBeiShuJuDic objectForKey:@"d"];
    NSArray *arr = [shebei componentsSeparatedByString:@"_"];
    if ([arr count] == 2) {
        NSString *sheb = (NSString *)[arr objectAtIndex:0];
        if ([sheb hasPrefix:@"W"]) {
            danw = @"%";
        }
        else{
            danw =@"℃";
        }
    }
    NSLog(@"ccc = %@", [RbtDataOfResponse sharedInstance].lishishujuGongChengLieBiaoDic);
    NSArray *tableDataArr = [[RbtDataOfResponse sharedInstance].lishishujuSheBeiShuJuDic objectForKey:@"v"];
    numOfRow = tableDataArr.count;
    
    for (NSArray *oD in tableDataArr) {
        NSTimeInterval timespace = [[oD objectAtIndex:0] doubleValue]/1000.0;
        NSDate *date = [NSDate dateWithTimeIntervalSince1970:timespace];
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
        NSString *strDate = [dateFormatter stringFromDate:date];
        //        NSLog(@"date = %@", strDate);
        
        double fld=[[oD objectAtIndex:1] doubleValue];
        NSString *fl = [NSString stringWithFormat:@"%.2f",fld];
        int v2 = [[oD objectAtIndex:2] intValue];
        if (v2 != 0) {
            numOfRow--;
        }
        else
        {
            [dataArray addObject:fl];
            [timeArray addObject:strDate];
        }
        [xxtimeArray addObject:strDate];
        [values addObject:fl];
    }
    if (!dataTabelView) {
        [self initViews];
    }
    [dataTabelView reloadData];
//    values = dataArray;
    [chartView reloadData];

}
#pragma mark - FYChartViewDataSource

//number of value count
- (NSInteger)numberOfValueItemCountInChartView:(FYChartView *)chartView;
{
    return values ? values.count : 0;
}

//value at index
- (float)chartView:(FYChartView *)chartView valueAtIndex:(NSInteger)index
{
    return [((NSNumber *)values[index]) floatValue];
}

//horizontal title at index
- (NSString *)chartView:(FYChartView *)chartView horizontalTitleAtIndex:(NSInteger)index
{
    
    
    if (index == 0 || index == values.count - 1)
    {
        NSString *data = [xxtimeArray objectAtIndex:index];
        NSArray *arr = [data componentsSeparatedByString:@" "];
        NSString *str = [arr objectAtIndex:0];
        return str;

    }
    
    return nil;
}

//horizontal title alignment at index
- (HorizontalTitleAlignment)chartView:(FYChartView *)chartView horizontalTitleAlignmentAtIndex:(NSInteger)index
{
    HorizontalTitleAlignment alignment = HorizontalTitleAlignmentCenter;
    if (index == 0)
    {
        alignment = HorizontalTitleAlignmentCenter;
    }
    else if (index == values.count - 1)
    {
        alignment = HorizontalTitleAlignmentRight;
    }
    
    return alignment;
}

//description view at index
- (UIView *)chartView:(FYChartView *)chartView descriptionViewAtIndex:(NSInteger)index
{
    NSString *description = [NSString stringWithFormat:@"date=%@                                                                              \nvalue=%.2f", [xxtimeArray objectAtIndex:index],
                             [((NSNumber *)values[index]) floatValue]];
    
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"chart_ description_bg"]];
    CGRect frame = imageView.frame;
    frame.size = CGSizeMake(90.0f, 40.0f);
    imageView.frame = frame;
    UILabel *label = [[UILabel alloc]
                      initWithFrame:CGRectMake(.0f, .0f, imageView.frame.size.width, imageView.frame.size.height)];
    label.text = description;
    
    NSLog(@"des = %@", description);
    label.numberOfLines = 0;
    label.font = [UIFont systemFontOfSize:10.0f];
    [imageView addSubview:label];
    
    return imageView;
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
