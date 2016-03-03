//
//  ThirdViewController.m
//  MyDemo
//
//  Created by ishanghealth on 15/4/8.
//  Copyright (c) 2015年 commondec. All rights reserved.
//

#import "ThirdViewController.h"
#import "ImageTool.h"

#import "ViewController2.h"
@interface ThirdViewController ()

@end

@implementation ThirdViewController

- (id)init
{
    self = [super init];
    if (self)
    {
        //设置TabBar的标题和图片
        UIImage *img = [ImageTool OriginImage:[UIImage imageNamed:@"menu_icon_3_normal.png"]
                               scaleToSize:CGSizeMake(30, 30)];
        UITabBarItem *item = [[UITabBarItem alloc]initWithTitle:@"VC3" image:img tag:1];
        self.tabBarItem = item;
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated
{
//    //设置导航栏标题
//    self.title = @"thirdView";
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
   
    //btn1
    UIButton *btn1=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn1.frame=CGRectMake((self.view.frame.size.width-200)/2+40, 70, 120, 40);
    [btn1 setTitle:@"testGlobalObj" forState:UIControlStateNormal];
    [btn1 addTarget:self action:@selector(btnAction1) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn1];


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

#pragma mark - response
- (void) btnAction1 {
   
    ViewController2 *viewController2= [[ViewController2 alloc]init];
    [self.navigationController pushViewController:viewController2 animated:YES];
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
