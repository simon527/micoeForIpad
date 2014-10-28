//
//  micShiShiShuJuView_h.m
//  micoe(ipad)
//
//  Created by Simon on 14-5-12.
//  Copyright (c) 2014年 Simon. All rights reserved.
//

#import "micShiShiShuJuView_h.h"
#import "RbtDataOfResponse.h"

@implementation micShiShiShuJuView_h

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        //        self.backgroundColor = [UIColor redColor];
        
        UIImageView *bgImageView = [[UIImageView alloc] initWithFrame:CGRectMake(8, 0, 1008, 973/2)];
        [bgImageView setImage:[UIImage imageNamed:@"sssj_bg_h"]];
        [self addSubview:bgImageView];
        
        UILabel *timeLabel = [[UILabel alloc] initWithFrame:CGRectMake((1024-300)/2, 4, 300, 40)];
        [timeLabel setTextAlignment:NSTextAlignmentCenter];
        [timeLabel setTextColor:[UIColor grayColor]];
        NSString* date;
        NSDateFormatter* formatter = [[NSDateFormatter alloc]init];
        [formatter setDateFormat:@"YYYY年MM月dd日hh:mm"];
        date = [formatter stringFromDate:[NSDate date]];
        timeLabel.text = date;
        [self addSubview:timeLabel];
        
        NSDictionary *dic = [RbtDataOfResponse sharedInstance].yuanlituDic;
        
        W_SArray = [[NSMutableArray alloc] init];
        
        T_JArray = [[NSMutableArray alloc] init];
        
        T_SArray = [[NSMutableArray alloc] init];
        
        T_UArray = [[NSMutableArray alloc] init];
        
        T_AArray = [[NSMutableArray alloc] init];
        
        T_GArray = [[NSMutableArray alloc] init];
        
        E_EArray = [[NSMutableArray alloc] init];
        
        P_PArray = [[NSMutableArray alloc] init];
        
        EH_EHArray = [[NSMutableArray alloc] init];
        
        DDF_EArray = [[NSMutableArray alloc] init];
        
        T_HArray = [[NSMutableArray alloc] init];
        
        yltName = [dic objectForKey:@"t"];
        
        dataDic = [dic objectForKey:@"d"];
        
        
        imageWidth = 131;
        imageHeight = 131;
        
        gap1 = (self.width -10 - imageWidth*6)/12;
        gap2 = (self.height - 80 - imageHeight*2 - 20)/3 + 20;
        imageX = gap1;
        imageY = 30;
        
        int dataCount = 0;
        
        
        for(NSDictionary *tempDic in dataDic)
        {
            NSString *shebeiName = [tempDic objectForKey:@"n"];
            NSRange range = [shebeiName rangeOfString:@"_"];
            
            
            if (range.location != NSNotFound) {
                
                NSArray *nameArray = [shebeiName componentsSeparatedByString:@"_"];
                NSString *danweiType = [nameArray objectAtIndex:0];
                NSString *shebeiType = [nameArray objectAtIndex:1];
                if ([danweiType hasPrefix:@"W"] && [shebeiType isEqualToString:@"S"]) {
                    [W_SArray addObject:tempDic];
                    dataCount++;
                }
                if ([danweiType hasPrefix:@"T"] && [shebeiType isEqualToString:@"J"]) {
                    [T_JArray addObject:tempDic];
                    dataCount++;
                }
                if ([danweiType hasPrefix:@"T"] && [shebeiType isEqualToString:@"S"]) {
                    [T_SArray addObject:tempDic];
                    dataCount++;
                }
                if ([danweiType hasPrefix:@"T"] && [shebeiType isEqualToString:@"U"]) {
                    [T_UArray addObject:tempDic];
                    dataCount++;
                }
                if ([danweiType hasPrefix:@"T"] && [shebeiType isEqualToString:@"A"]) {
                    [T_AArray addObject:tempDic];
                    dataCount++;
                }
                if ([danweiType hasPrefix:@"T"] && [shebeiType isEqualToString:@"G"]) {
                    [T_GArray addObject:tempDic];
                    dataCount++;
                }
                if ([danweiType hasPrefix:@"E"] && [shebeiType isEqualToString:@"E"]) {
                    [E_EArray addObject:tempDic];
                    dataCount++;
                }
                if ([danweiType hasPrefix:@"P"] && [shebeiType isEqualToString:@"P"]) {
                    [P_PArray addObject:tempDic];
                    dataCount++;
                }
                
                if ([danweiType hasPrefix:@"EH"] && [shebeiType isEqualToString:@"EH"]) {
                    [EH_EHArray addObject:tempDic];
                    dataCount++;
                }
                if ([danweiType hasPrefix:@"DDF"] && [shebeiType isEqualToString:@"F"]) {
                    [DDF_EArray addObject:tempDic];
                    dataCount++;
                }
                if ([danweiType hasPrefix:@"T"] && [shebeiType isEqualToString:@"H"]) {
                    [T_HArray addObject:tempDic];
                    dataCount++;
                }
            }
        }
        int screenCount = dataCount/12?(dataCount/12+1):(dataCount%12 == 0);
        
        sc = [[UIScrollView alloc] initWithFrame:CGRectMake(5, 30, self.width-10, self.height-60)];
        
        pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(0, self.height-60, self.width, 40)];
        pageControl.pageIndicatorTintColor = [UIColor grayColor];
        pageControl.currentPageIndicatorTintColor = [UIColor blackColor];
        pageControl.numberOfPages = screenCount;//指定页面个数
        pageControl.currentPage = 0;//指定pagecontroll的值，默认选中的小白点（第一个）
        
        [sc setContentSize:CGSizeMake((self.width-10)*screenCount, sc.height)];
        
        sc.delegate = self;
        
        sc.showsHorizontalScrollIndicator = NO;
        sc.showsVerticalScrollIndicator = NO;
        
        //    sc.alwaysBounceVertical = NO;
        
        sc.pagingEnabled = YES;
        
        [self addSubview:sc];
        [self addSubview:pageControl];
        
        
        [self arrangeImageByArray:W_SArray withtag:1];
        [self arrangeImageByArray:T_JArray withtag:2];
        [self arrangeImageByArray:T_SArray withtag:3];
        [self arrangeImageByArray:T_UArray withtag:4];
        [self arrangeImageByArray:T_AArray withtag:5];
        [self arrangeImageByArray:T_GArray withtag:6];
        [self arrangeImageByArray:E_EArray withtag:7];
        [self arrangeImageByArray:P_PArray withtag:8];
        [self arrangeImageByArray:EH_EHArray withtag:9];
        [self arrangeImageByArray:DDF_EArray withtag:10 ];
        [self arrangeImageByArray:T_HArray withtag:11];
        
