//
//  MainViewController.m
//  ishealth
//
//  Created by kang on 15/11/9.
//  Copyright © 2015年 cmcc. All rights reserved.
//

#import "LeftMenuViewController.h"
#import "LeftMenu.h"
#import "APIConstant.h"
#import <MobileCoreServices/MobileCoreServices.h>
#import "BaseVC.h"
#import "NetWorker.h"

#import "UIImageView+WebCache.h"
#import "UIButton+AFNetworking.h"
#import "SDImageCache.h"
#import "SDWebImageManager.h"



#import "User.h"
#import "MangerUser.h"

#define LeftMenu_Width [UIScreen mainScreen].bounds.size.width
#define LeftMenu_Hight [UIScreen mainScreen].bounds.size.height
#define TIMER 0.25

#define ORIGINAL_MAX_WIDTH 640.0f

@interface LeftMenuViewController () <LeftMenuDegelate>
{

    
}

@property (nonatomic, strong) LeftMenu *leftMenuView;
@property (nonatomic, strong) UIBarButtonItem *leftItem;
@property (nonatomic, weak) UIViewController *currentVC;

@end

@implementation LeftMenuViewController
@synthesize leftMenuView;


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self addLeftMenu];
    [self addNoto];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - private methods

//添加导航栏左侧按钮
-(void)buildUI
{
    User *user = [MangerUser getUser];
    NSLog(@"user =%@",user);
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button addTarget:self action:@selector(leftItemClick) forControlEvents:UIControlEventTouchUpInside];
    button.frame = CGRectMake(0,0, 40, 40);
    [button setImageForState:UIControlStateNormal
                     withURL:[NSURL URLWithString:[AVRTAR_URL stringByAppendingString:user.pic]]
            placeholderImage:[UIImage imageNamed:@"slide_menu_button_bg.png"]];
    self.leftItem = [[UIBarButtonItem alloc] initWithCustomView:button];
//    self.navigationItem.leftBarButtonItem = leftItem;
}

//添加左侧菜单
-(void)addLeftMenu
{
    NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"list" ofType:@"plist"];
    NSLog(@"plist url:%@", plistPath);
    NSArray *array = [[NSArray alloc] initWithContentsOfFile:plistPath];
    leftMenuView = [[LeftMenu alloc] initWithFrame:CGRectMake(0, 0, LeftMenu_Width,LeftMenu_Hight)];
//    leftMenuView.degelate = self;
    leftMenuView.leftDelegate = self;
    leftMenuView.lists = array;
    leftMenuView.hidden = NO;
//    self.view = leftMenuView;
    [self.view addSubview:leftMenuView];
//    [[UIApplication sharedApplication].keyWindow insertSubview:leftMenuView atIndex:1];
}


-(void)addNoto
{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(settingBtnClick) name:@"settingBtnClick" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(switchingBtnClick) name:@"switchingBtnClick" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(avtarClick) name:@"avtarClick" object:nil];
}


//初始化首页viewController
- (void) initHomeViewControllerClass:(Class)homeClass title:(NSString *)title {
    
    [self buildUI];
    //根据index取出要跳转的viewController类
    Class paneViewControllerClass = homeClass;
    
    //跳转首页界面
    BaseVC *paneViewController = (BaseVC *)[[paneViewControllerClass alloc]init];
    paneViewController.navigationItem.title = title;
    paneViewController.navigationItem.leftBarButtonItem = self.leftItem;
    UINavigationController *paneNavigationViewController = [[UINavigationController alloc] initWithRootViewController:paneViewController];
    [self.drawerViewController setPaneViewController:paneNavigationViewController];
    
    //记录当前的paneViewController
    _currentVC = paneViewController;
}

#pragma mark - event responses

//导航栏左侧按钮响应方法
-(void)leftItemClick
{
    [self.drawerViewController setPaneState:LeftMenuStateOpen
                                inDirection:LeftMenuDirectionLeft
                                   animated:YES
                      allowUserInterruption:YES
                                 completion:nil];
    
}


//点击leftMenu上头像的响应方法
- (void) avtarClick {
    
    UIActionSheet *choiceSheet = [[UIActionSheet alloc] initWithTitle:nil
                                                             delegate:self
                                                    cancelButtonTitle:@"取消"
                                               destructiveButtonTitle:nil
                                                    otherButtonTitles:@"拍照", @"从相册中选取", nil];
    [choiceSheet showInView:self.view];
    
}


//点击切换用户响应方法
- (void) switchingBtnClick {
    
    
}

//点击设置按钮相应方法
- (void) settingBtnClick {
    
}

