//
//  SecondViewController.m
//  MyDemo
//
//  Created by ishanghealth on 15/4/8.
//  Copyright (c) 2015年 commondec. All rights reserved.
//

#import "TableViewController.h"
#import "ImageTool.h"
#import "Masonry.h"
#import "ShopingCart.h"
#import "AppDelegate.h"
#import "TableViewCell.h"

@interface TableViewController () <UITableViewDataSource,UITableViewDelegate>{

    
}

//@property (nonatomic,strong)UIPageControl *pageControl;
//@property (nonatomic,strong) UIButton *btn1;
//@property (nonatomic,strong) UIButton *btn2;
//@property (nonatomic,strong) UIButton *btn3;
@end

@implementation TableViewController

- (id)init
{
    self = [super init];
    if (self) {
        //设置TabBar的标题和图片 menu_icon_2_normal.png
        UIImage *img = [ImageTool OriginImage:[UIImage imageNamed:@"发布"]
                               scaleToSize:CGSizeMake(25, 25)];
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
//    [self.navigationController setNavigationBarHidden:NO];
   
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    UITableView *tableView = [[UITableView alloc]init];
    tableView.delegate = self;
    tableView.dataSource = self;
    
    [self.view addSubview:tableView];
    
    __weak typeof(self) weakSelf = self;
    [tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(weakSelf.view).with.insets(UIEdgeInsetsMake(10, 0, 10, 0));
        
    }];
}

#pragma mark - UITableViewDataSource
- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 100;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString * cellIdentify = @"cellIdentify";
    TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentify];
    
    if (cell == nil) {
        cell = (TableViewCell*)[[TableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentify];
        [cell createSubviews];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        [cell.buyBtn addTarget:self action:@selector(drawRectView:) forControlEvents:UIControlEventTouchUpInside];

    }
    NSString *indexNum = [NSString stringWithFormat:@"%ld",indexPath.row];
    cell.textLabel.text = [@"title" stringByAppendingString:indexNum];
    cell.detailTextLabel.text = [@"detailTextLabel" stringByAppendingString:indexNum];
    
    
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {

    return YES;
}


#pragma mark - UITableViewDelegate


#pragma mark - response Methods

//改变商品数量，出发监听器
-(void) changeGoodsCount {
    
    NSString *countGoods = [self.tabBarController valueForKey:@"goods"];
    NSString *count = [NSString stringWithFormat:@"%ld",(countGoods.integerValue) +1];
    [self.tabBarController setValue:count forKey:@"goods"];
    if ([count isEqualToString:@"0"]) {
        self.tabBarItem.badgeValue = nil;//不显示tabBar的角标
    }else{
        self.tabBarItem.badgeValue = count;//设置tabBar的角标
    }
}

- (void) drawRectView:(UIButton *)btn
{

    CGPoint beginPoint  = [self.view convertPoint:btn.center fromView:btn.superview];
    CGPoint endPoint  = self.tabBarController.tabBar.center;
    
    CAKeyframeAnimation *pathAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    //Set some variables on the animation
    pathAnimation.delegate = self;
    pathAnimation.calculationMode = kCAAnimationPaced;
    //We want the animation to persist - not so important in this case - but kept for clarity
    //If we animated something from left to right - and we wanted it to stay in the new position,
    //then we would need these parameters
    pathAnimation.fillMode = kCAFillModeForwards;
    pathAnimation.removedOnCompletion = NO;
    pathAnimation.duration = 0.5;
    //Lets loop continuously for the demonstration
    pathAnimation.repeatCount = 0;

    CGMutablePathRef curvedPath = CGPathCreateMutable();
    CGPathMoveToPoint(curvedPath, NULL, beginPoint.x, beginPoint.y);
    CGPathAddQuadCurveToPoint(curvedPath, NULL, endPoint.x, beginPoint.y, endPoint.x, endPoint.y);
    //Now we have the path, we tell the animation we want to use this path - then we release the path
    pathAnimation.path = curvedPath;
    CGPathRelease(curvedPath);
    
    
    
    CALayer *layer = [[CALayer alloc]init];
    [layer setBackgroundColor:[UIColor redColor].CGColor];
    layer.cornerRadius = 10;
    layer.frame = CGRectMake(beginPoint.x-10,beginPoint.y-10,20,20);
    [layer addAnimation:pathAnimation forKey:@"moveTheSquare"];
    [self.view.layer addSublayer:layer];
    
//    UIView *move = [[UIView alloc]init];
//    [move setBackgroundColor:[UIColor redColor]];
//    move.layer.cornerRadius = 10;
//    move.frame = CGRectMake(0,0,20,20);
//    move.center = beginPoint;
//    [self.view addSubview:move];
//    [move.layer addAnimation:pathAnimation forKey:@"moveTheSquare"];
    
    
    
}

-(void) animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {

    [self changeGoodsCount];
}

@end