//        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(fresh) name:@"yuanlituDicGet" object:nil];
        
    }
    return self;
}

- (void)scrollViewDidScroll:(UIScrollView *)sender {
    int page = sc.contentOffset.x / sc.width;//通过滚动的偏移量来判断目前页面所对应的小白点
    pageControl.currentPage = page;//pagecontroll响应值的变化
}

-(void)fresh
{
    for (UIView *obj in [sc subviews]) {
        [obj removeFromSuperview];
    }
    
    W_SArray = [[NSMutableArray alloc] init];
    
    T_JArray = [[NSMutableArray alloc] init];
    
    T_SArray = [[NSMutableArray alloc] init];
    
    T_UArray = [[NSMutableArray alloc] init];
    
    T_AArray = [[NSMutableArray alloc] init];
    
    T_GArray = [[NSMutableArray alloc] init];
    
    E_EArray = [[NSMutableArray alloc] init];
    
    P_PArray = [[NSMutableArray alloc] init];
    
    EH_EHArray = [[NSMutableArray alloc] init];
    
    DDF_EArray = [[NSMutableArray alloc] init];
    
    T_HArray = [[NSMutableArray alloc] init];

    
    NSDictionary *dic = [RbtDataOfResponse sharedInstance].yuanlituDic;
    dataDic = [dic objectForKey:@"d"];
    for(NSDictionary *tempDic in dataDic)
    {
        NSString *shebeiName = [tempDic objectForKey:@"n"];
        NSRange range = [shebeiName rangeOfString:@"_"];
        
        
        if (range.location != NSNotFound) {
            
            NSArray *nameArray = [shebeiName componentsSeparatedByString:@"_"];
            NSString *danweiType = [nameArray objectAtIndex:0];
            NSString *shebeiType = [nameArray objectAtIndex:1];
            if ([danweiType hasPrefix:@"W"] && [shebeiType isEqualToString:@"S"]) {
                [W_SArray addObject:tempDic];
            }
            if ([danweiType hasPrefix:@"T"] && [shebeiType isEqualToString:@"J"]) {
                [T_JArray addObject:tempDic];
            }
            if ([danweiType hasPrefix:@"T"] && [shebeiType isEqualToString:@"S"]) {
                [T_SArray addObject:tempDic];
            }
            if ([danweiType hasPrefix:@"T"] && [shebeiType isEqualToString:@"U"]) {
                [T_UArray addObject:tempDic];
            }
            if ([danweiType hasPrefix:@"T"] && [shebeiType isEqualToString:@"A"]) {
                [T_AArray addObject:tempDic];
            }
            if ([danweiType hasPrefix:@"T"] && [shebeiType isEqualToString:@"G"]) {
                [T_GArray addObject:tempDic];
            }
            if ([danweiType hasPrefix:@"E"] && [shebeiType isEqualToString:@"E"]) {
                [E_EArray addObject:tempDic];
            }
            if ([danweiType hasPrefix:@"P"] && [shebeiType isEqualToString:@"P"]) {
                [P_PArray addObject:tempDic];
            }
            
            if ([danweiType hasPrefix:@"EH"] && [shebeiType isEqualToString:@"EH"]) {
                [EH_EHArray addObject:tempDic];
            }
            if ([danweiType hasPrefix:@"DDF"] && [shebeiType isEqualToString:@"F"]) {
                [DDF_EArray addObject:tempDic];
            }
            if ([danweiType hasPrefix:@"T"] && [shebeiType isEqualToString:@"H"]) {
                [T_HArray addObject:tempDic];
            }
        }
    }
    
    imageX = (self.width -10 - imageWidth*6)/12;;
    imageY = 30;

    
    [self arrangeImageByArray:W_SArray withtag:1];
    [self arrangeImageByArray:T_JArray withtag:2];
    [self arrangeImageByArray:T_SArray withtag:3];
    [self arrangeImageByArray:T_UArray withtag:4];
    [self arrangeImageByArray:T_AArray withtag:5];
    [self arrangeImageByArray:T_GArray withtag:6];
    [self arrangeImageByArray:E_EArray withtag:7];
    [self arrangeImageByArray:P_PArray withtag:8];
    [self arrangeImageByArray:EH_EHArray withtag:9];
    [self arrangeImageByArray:DDF_EArray withtag:10];
    [self arrangeImageByArray:T_HArray withtag:11];
    
}



