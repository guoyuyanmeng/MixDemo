//
//  ViewController.m
//  demos
//
//  Created by kang on 16/1/26.
//  Copyright © 2016年 kang. All rights reserved.
//

#import "TabBarController.h"
#import "FirstViewController.h"
#import "TableViewController.h"
#import "CollectionViewCtroller.h"
#import "MainViewController.h"
#import "ViewController1.h"

@interface TabBarController ()
{
    UITabBarController *tabBarController;
    FirstViewController *firstViewController;
    TableViewController *secondViewController;
    CollectionViewCtroller *thirdViewController;
    ViewController1 *mainViewControllers;
    NSInteger goods;
}

@end

@implementation TabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    tabBarController = [[UITabBarController alloc]init];
    [self.view setBackgroundColor:[UIColor colorWithWhite:245.0/256.0 alpha:1]];
    
    //初始各个主界面
    firstViewController = [[FirstViewController alloc]init];
    secondViewController = [[TableViewController alloc]init];
    thirdViewController = [[CollectionViewCtroller alloc]init];
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
    [self setViewControllers:navigationArray];
    [self.view setFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    [self.view addSubview:tabBarController.view];
    
    //添加监听器，监听属性goods
    [self addObserver:self forKeyPath:@"goods" options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld context:NULL];
}


-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if([keyPath isEqualToString:@"goods"])
    {
//        NSLog(@"goods:%@",[self valueForKey:@"goods"]);
    }
}



- (void) dealloc {
    
    [self removeObserver:self forKeyPath:@"goods"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
