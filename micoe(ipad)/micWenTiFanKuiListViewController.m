//
//  micWenTiFanKuiListViewController.m
//  micoe(ipad)
//
//  Created by Simon on 14-1-20.
//  Copyright (c) 2014年 Simon. All rights reserved.
//

#import "micWenTiFanKuiListViewController.h"
#import "RbtWenTiModel.h"
#import "GTMBase64.h"

@interface micWenTiFanKuiListViewController ()

@end

@implementation micWenTiFanKuiListViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    self.title = @"问题反馈列表";
    self.arr_cellDetail = [[NSMutableArray alloc] init];
    for (RbtWenTiModel *oneModel in self.arr_wenTiList) {
        UIView *celldetailView = [[UIView alloc] init];
        int detailViewHeight = 0;
        UILabel *lab_q = [[UILabel alloc] init];
        lab_q.font = [UIFont fontWithName:kFontName size:12];
        lab_q.text = [NSString stringWithFormat:@"问题描述：%@",oneModel.q];
        //        lab_q.backgroundColor = [UIColor blueColor];
        lab_q.numberOfLines = 0;
        CGSize size_q = [lab_q.text sizeWithFont:lab_q.font constrainedToSize:CGSizeMake(310, MAXFLOAT)  lineBreakMode:lab_q.lineBreakMode];
        lab_q.frame = CGRectMake(20, 0, 310, size_q.height);
        detailViewHeight =detailViewHeight+ size_q.height;
        
        [celldetailView addSubview:lab_q];
        if ([oneModel.r isEqualToString:@"1"]) {
            UILabel *lab_p = [[UILabel alloc] init];
            lab_p.font = [UIFont fontWithName:kFontName size:12];
            lab_p.text = [NSString stringWithFormat:@"解决人：%@",oneModel.p];
            //            lab_p.backgroundColor = [UIColor redColor];
            lab_p.numberOfLines = 0;
            CGSize size_p = [lab_p.text sizeWithFont:lab_p.font constrainedToSize:CGSizeMake(310, MAXFLOAT)  lineBreakMode:lab_p.lineBreakMode];
            lab_p.frame = CGRectMake(20, detailViewHeight+7, 310, size_p.height);
            detailViewHeight = detailViewHeight+7+size_p.height;
            [celldetailView addSubview:lab_p];
            
            UILabel *lab_m = [[UILabel alloc] init];
            lab_m.font = [UIFont fontWithName:kFontName size:12];
            lab_m.text = [NSString stringWithFormat:@"解决方法：%@",oneModel.m];
            //            lab_m.backgroundColor = [UIColor greenColor];
            lab_m.numberOfLines = 0;
            CGSize size_m = [lab_m.text sizeWithFont:lab_m.font constrainedToSize:CGSizeMake(310, MAXFLOAT)  lineBreakMode:lab_m.lineBreakMode];
            lab_m.frame = CGRectMake(20, detailViewHeight+7, 310, size_m.height);
            detailViewHeight = detailViewHeight+7+size_m.height;
            
            lab_m.frame = CGRectMake(20, 40, 310, 20);
            [celldetailView addSubview:lab_m];
        }
        if (oneModel.i) {
            NSData *imageData = [self changeImageStrToData:oneModel.i];
            UIImage *image = [UIImage imageWithData:imageData];
            UIImageView *imageV = [[UIImageView alloc] initWithImage:image];
            imageV.frame = CGRectMake((ScreenWidth-imageV.width)/2, detailViewHeight+7, imageV.width, imageV.height);
            detailViewHeight = detailViewHeight+7+imageV.height;
            [celldetailView addSubview:imageV];
        }
        celldetailView.frame = CGRectMake(0, 0, 320, detailViewHeight+5);
        [self.arr_cellDetail addObject:celldetailView];
    }
    
    self.mTableView = [[TQMultistageTableView alloc] initWithFrame:CGRectMake(0, 34, 1024,768-49-64)];
    self.mTableView.delegate = self;
    self.mTableView.dataSource = self;
    
    [self.view addSubview:self.mTableView];
    [self setItemsFrame:self.interfaceOrientation];

}

#pragma mark - TQTableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(TQMultistageTableView *)tableView
{
    return [self.arr_wenTiList count];
}

- (NSInteger)mTableView:(TQMultistageTableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (UITableViewCell *)mTableView:(TQMultistageTableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"TQMultistageTableViewCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    //    if (cell == nil)
    //    {
    cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    //    }
    //-------debug-------
    UIView *cellDetailView =[self.arr_cellDetail objectAtIndex:[indexPath section]];
    [cell.contentView  addSubview:cellDetailView];
    UIView *view = [[UIView alloc] initWithFrame:cell.bounds] ;
    view.backgroundColor = [UIColor whiteColor];
    cell.backgroundView = view;
    
    return cell;
}

- (UIView *)mTableView:(TQMultistageTableView *)tableView openCellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.bounds.size.width, 100)];
    view.backgroundColor = [UIColor colorWithRed:187/255.0 green:206/255.0 blue:190/255.0 alpha:1];
    return nil;
}

