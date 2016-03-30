//
//  ViewController2.m
//  demos
//
//  Created by kang on 16/2/11.
//  Copyright © 2016年 kang. All rights reserved.
//

#import "ViewController2.h"
#import "Masonry.h"

#define WS(weakSelf)  __weak __typeof(&*self)weakSelf = self;

@implementation ViewController2:BaseVC

- (id) init {
    
     NSLog(@"%@",NSStringFromClass([super class]));
    self = [super init];
    if (self) {
        
    }
    
    return self;
}

- (void) viewDidLoad {

    [super viewDidLoad];
    
    WS(ws);
    
    UIView *sv = [UIView new];
//    [sv showPlaceHolder];
    sv.backgroundColor = [UIColor blackColor];
    [self.view addSubview:sv];
    
    [sv mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(ws.view);
        make.size.mas_equalTo(CGSizeMake(300, 300));
    }];
    
    
    UIView *sv1 = [UIView new];
//    [sv1 showPlaceHolder];
    sv1.backgroundColor = [UIColor redColor];
    [sv addSubview:sv1];
    [sv1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(sv).with.insets(UIEdgeInsetsMake(10, 10, 10, 10));
        
        /* 等价于
         make.top.equalTo(sv).with.offset(10);
         make.left.equalTo(sv).with.offset(10);
         make.bottom.equalTo(sv).with.offset(-10);
         make.right.equalTo(sv).with.offset(-10);
         */
        
        /* 也等价于
         make.top.left.bottom.and.right.equalTo(sv).with.insets(UIEdgeInsetsMake(10, 10, 10, 10));
         */
    }];
    
    //
    UIButton *btn1=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    [btn1 setTitle:@"disPatchSemaphore" forState:UIControlStateNormal];
    [btn1 addTarget:self action:@selector(disPatchSemaphoreAction) forControlEvents:UIControlEventTouchUpInside];
    [sv1 addSubview:btn1];
    
    [btn1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(sv1).with.offset(100);
        make.left.equalTo(sv1).with.offset(50);
        make.bottom.equalTo(sv1).with.offset(-100);
        make.right.equalTo(sv1).with.offset(-50);
    }];
    
}

-(void) disPatchSemaphoreAction {
    
    dispatch_group_t group = dispatch_group_create();
    dispatch_semaphore_t semaphore = dispatch_semaphore_create(5);
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    
    for (int i = 0; i < 20; i++) {
        dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
        dispatch_group_async(group, queue, ^{
            NSLog(@"%i",i);
            sleep(3);
            dispatch_semaphore_signal(semaphore);
        });
    }
    
    dispatch_group_wait(group, DISPATCH_TIME_FOREVER);
    
}



@end
