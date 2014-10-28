//
//  micWenTiFanKuiViewController.m
//  micoe(ipad)
//
//  Created by Simon on 13-12-26.
//  Copyright (c) 2013年 Simon. All rights reserved.
//

#import "micWenTiFanKuiViewController.h"
#import "micWenTiFanKuiListViewController.h"
#import <AssetsLibrary/AssetsLibrary.h>
#import <MobileCoreServices/MobileCoreServices.h>
#import "GTMBase64.h"
#import "RbtWenTiModel.h"

@interface micWenTiFanKuiViewController ()
{
    UIImage *bigbg;
    UIImageView *bigbgview;
    UIImageView *cellImagebgView;
    UILabel *lab1 ;
    UILabel *userName;
    UIButton *cellaccBtn;
    UILabel *lab2;
    UIButton *uploadImagebtn;
    UIButton *uploadbtn;
}

@end

@implementation micWenTiFanKuiViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
//    self.view.backgroundColor = [UIColor redColor];
    
    bigbg = [UIImage imageNamed:@"wtfk_bigbg"];
    bigbgview = [[UIImageView alloc] initWithImage:bigbg];
//    bigbgview.frame = CGRectMake(20, 175, 727, 458);
    [self.view addSubview:bigbgview];
    
    if ([[RbtUserModel sharedInstance].wtfk isEqualToString:@"n"]) {
        
    }
    else{
        UIImage *cellImagebg = [UIImage imageNamed:@"wtfk_cellbg"];
        cellImagebgView = [[UIImageView alloc] initWithImage:cellImagebg];
//        cellImagebgView.frame = CGRectMake(20, 90, 727, 63);
        [self.view addSubview:cellImagebgView];
        
        lab1 = [[UILabel alloc] init];
        [lab1 setFont:[UIFont fontWithName:kFontName size:20]];
        lab1.text = @"问题反馈列表";
        [self.view addSubview:lab1];
        
        userName = [[UILabel alloc] init];
        [userName setFont:[UIFont fontWithName:kFontName size:20]];
        userName.textAlignment = NSTextAlignmentRight;
        userName.text = [RbtUserModel sharedInstance].userName;
        [self.view addSubview:userName];
        
        cellaccBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [cellaccBtn setBackgroundImage:[UIImage imageNamed:@"wtfk_cellaccbtn"] forState:UIControlStateNormal];
//        cellaccBtn.frame = CGRectMake(680, 96, 55, 51);
        [cellaccBtn addTarget:self action:@selector(cellaccBtnPressed) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:cellaccBtn];
    }
    
//    UIImage *cellImagebg2 = [UIImage imageNamed:@"wtfk_cellbg"];
//    UIImageView *cellImagebgView2 = [[UIImageView alloc] initWithImage:cellImagebg2];
//    cellImagebgView2.frame = CGRectMake(6, 114, 307, 40);
//    [self.view addSubview:cellImagebgView2];
    
    lab2 = [[UILabel alloc] init];
    [lab2 setFont:[UIFont fontWithName:kFontName size:20]];
    lab2.text = @"输入问题描述";
    [self.view addSubview:lab2];
    
    uploadImagebtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [uploadImagebtn setBackgroundImage:[UIImage imageNamed:@"wtfk_uploadImagebtn"] forState:UIControlStateNormal];
//    uploadImagebtn.frame = CGRectMake(696, 189, 35, 35);
    [uploadImagebtn addTarget:self action:@selector(uploadimageBtnPressed) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:uploadImagebtn];
    

//#ifdef __IPHONE_7_0
//    self.textF_wenti = [[UITextView alloc] initWithFrame:CGRectMake(20, 238, 727, 395) textContainer:nil];
//#else  
//    self.textF_wenti = [[UITextView alloc] initWithFrame:CGRectMake(20, 238, 727, 395)];
//#endif
    
    
//    self.textF_wenti = [[UITextView alloc] initWithFrame:CGRectMake(20, 238, 727, 395) textContainer:nil];
    self.textF_wenti = [[UITextView alloc] init];
    self.textF_wenti.delegate = self;
    self.textF_wenti.backgroundColor = [UIColor colorWithRed:250.0/255.0 green:250.0/255.0  blue:250.0/255.0  alpha:1];
    [self.textF_wenti setFont:[UIFont systemFontOfSize:20]];
    [self.view addSubview:self.textF_wenti];
    
    
    uploadbtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [uploadbtn setBackgroundImage:[UIImage imageNamed:@"wtfk_upload"] forState:UIControlStateNormal];
