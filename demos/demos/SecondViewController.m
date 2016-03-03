//
//  SecondViewController.m
//  MyDemo
//
//  Created by ishanghealth on 15/4/8.
//  Copyright (c) 2015年 commondec. All rights reserved.
//

#import "SecondViewController.h"
#import "ImageTool.h"

@interface SecondViewController ()

@property (nonatomic,strong)UIPageControl *pageControl;
@property (nonatomic,strong) UIButton *btn1;
@property (nonatomic,strong) UIButton *btn2;
@property (nonatomic,strong) UIButton *btn3;
@end

@implementation SecondViewController

- (id)init
{
    self = [super init];
    if (self) {
        //设置TabBar的标题和图片 menu_icon_2_normal.png
        UIImage *img = [ImageTool OriginImage:[UIImage imageNamed:@"menu_icon_2_normal.png"]
                               scaleToSize:CGSizeMake(30, 30)];
        UITabBarItem *item = [[UITabBarItem alloc]initWithTitle:@"VC2" image:img tag:1];
        self.tabBarItem = item;
    }
    
    return self;
}

- (void)viewWillAppear:(BOOL)animated
{
//    //设置导航栏标题
//    self.title = @"secondView";
    
    //隐藏导航栏
    [self.navigationController setNavigationBarHidden:NO];
   
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //btn1
    UIButton *btn1=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn1.frame=CGRectMake((self.view.frame.size.width-200)/2+40, 70, 60, 40);
    [btn1 setTitle:@"moveBtn1" forState:UIControlStateNormal];
    [btn1 addTarget:self action:@selector(btnAction1) forControlEvents:UIControlEventTouchUpInside];
    _btn1 = btn1;
    [self.view addSubview:_btn1];
    
    //btn2
    UIButton *btn2=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn2.frame=CGRectMake((self.view.frame.size.width-200)/2+40, 120, 60, 40);
    [btn2 setTitle:@"moveBtn2" forState:UIControlStateNormal];
    [btn2 addTarget:self action:@selector(btnAction2) forControlEvents:UIControlEventTouchUpInside];
    _btn2 = btn2;
    [self.view addSubview:_btn2];
    
    //btn3
    UIButton *btn3=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn3.frame=CGRectMake((self.view.frame.size.width-200)/2+40, 260, 60, 40);
    [btn3 setTitle:@"moveBtn3" forState:UIControlStateNormal];
    [btn3 addTarget:self action:@selector(btnAction3) forControlEvents:UIControlEventTouchUpInside];
    _btn3 = btn3;
    [self.view addSubview:_btn3];
}

- (void) btnAction1 {
//     _btn3.transform    =       CGAffineTransformMakeTranslation(10, 0);
    CGAffineTransform translate = CGAffineTransformMakeTranslation(10.0, 0.0);
    CGAffineTransform drawerViewTransform = _btn2.transform;
    drawerViewTransform.tx = translate.tx;
    drawerViewTransform.ty = translate.ty;
    _btn3.transform = drawerViewTransform;
    
    NSLog(@"\ntranslate = \n(%f,%f,%f,%f  %f,%f)",
          translate.a,
          translate.b,
          translate.c,
          translate.d,
          translate.tx,
          translate.ty);
    
    NSLog(@"\n_btn2.transform = \n(%f,%f,%f,%f  %f,%f)",
          _btn2.transform.a,
          _btn2.transform.b,
          _btn2.transform.c,
          _btn2.transform.d,
          _btn2.transform.tx,
          _btn2.transform.ty);
    
}

- (void) btnAction2 {
    
    static CGFloat i = 0;
    _btn3.transform = CGAffineTransformTranslate(CGAffineTransformIdentity, 10, 0);
    CGAffineTransform transform =  CGAffineTransformMake(1,i,i,1,10,0);
    NSLog(@"\n_btn2.transform = (%f,%f,%f,%f  %f,%f)",
          _btn3.transform.a,
          _btn3.transform.b,
          _btn3.transform.c,
          _btn3.transform.d,
          _btn3.transform.tx,
          _btn3.transform.ty);
    _btn3.transform = transform;
//    _btn3.transform = CGAffineTransformTranslate(self.btn3.transform, 10, 0);
    NSLog(@"\n_btn2.transform = \n(%f,%f,%f,%f  %f,%f)",
          _btn3.transform.a,
          _btn3.transform.b,
          _btn3.transform.c,
          _btn3.transform.d,
          _btn3.transform.tx,
          _btn3.transform.ty);
    
    i +=0.1;
}

-(void) btnAction3 {

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