#pragma mark -  system delegates

#pragma mark UIActionSheetDelegate
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (buttonIndex == 0) {
        // 拍照
        if ([self isCameraAvailable] && [self doesCameraSupportTakingPhotos]) {
            UIImagePickerController *controller = [[UIImagePickerController alloc] init];
            controller.sourceType = UIImagePickerControllerSourceTypeCamera;
            //            if ([self isFrontCameraAvailable]) {
            //                controller.cameraDevice = UIImagePickerControllerCameraDeviceFront;
            //            }
            NSMutableArray *mediaTypes = [[NSMutableArray alloc] init];
            [mediaTypes addObject:(__bridge NSString *)kUTTypeImage];
            controller.mediaTypes = mediaTypes;
            controller.delegate = self;
            
            [self presentViewController:controller
                               animated:YES
                             completion:^(void){
                             }];
        }
        
    } else if (buttonIndex == 1) {
        // 从相册中选取
        if ([self isPhotoLibraryAvailable]) {
            UIImagePickerController *controller = [[UIImagePickerController alloc] init];
            controller.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
            NSMutableArray *mediaTypes = [[NSMutableArray alloc] init];
            [mediaTypes addObject:(__bridge NSString *)kUTTypeImage];
            controller.mediaTypes = mediaTypes;
            controller.delegate = self;
            [self presentViewController:controller
                               animated:YES
                             completion:^(void){
                             }];
        }
    }
}

#pragma mark camera utility
- (BOOL) isCameraAvailable{
    return [UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera];
}

- (BOOL) isRearCameraAvailable{
    return [UIImagePickerController isCameraDeviceAvailable:UIImagePickerControllerCameraDeviceRear];
}

- (BOOL) isFrontCameraAvailable {
    return [UIImagePickerController isCameraDeviceAvailable:UIImagePickerControllerCameraDeviceFront];
}

- (BOOL) doesCameraSupportTakingPhotos {
    return [self cameraSupportsMedia:(__bridge NSString *)kUTTypeImage sourceType:UIImagePickerControllerSourceTypeCamera];
}

- (BOOL) isPhotoLibraryAvailable{
    return [UIImagePickerController isSourceTypeAvailable:
            UIImagePickerControllerSourceTypePhotoLibrary];
}
- (BOOL) canUserPickVideosFromPhotoLibrary{
    return [self
            cameraSupportsMedia:(__bridge NSString *)kUTTypeMovie sourceType:UIImagePickerControllerSourceTypePhotoLibrary];
}
- (BOOL) canUserPickPhotosFromPhotoLibrary{
    return [self
            cameraSupportsMedia:(__bridge NSString *)kUTTypeImage sourceType:UIImagePickerControllerSourceTypePhotoLibrary];
}

- (BOOL) cameraSupportsMedia:(NSString *)paramMediaType sourceType:(UIImagePickerControllerSourceType)paramSourceType{
    __block BOOL result = NO;
    if ([paramMediaType length] == 0) {
        return NO;
    }
    NSArray *availableMediaTypes = [UIImagePickerController availableMediaTypesForSourceType:paramSourceType];
    [availableMediaTypes enumerateObjectsUsingBlock: ^(id obj, NSUInteger idx, BOOL *stop) {
        NSString *mediaType = (NSString *)obj;
        if ([mediaType isEqualToString:paramMediaType]){
            result = YES;
            *stop= YES;
        }
    }];
    return result;
}

#pragma mark image scale utility
- (UIImage *)imageByScalingToMaxSize:(UIImage *)sourceImage {
    if (sourceImage.size.width < ORIGINAL_MAX_WIDTH) return sourceImage;
    CGFloat btWidth = 0.0f;
    CGFloat btHeight = 0.0f;
    if (sourceImage.size.width > sourceImage.size.height) {
        btHeight = ORIGINAL_MAX_WIDTH;
        btWidth = sourceImage.size.width * (ORIGINAL_MAX_WIDTH / sourceImage.size.height);
    } else {
        btWidth = ORIGINAL_MAX_WIDTH;
        btHeight = sourceImage.size.height * (ORIGINAL_MAX_WIDTH / sourceImage.size.width);
    }
    CGSize targetSize = CGSizeMake(btWidth, btHeight);
    return [self imageByScalingAndCroppingForSourceImage:sourceImage targetSize:targetSize];
}