//    uploadbtn.frame = CGRectMake(252, 175+458-40-25, 264, 40);
    [uploadbtn addTarget:self action:@selector(uploadbtnPressed) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:uploadbtn];
    
    if ([[RbtUserModel sharedInstance].wtfk isEqualToString:@"n"]) {
//        cellImagebgView2.frame = CGRectMake(6, 114-45, 307, 40);
//        lab2.frame = CGRectMake(10, 105-45, 100, 60);
//        uploadImagebtn.frame = CGRectMake(270, 115-45, 35, 35);
//        self.textF_wenti.frame = CGRectMake(6, 150-45, 307, ScreenHeight-216-20-150+45);
    }
    
    [self setItemsFrame:self.interfaceOrientation];
    
}

#pragma mark- actions
- (void)uploadbtnPressed{
    
    if ([[RbtUserModel sharedInstance].wtfk isEqualToString:@"w"] || [[RbtUserModel sharedInstance].wtfk isEqualToString:@"rw"]) {
        [self.hud1 show:YES];
        RbtWebManager *geDiGongCengWebManager = [RbtWebManager getRbtManager:YES];
        geDiGongCengWebManager.name =@"uploadwtfkweb";
        geDiGongCengWebManager.delegate = self;
        if (!self.i) {
            self.i = @"";
        }
        
        [geDiGongCengWebManager commitquestion:[RbtUserModel sharedInstance].userName withP:[RbtProjectModel sharedInstance].projectid WithQ:self.textF_wenti.text AndI:self.i];
        
    }
    else
    {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:nil message:@"无权限" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alertView show];
    }
    
    
   }

- (void)uploadimageBtnPressed{
    if ([[RbtUserModel sharedInstance].wtfk isEqualToString:@"w"] || [[RbtUserModel sharedInstance].wtfk isEqualToString:@"rw"]) {
        if ([self isPhotoLibraryAvailable]){
            UIImagePickerController *controller = [[UIImagePickerController alloc] init];
            controller.sourceType =  UIImagePickerControllerSourceTypePhotoLibrary;
            NSMutableArray *mediaTypes = [[NSMutableArray alloc] init];
            if ([self canUserPickPhotosFromPhotoLibrary]){
                [mediaTypes addObject:(__bridge NSString *)kUTTypeImage]; }
            if ([self canUserPickVideosFromPhotoLibrary]){
                [mediaTypes addObject:(__bridge NSString *)kUTTypeMovie];
            }
            controller.mediaTypes = mediaTypes;
            controller.delegate = self;
            UIViewController *vc = [self viewController];
            [vc.navigationController presentViewController:controller animated:YES completion:nil];
        }

    }
    else
    {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:nil message:@"无权限" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alertView show];
    }
    
  }


- (void)cellaccBtnPressed{
    
    if ([[RbtUserModel sharedInstance].wtfk isEqualToString:@"r"] || [[RbtUserModel sharedInstance].wtfk isEqualToString:@"rw"]) {
        [self.hud1 show:YES];
        RbtWebManager *geDiGongCengWebManager = [RbtWebManager getRbtManager:YES];
        geDiGongCengWebManager.name =@"wtfklistweb";
        geDiGongCengWebManager.delegate = self;
        [geDiGongCengWebManager getquestionWith:[RbtUserModel sharedInstance].userName];

        
    }
    else
    {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:nil message:@"无权限" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alertView show];
    }
    
    
 }

-(BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    if ([text isEqualToString:@"\n"]) {
        [textView resignFirstResponder];
        return NO;
    }
    return YES;
}

#pragma mark- request delegate
- (void)onDataLoadWithService:(RbtWebManager *)webService
                  andResponse:(NSDictionary *)responseDic
{
    [super onDataLoadWithService:webService andResponse:responseDic];
    if ([webService.name isEqualToString:@"uploadwtfkweb"]) {
        if ([[responseDic objectForKey:@"rc"] isEqualToString:@"1"]) {
            [RbtCommonTool showInfoAlert:@"上传问题成功"];
        }
        else{
            [RbtCommonTool showInfoAlert:[NSString stringWithFormat:@"%@",[responseDic objectForKey:@"rd"]]];
        }
    }
    else if([webService.name isEqualToString:@"wtfklistweb"]) {
        if ([[responseDic objectForKey:@"rc"] isEqualToString:@"1"]) {
            NSArray *arr = [responseDic objectForKey:@"rt"];
            NSMutableArray *arrList = [[NSMutableArray alloc] init];
            for (NSDictionary *dic in arr) {
                RbtWenTiModel *oneModel = [[RbtWenTiModel alloc] init];
                oneModel.n =  [dic objectForKey:@"n"];
                oneModel.q =  [dic objectForKey:@"q"];
                oneModel.i =  [dic objectForKey:@"i"];
                oneModel.t =  [dic objectForKey:@"t"];
                oneModel.r =  [dic objectForKey:@"r"];
                oneModel.p =  [dic objectForKey:@"p"];
                oneModel.m =  [dic objectForKey:@"m"];
                [arrList addObject:oneModel];
            }
            micWenTiFanKuiListViewController *wtfk_listView = [[micWenTiFanKuiListViewController alloc] init];
            wtfk_listView.arr_wenTiList = arrList;
            [[self viewController].navigationController pushViewController:wtfk_listView animated:YES];
        }
        else{
            [RbtCommonTool showInfoAlert:[NSString stringWithFormat:@"%@",[responseDic objectForKey:@"rd"]]];
        }
    }
}

