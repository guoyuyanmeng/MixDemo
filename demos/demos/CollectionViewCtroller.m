//
//  ThirdViewController.m
//  MyDemo
//
//  Created by ishanghealth on 15/4/8.
//  Copyright (c) 2015年 commondec. All rights reserved.
//

#import "CollectionViewCtroller.h"
#import "ImageTool.h"
#import "Masonry.h"
#import "ViewController2.h"
#import "TableDelCell2.h"

@interface CollectionViewCtroller ()<UITableViewDataSource, UITableViewDelegate>
{
    NSMutableArray *data;

}
@end

@implementation CollectionViewCtroller

- (id)init
{
    self = [super init];
    if (self)
    {
        //设置TabBar的标题和图片
        UIImage *img = [ImageTool OriginImage:[UIImage imageNamed:@"个人"]
                               scaleToSize:CGSizeMake(25, 25)];
        UITabBarItem *item = [[UITabBarItem alloc]initWithTitle:@"VC3" image:img tag:1];
        self.tabBarItem = item;
    }
    return self;
}



- (void)viewDidLoad {
    [super viewDidLoad];
    UITableView *tableView = [[UITableView alloc]init];
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.scrollEnabled = YES;
    
    [self.view addSubview:tableView];
    
    __weak typeof(self) weakSelf = self;
    [tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(weakSelf.view).with.insets(UIEdgeInsetsMake(10, 0, 10, 0));
        
    }];
    
    data = [self createData];
    
}

- (NSMutableArray *) createData {
    NSMutableArray *array = [[NSMutableArray alloc]init];
    
    for (int i = 0; i < 7; i++) {
        
        NSString *title = [@"星期" stringByAppendingString:[NSString stringWithFormat:@"%d",i+1]];
        [array addObject:title];
    }
    
    return array;
}

#pragma mark - UITableViewDataSource
- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return data.count;
}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 100;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString * cellIdentify = @"cellIdentify";
    TableDelCell2 *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentify];
    
    if (cell == nil) {
        cell = [[TableDelCell2 alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentify];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    NSString *indexNum = [NSString stringWithFormat:@"%ld",indexPath.row];
    cell.textLabel.text = [data objectAtIndex:indexPath.row];
    cell.detailTextLabel.text = [@"detailTextLabel" stringByAppendingString:indexNum];
    
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return YES;
}

//- (NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath {
//    return @"   删除   ";
//}

- (NSArray *)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath {
    //设置删除按钮
    UITableViewRowAction *deleteRowAction = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDestructive
                                                                               title:@"  删除  "
                                                                             handler:^(UITableViewRowAction *action,NSIndexPath *indexPath) {
        
        [data removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath]withRowAnimation:UITableViewRowAnimationAutomatic];
        
    }];
    
    //设置收藏按钮
    UITableViewRowAction *collectRowAction = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleNormal
                                                                                title:@"  收藏  "
                                                                              handler:^(UITableViewRowAction *action,NSIndexPath *indexPath) {
        
        
        collectRowAction.backgroundColor = [UIColor greenColor];
        
        UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"收藏"
                                                           message:@"收藏成功"
                                                          delegate:self
                                                 cancelButtonTitle:@"确定"
                                                 otherButtonTitles:nil,nil];
        [alertView show];
        
        [tableView setEditing:NO animated:YES];
        
    }];
    
     return  @[deleteRowAction,collectRowAction];
}


//- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
//
//{
//    
//    return UITableViewCellEditingStyleDelete;
//    
//}

//- (void) tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
//    
//    [data removeObjectAtIndex:indexPath.row];
//    [tableView reloadData];
//}


@end