-(void)arrangeImageByArray:(NSMutableArray *)array withtag:(NSInteger)imageTag
{
    
    NSString *tubiaoImageName;
    
    NSString *titleName;
    
    switch (imageTag) {
        case 1:
            tubiaoImageName = @"W_S";
            titleName = @"水箱";
            break;
            
        case 2:
            tubiaoImageName = @"T_J";
            titleName = @"集热器";
            break;
            
        case 3:
            tubiaoImageName = @"T_S";
            titleName = @"水箱";
            break;
            
        case 4:
            tubiaoImageName = @"T_U";
            titleName = @"用水管道";
            break;
            
        case 5:
            tubiaoImageName = @"T_A";
            titleName = @"上水管道";
            break;
            
        case 6:
            tubiaoImageName = @"T_G";
            titleName = @"水箱间管道";
            break;
            
        case 7:
            tubiaoImageName = @"E_E";
            titleName = @"电磁阀";
            break;
            
        case 8:
            tubiaoImageName = @"P_P";
            titleName = @"循环泵";
            break;
            
        case 9:
            tubiaoImageName = @"EH_EH";
            titleName = @"电加热";
            break;
            
        case 10:
            tubiaoImageName = @"DDF_E";
            titleName = @"电动阀";
            break;
            
        case 11:
            tubiaoImageName = @"T_H";
            titleName = @"室内盘管";
            break;
            
        default:
            break;
    }
    
    
    if (array.count) {
        for (NSDictionary *dic in array) {
            NSString *shebei = [dic objectForKey:@"n"];
            
            NSArray *nameArray = [shebei componentsSeparatedByString:@"_"];
            
            NSString *shebeiName = [nameArray objectAtIndex:0];
            
            NSString *lastStr;
            NSString *danwei;
            if ([shebeiName hasPrefix:@"W"]) {
                lastStr = @"水位";
                danwei = @"%";
            }
            else if([shebeiName hasPrefix:@"T"])
            {
                lastStr = @"温度";
                danwei = @"℃";
            }
            else
            {
                lastStr = @"开关";
                danwei = @"";
            }
            
            UIImageView *tubiaoImageView = [[UIImageView alloc] initWithFrame:CGRectMake(imageX, imageY, imageWidth, imageHeight)];
//            NSLog(@"x=%f, y = %f", imageX, imageY);
            
            [tubiaoImageView setImage:[UIImage imageNamed:tubiaoImageName]];
            
            UILabel *titleLabel = [[UILabel alloc] init];
            UILabel *dataLabel = [[UILabel alloc] init];
            
            float labelHeight = 30;
            
            
            
            [titleLabel setSize:CGSizeMake(imageWidth, labelHeight)];
            CGPoint tempCenter;
            tempCenter.x = tubiaoImageView.center.x;
            tempCenter.y = tubiaoImageView.center.y + imageHeight/2 + labelHeight/2;
            
//            NSLog(@"x=%f, y = %f", tempCenter.x, tempCenter.y);
            
            
            titleLabel.center = tempCenter;
            titleLabel.text = [NSString stringWithFormat:@"%@%@", titleName, lastStr];
            [titleLabel setTextAlignment:NSTextAlignmentCenter];
            //            [titleLabel setTextColor:[UIColor whiteColor]];
            
            [dataLabel setSize:CGSizeMake(imageWidth, labelHeight)];
            CGPoint tempCenter1;
            tempCenter1.x = tubiaoImageView.center.x;
            tempCenter1.y = tubiaoImageView.center.y + imageHeight/2 + labelHeight*3/2;
            dataLabel.center = tempCenter1;
            NSString *v = [dic objectForKey:@"v"];
            NSString *zhuangtai;
            
            if ([lastStr isEqualToString:@"状态"]) {
                zhuangtai = [v intValue]?@"开":@"关";
            }
            else
            {
                zhuangtai = v;
            }
            dataLabel.text = [NSString stringWithFormat:@"%@:%@ %@", shebei, zhuangtai, danwei];
            [dataLabel setTextAlignment:NSTextAlignmentCenter];
            //            [titleLabel setFont:[UIFont fontWithName:kFontName size:kSize]];
            //            [dataLabel setTextColor:[UIColor whiteColor]];
            
            [sc addSubview:tubiaoImageView];
            [sc addSubview:titleLabel];
            [sc addSubview:dataLabel];
            imageIndex++;
            imageX += imageWidth + gap1*2;
            int j = imageIndex/12;
            if ((imageIndex%6 == 0) && (imageIndex%12 != 0) ) {
                imageX = (self.width -10 - imageWidth*6)/12 + sc.width*j;
                imageY += imageHeight + gap2;
            }
            else if (imageIndex%12 == 0) {
                imageY = 30;
                imageX = (self.width -10 - imageWidth*6)/12 + sc.width*j;
            }
        }
        
    }
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
