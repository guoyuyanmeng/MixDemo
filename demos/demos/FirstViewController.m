//
//  ViewController.m
//  MyDemo
//
//  Created by ishang on 15/4/2.
//  Copyright (c) 2015年 commondec. All rights reserved.
//

#import <objc/runtime.h>
#import <objc/message.h>
#import "FirstViewController.h"
#import "ImageTool.h"
#import "TableDelCell.h"
#import "Masonry.h"

@interface FirstViewController () <UITableViewDataSource, UITableViewDelegate,UIScrollViewDelegate>
{

    UITableView *_tableView;
    CellStatus _cellState;
}

@end


//static const void *cellStatus = "cellStatus";
@implementation FirstViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
        //设置TabBar的标题和图片
        UIImage *img = [ImageTool OriginImage:[UIImage imageNamed:@"主页"]
                               scaleToSize:CGSizeMake(25, 25)];
        UITabBarItem *item = [[UITabBarItem alloc]initWithTitle:@"VC1" image:img tag:1];
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
    _tableView = tableView;
    [self.view addSubview:_tableView];
    
    __weak typeof(self) weakSelf = self;
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(weakSelf.view).with.insets(UIEdgeInsetsMake(10, 0, 10, 0));
        
    }];
    NSNumber *status = [NSNumber numberWithInteger:CellStatusClose];
    objc_setAssociatedObject(_tableView, cellStatus, status, OBJC_ASSOCIATION_ASSIGN);
//    [UITableView setValue:@"0" forKey:@"_cellStatus"];
    
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
    TableDelCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentify];
    
    if (cell == nil) {
        cell = [[TableDelCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentify];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
//        [cell.buyBtn addTarget:self action:@selector(drawRectView:) forControlEvents:UIControlEventTouchUpInside];
        
        if (class_respondsToSelector(object_getClass(cell), @selector(createButton:)) ) {
//            NSLog(@"class_respondsToSelector");
            [cell performSelector:@selector(createButton:) withObject:_tableView];
//            [cell performSelector:@selector(testPerformSelector)];
            
            /********** 消息转发 ************/
//            NSString *selStr = NSStringFromSelector(@selector(testPerformSelector));
//            if([selStr isEqualToString:@"testPerformSelector"]){
//                NSLog(@"class_respondsToSelector");
//                
//                class_addMethod(object_getClass(cell),
//                                @selector(testPerformSelector),
//                                class_getMethodImplementation(object_getClass(self), @selector(testPerformSelector)),
//                                nil);
////                objc_msgSend(self,@selector(testPerformSelector),nil);
//                
//                
//                [cell performSelector:@selector(testPerformSelector)];
//                
//                NSRunLoop   *runloop = [NSRunLoop currentRunLoop];
//                NSLog(@"%@",runloop);
//            }
//            [cell createButtonContrntView];
        }
        
//        if ([cell respondsToSelector:@selector(createButtonContrntView)]) {
//            
//            
//        }
    }
    NSString *indexNum = [NSString stringWithFormat:@"%ld",indexPath.row];
    cell.textLabel.text = [@"title" stringByAppendingString:indexNum];
    cell.detailTextLabel.text = [@"detailTextLabel" stringByAppendingString:indexNum];
    
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return YES;
}

//- (NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath {
//    return @"   删除   ";
//}
//
//- (void) tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
//    
////    [data removeObjectAtIndex:indexPath.row];
////    [tableView reloadData];
//}


//滑动前检查table是否有cell处于打开状态
- (void) checkCellState {
    
    NSNumber *status = (NSNumber *)objc_getAssociatedObject(_tableView, cellStatus);
    _cellState =  (CellStatus)[status integerValue];
//    _cellState = (CellStatus)[[_tableView valueForKey:@"_cellStatus"] integerValue];
    
    if (_cellState == CellStatusOpen) {
        NSLog(@"opened !");
    }else {
        NSLog(@"closed !");
    }
}
#pragma mark - scrollViewDelegate
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    [self checkCellState];
//    NSLog(@"view will dragging !");
}

- (void) testPerformSelector {

    NSLog(@"testPerformSelector");
}

@end