- (UIImage *)imageByScalingAndCroppingForSourceImage:(UIImage *)sourceImage targetSize:(CGSize)targetSize {
    UIImage *newImage = nil;
    CGSize imageSize = sourceImage.size;
    CGFloat width = imageSize.width;
    CGFloat height = imageSize.height;
    CGFloat targetWidth = targetSize.width;
    CGFloat targetHeight = targetSize.height;
    CGFloat scaleFactor = 0.0;
    CGFloat scaledWidth = targetWidth;
    CGFloat scaledHeight = targetHeight;
    CGPoint thumbnailPoint = CGPointMake(0.0,0.0);
    if (CGSizeEqualToSize(imageSize, targetSize) == NO)
    {
        CGFloat widthFactor = targetWidth / width;
        CGFloat heightFactor = targetHeight / height;
        
        if (widthFactor > heightFactor)
            scaleFactor = widthFactor; // scale to fit height
        else
            scaleFactor = heightFactor; // scale to fit width
        scaledWidth  = width * scaleFactor;
        scaledHeight = height * scaleFactor;
        
        // center the image
        if (widthFactor > heightFactor)
        {
            thumbnailPoint.y = (targetHeight - scaledHeight) * 0.5;
        }
        else if (widthFactor < heightFactor)
        {
            thumbnailPoint.x = (targetWidth - scaledWidth) * 0.5;
        }
    }
    UIGraphicsBeginImageContext(targetSize); // this will crop
    CGRect thumbnailRect = CGRectZero;
    thumbnailRect.origin = thumbnailPoint;
    thumbnailRect.size.width  = scaledWidth;
    thumbnailRect.size.height = scaledHeight;
    
    [sourceImage drawInRect:thumbnailRect];
    
    newImage = UIGraphicsGetImageFromCurrentImageContext();
    if(newImage == nil) NSLog(@"could not scale image");
    
    //pop the context to get back to the default
    UIGraphicsEndImageContext();
    return newImage;
}

#pragma mark - custom delegates

- (void) leftMenuDidSeletedPathForClass:(Class)indexClass title:(NSString *)title{
    

    // Close pane if already displaying that pane view controller
    //如果当前显示的viewController就是要跳转的，那么就不需要跳转，只关闭左侧菜单栏
    if ([_currentVC isKindOfClass:indexClass]) {
        [self.drawerViewController setPaneState:LeftMenuStateClosed animated:YES allowUserInterruption:YES completion:nil];
        return;
    }
    
    BOOL animateTransition = self.drawerViewController.paneViewController != nil;
    
    //根据index取出要跳转的viewController类
    Class paneViewControllerClass = indexClass;
    
    
    
    if (paneViewControllerClass)
    {
        BaseVC *paneViewController = [(BaseVC *)[paneViewControllerClass alloc]init];
        paneViewController.navigationItem.title = title;
        paneViewController.navigationItem.leftBarButtonItem = self.leftItem;
        UINavigationController *paneNavigationViewController = [[UINavigationController alloc] initWithRootViewController:paneViewController];
        [self.drawerViewController setPaneViewController:paneNavigationViewController animated:animateTransition completion:nil];
        
        //记录当前的paneViewController
        _currentVC = paneViewController;
    }
    
    
}

#pragma mark VPImageCropperDelegate
- (void)imageCropper:(VPImageCropperViewController *)cropperViewController didFinished:(UIImage *)editedImage {
    [cropperViewController dismissViewControllerAnimated:YES completion:^{
        
        
        dispatch_async(dispatch_get_global_queue(0, 0), ^{
            NetWorker *networker =  [[NetWorker alloc]init];
            NSDictionary * result = [networker uploadPic:editedImage];
            dispatch_async(dispatch_get_main_queue(), ^{
                if([[result objectForKey:@"status"] isEqualToString:@"SUCCESS"]){
                    
                    self.leftMenuView.headerView.titleAvatar.image = editedImage;
                    
                    SDWebImageManager *_manager=[[SDWebImageManager alloc]init];
                    
                    User *user=[MangerUser getUser];
                    [[SDImageCache sharedImageCache] storeImage:editedImage
                                           recalculateFromImage:YES
                                                      imageData:UIImagePNGRepresentation(editedImage)
                                                         forKey:[_manager cacheKeyForURL:[NSURL URLWithString:[AVRTAR_URL stringByAppendingString:user.pic]]]
                                                         toDisk:YES];
                    
                }
            });
        });
    }];
}

- (void)imageCropperDidCancel:(VPImageCropperViewController *)cropperViewController {
    [cropperViewController dismissViewControllerAnimated:YES completion:^{
    }];
}

#pragma mark leftMenuDelegate
- (void) leftMenuDidSeletedIndexPath:(NSIndexPath *)indexPath title:(NSString *)title {
    
    
}


@end