#pragma mark - Table view delegate

- (CGFloat)mTableView:(TQMultistageTableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UIView *view = [self.arr_cellDetail objectAtIndex:[indexPath section]];
    return view.height;
}

- (CGFloat)mTableView:(TQMultistageTableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 50;
}

- (CGFloat)mTableView:(TQMultistageTableView *)tableView heightForOpenCellAtIndexPath:(NSIndexPath *)indexPath
{
    return 0;
}

- (UIView *)mTableView:(TQMultistageTableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView * control = [[UIView alloc] init];
    control.backgroundColor = [UIColor whiteColor];
    
    UIImageView *bgImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"wtfklist_cellbg"]];
    bgImage.frame = CGRectMake(5, 0, 310, 48);
    [control addSubview:bgImage];
    
    //    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 48, tableView.frame.size.width, 2)];
    //    view.backgroundColor = [UIColor blackColor];
    //    [control addSubview:view];
    RbtWenTiModel *oneModel =(RbtWenTiModel *)[self.arr_wenTiList objectAtIndex:section];
    
    UILabel *label = [[UILabel alloc] init];
    label.text = [NSString stringWithFormat:@"%@",oneModel.n];
    label.textColor = [UIColor blackColor];
    label.font = [UIFont fontWithName:kFontName size:16];
    label.frame = CGRectMake(20, 0, 200, 40);
    [control addSubview:label];
    
    UILabel *label2 = [[UILabel alloc] init];
    
    
    NSTimeInterval timespace = [oneModel.t doubleValue]/1000.0;
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:timespace];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    NSString *strDate = [dateFormatter stringFromDate:date];
    
    NSString *jiejue;
    if ([oneModel.r isEqualToString:@"1"]) {
        jiejue = @"解决";
    }
    else{
        jiejue = @"未解决";
    }
    
    NSString *label2String = [strDate stringByAppendingString:[NSString stringWithFormat:@" ｜ 状态:%@",jiejue]];
    label2.text = [NSString stringWithFormat:@"%@",label2String];
    label2.textColor = [UIColor darkGrayColor];
    label2.font = [UIFont fontWithName:kFontName size:10];
    label2.frame = CGRectMake(20, 30, 200, 20);
    [control addSubview:label2];
    
    UILabel *label3 = [[UILabel alloc] init];
    NSString *label3String = @"详情";
    label3.text = [NSString stringWithFormat:@"%@",label3String];
    label3.textColor = [UIColor colorWithRed:71/255.0 green:190/255.0 blue:184/255.0 alpha:1];
    label3.font = [UIFont fontWithName:kFontName size:15];
    label3.frame = CGRectMake(ScreenWidth-60, 10, 60, 30);
    [control addSubview:label3];
    
    //    UIButton *buttonXia = [UIButton buttonWithType:UIButtonTypeCustom];
    //    [buttonXia setImage:[UIImage imageNamed:@"wtfklist_xiaLa"] forState:UIControlStateNormal];
    //    buttonXia.frame = CGRectMake(285, 10, 30, 30);
    //    [control addSubview:buttonXia];
    
    return control;
}

- (void)mTableView:(TQMultistageTableView *)tableView didSelectHeaderAtSection:(NSInteger)section
{
    NSLog(@"headerClick%d",section);
}

//celll点击
- (void)mTableView:(TQMultistageTableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"cellClick%@",indexPath);
}

//header展开
- (void)mTableView:(TQMultistageTableView *)tableView willOpenHeaderAtSection:(NSInteger)section
{
    NSLog(@"headerOpen%d",section);
}

//header关闭
- (void)mTableView:(TQMultistageTableView *)tableView willCloseHeaderAtSection:(NSInteger)section
{
    NSLog(@"headerClose%d",section);
}

- (void)mTableView:(TQMultistageTableView *)tableView willOpenCellAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"OpenCell%@",indexPath);
}

- (void)mTableView:(TQMultistageTableView *)tableView willCloseCellAtIndexPath:(NSIndexPath *)indexPath;
{
    NSLog(@"CloseCell%@",indexPath);
}

#pragma mark- base64
- (NSString *)changeImageToStirng:(UIImage *)image{
    NSData *imageData = UIImageJPEGRepresentation(image, 1.0);
    imageData = [GTMBase64 encodeData:imageData];
    NSString *imageString = [[NSString alloc] initWithData:imageData encoding:NSUTF8StringEncoding];
    return imageString;
}

- (NSData *)changeImageStrToData:(NSString *)imageStr{
    NSData *stringData = [imageStr dataUsingEncoding:NSUTF8StringEncoding];
    const void *bytes = [stringData bytes];
    NSData *imagedata = [GTMBase64 decodeBytes:bytes length:[stringData length]];
    return imagedata;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
        self.mTableView.frame = CGRectMake(0, 34, 1024,768-49-64);
    }
    else
    {
         self.mTableView.frame = CGRectMake(0, 34, 768,1024-49-64);
    }
    
}

@end
