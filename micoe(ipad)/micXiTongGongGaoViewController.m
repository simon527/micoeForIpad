//
//  micXiTongGongGaoViewController.m
//  micoe(ipad)
//
//  Created by Simon on 14-1-20.
//  Copyright (c) 2014年 Simon. All rights reserved.
//

#import "micXiTongGongGaoViewController.h"

@interface micXiTongGongGaoViewController ()
{
    UIWebView *webView;
}

@end

@implementation micXiTongGongGaoViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = NO;
    timer =  [NSTimer scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(qiehuantu) userInfo:nil repeats:YES];
    [self setItemsFrame:self.interfaceOrientation];
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [timer invalidate];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"系统公告";
    self.scrollVc = [[UIScrollView alloc] init];
//    self.scrollVc.frame = CGRectMake(0, 0, 768, 400);
    NSArray *imageContextArray = [[[NSUserDefaults standardUserDefaults] objectForKey:@"XTGGImage"] allObjects];
    for (int i = 0; i< imageContextArray.count; i++) {
        UIImageView *imageV = [[UIImageView alloc] init];
        imageV.tag = 10000+i;
        NSData *imageData = [[NSData alloc] initWithBase64Encoding:[imageContextArray objectAtIndex:i]];
        imageV.image = [UIImage  imageWithData:imageData];
        [self.scrollVc addSubview:imageV];
    }
//    self.scrollVc.contentSize = CGSizeMake(768*6, 0);
    [self.scrollVc setShowsHorizontalScrollIndicator:NO];
    [self.scrollVc setShowsVerticalScrollIndicator:NO];
    //    scrollVc.alwaysBounceVertical =NO;
    self.scrollVc.pagingEnabled = YES;
    self.scrollVc.delegate = self;
    [self.view addSubview:self.scrollVc];
    
    pageControl = [[UIPageControl alloc] init];
//    pageControl.frame = CGRectMake(ScreenWidth/2-50, 410, 100, 30);//指定位置大小
    pageControl.pageIndicatorTintColor = [UIColor grayColor];
    pageControl.currentPageIndicatorTintColor = [UIColor blackColor];
    pageControl.numberOfPages = [imageContextArray count];//指定页面个数
    pageControl.currentPage = 0;//指定pagecontroll的值，默认选中的小白点（第一个）
    //    [pageControl addTarget:self action:@selector(changePage:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:pageControl];
    
    webView = [[UIWebView alloc] init];
    //    [webView setBackgroundColor:[UIColor grayColor]];
    webView.scalesPageToFit =YES;
    [webView loadHTMLString:self.htmlString baseURL:nil];
    [self.view addSubview:webView];
    
    
    
	// Do any additional setup after loading the view.
}

//- (void)changePage:(id)sender {
//    int page = pageControl.currentPage;//获取当前pagecontroll的值
//}

- (void)qiehuantu{
    if (pageControl.currentPage > 4) {
        pageControl.currentPage = 0;
    }
    else{
        pageControl.currentPage =pageControl.currentPage+1;
    }
    [self.scrollVc setContentOffset:CGPointMake(self.scrollVc.width*(pageControl.currentPage), 0)];
}

- (void)scrollViewDidScroll:(UIScrollView *)sender {
    int page = self.scrollVc.contentOffset.x / self.scrollVc.width;//通过滚动的偏移量来判断目前页面所对应的小白点
    pageControl.currentPage = page;//pagecontroll响应值的变化
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
        self.scrollVc.frame = CGRectMake(0, 0, 1024, 400);
        self.scrollVc.contentSize = CGSizeMake(1024*6, 0);
        pageControl.frame = CGRectMake(1024/2-50, 410, 100, 30);//指定位置大小
        for (UIView *subView in [self.scrollVc subviews]) {
            if ([subView isKindOfClass:[UIImageView class]]) {
                subView.frame = CGRectMake(1024*(subView.tag - 10000), 64, 1024, 400);
            }
        }
        webView.frame = CGRectMake(0, 440, 1024, 768-440);

    }
    else
    {
        self.scrollVc.frame = CGRectMake(0, 0, 768, 400);
        self.scrollVc.contentSize = CGSizeMake(768*6, 0);
        pageControl.frame = CGRectMake(768/2-50, 410, 100, 30);//指定位置大小
        for (UIView *subView in [self.scrollVc subviews]) {
            if ([subView isKindOfClass:[UIImageView class]]) {
                subView.frame = CGRectMake(768*(subView.tag - 10000), 64, 768, 400);
            }
        }
        webView.frame = CGRectMake(0, 440, 768, 1024-440);
    }
    
}

@end
