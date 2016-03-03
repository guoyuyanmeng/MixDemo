//
//  MainViewController.m
//  ishealth
//
//  Created by kang on 15/11/17.
//  Copyright © 2015年 cmcc. All rights reserved.
//

#import "MainViewController.h"
#import "LeftMenuViewController.h"
#import "ViewController1.h"
#import "DrawerStylers.h"

@interface MainViewController ()

@end

LeftMenuViewController *leftMenuVC;

@implementation MainViewController

//- (instancetype) init
//{
//    self = [super init];
//    if (self) {
//
//    }
//    return self;
//}

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self  addStylersFromArray:@[[DrawerScaleStyler styler], [DrawerFadeStyler styler],[DrawerParallaxStyler styler]] forDirection:LeftMenuDirectionLeft];
    
    leftMenuVC = [[LeftMenuViewController alloc]init];
    leftMenuVC.drawerViewController = self;
    [self setDrawerViewController:leftMenuVC forDirection:LeftMenuDirectionLeft];
    [leftMenuVC initHomeViewControllerClass:[ViewController1 class] title:@"首页"];
    
    
    //set background picture
    //    self.view.backgroundColor=[UIColor colorWithRed:50/255. green:50/255. blue:50/255. alpha:1];
    //    self.view.backgroundColor=[UIColor whiteColor];
    [self.view addSubview:self.windowBackground];
    [self.view sendSubviewToBack:self.windowBackground];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIImageView *)windowBackground
{
    if (!_windowBackground) {
        _windowBackground = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Window_Background"]];
    }
    return _windowBackground;
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