#pragma mark- PhotoLibrary

- (BOOL) cameraSupportsMedia:(NSString *)paramMediaType
                  sourceType:(UIImagePickerControllerSourceType)paramSourceType{
    
    __block BOOL result = NO;
    
    if ([paramMediaType length] == 0){
        NSLog(@"Media type is empty.");
        return NO;
    }
    
    NSArray *availableMediaTypes =
    [UIImagePickerController availableMediaTypesForSourceType:paramSourceType];
    
    [availableMediaTypes enumerateObjectsUsingBlock:
     ^(id obj, NSUInteger idx, BOOL *stop) {
         
         NSString *mediaType = (NSString *)obj;
         if ([mediaType isEqualToString:paramMediaType]){
             result = YES;
             *stop= YES;
         }
         
     }];
    return result;
}

- (BOOL) isPhotoLibraryAvailable{
    return [UIImagePickerController isSourceTypeAvailable: UIImagePickerControllerSourceTypePhotoLibrary];
}
- (BOOL) canUserPickVideosFromPhotoLibrary{
    return [self
            cameraSupportsMedia:(__bridge NSString *)kUTTypeMovie sourceType:UIImagePickerControllerSourceTypePhotoLibrary];
}
- (BOOL) canUserPickPhotosFromPhotoLibrary{
    return [self
            cameraSupportsMedia:(__bridge NSString *)kUTTypeImage sourceType:UIImagePickerControllerSourceTypePhotoLibrary];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info{
    UIImage *image = [info objectForKey:UIImagePickerControllerOriginalImage];
    NSString *imageString = [self changeImageToStirng:image];
    self.i = imageString;
    UIViewController *vc = [self viewController];
    [vc.navigationController dismissViewControllerAnimated:YES completion:nil];
    //    NSData *data =  [self changeImageStrToData:imageString];
    //    UIImage *imagef = [UIImage imageWithData:data];
    //    UIImageView *imagv = [[UIImageView alloc] initWithImage:imagef];
    //    imagv.frame = CGRectMake(50, 100, 100, 100);
    //    [self.view addSubview:imagv];
}

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
        bigbgview.frame = CGRectMake(20, 175, 983, 458);
        if (![[RbtUserModel sharedInstance].wtfk isEqualToString:@"n"])
        {
            cellImagebgView.frame = CGRectMake(20, 90, 983, 63);
            userName.frame = CGRectMake(768, 90, 150, 63);
            lab1.frame = CGRectMake(50, 90, 150, 63);
            cellaccBtn.frame = CGRectMake(928, 96, 55, 51);
            lab2.frame = CGRectMake(50, 175, 150, 63);
            uploadImagebtn.frame = CGRectMake(944, 189, 35, 35);
            self.textF_wenti.frame = CGRectMake(20, 238, 983, 395);
            uploadbtn.frame = CGRectMake((983-264)/2, 175+458-40-25, 264, 40);
        }
        else
        {
            lab2.frame = CGRectMake(10, 105-45, 100, 60);
            uploadImagebtn.frame = CGRectMake(270, 115-45, 35, 35);
            self.textF_wenti.frame = CGRectMake(6, 150-45, 307, ScreenHeight-216-20-150+45);
        }

    }
    else
    {
        bigbgview.frame = CGRectMake(20, 175, 727, 458);
        if (![[RbtUserModel sharedInstance].wtfk isEqualToString:@"n"])
        {
            cellImagebgView.frame = CGRectMake(20, 90, 727, 63);
            userName.frame = CGRectMake(520, 90, 150, 63);
            lab1.frame = CGRectMake(50, 90, 150, 63);
            cellaccBtn.frame = CGRectMake(680, 96, 55, 51);
            lab2.frame = CGRectMake(50, 175, 150, 63);
            uploadImagebtn.frame = CGRectMake(696, 189, 35, 35);
            self.textF_wenti.frame = CGRectMake(20, 238, 727, 395);
            uploadbtn.frame = CGRectMake(252, 175+458-40-25, 264, 40);
        }
        else
        {
            lab2.frame = CGRectMake(10, 105-45, 100, 60);
            uploadImagebtn.frame = CGRectMake(270, 115-45, 35, 35);
            self.textF_wenti.frame = CGRectMake(6, 150-45, 307, ScreenHeight-216-20-150+45);
        }
        
    }
    
}

@end
