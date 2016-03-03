//
//  ViewController.m
//  demos
//
//  Created by kang on 16/1/26.
//  Copyright © 2016年 kang. All rights reserved.
//

#import "ViewController.h"
#import "FirstViewController.h"
#import "SecondViewController.h"
#import "ThirdViewController.h"
#import "MainViewController.h"
#import "ViewController1.h"

@interface ViewController ()
{
    UITabBarController *tabBarController;
    FirstViewController *firstViewController;
    SecondViewController *secondViewController;
    ThirdViewController *thirdViewController;
    ViewController1 *mainViewControllers;
    
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    tabBarController = [[UITabBarController alloc]init];
    
    //初始各个主界面
    firstViewController = [[FirstViewController alloc]init];
    secondViewController = [[SecondViewController alloc]init];
    thirdViewController = [[ThirdViewController alloc]init];
    mainViewControllers = [[ViewController1 alloc]init];
    
    //初始化各个主界面的导航栏
    UINavigationController *firstNavigation = [[UINavigationController alloc]initWithRootViewController:firstViewController];
    UINavigationController *secondNavigation = [[UINavigationController alloc]initWithRootViewController:secondViewController];
    UINavigationController *thirdNavigation = [[UINavigationController alloc]initWithRootViewController:thirdViewController];
//    UINavigationController *mainNavigation = [[UINavigationController alloc]initWithRootViewController:mainViewControllers];
//    mainNavigation.tabBarItem.title = @"main";
    NSArray *navigationArray = [NSArray arrayWithObjects:
                                firstNavigation,
                                secondNavigation,
                                thirdNavigation,
                                
                                nil];
    [tabBarController setViewControllers:navigationArray];
    [tabBarController.view setFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    [self.view addSubview:tabBarController.view];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
