//
//  ViewController4.m
//  demos
//
//  Created by kang on 16/2/11.
//  Copyright © 2016年 kang. All rights reserved.
//

#import "ViewController4.h"
#import "ImageTool.h"
#import "TestRetainCycle.h"

@interface ViewController4 ()

@property (nonatomic, strong) UILabel *label;
@property (nonatomic, weak) UILabel *label2;
@end


@implementation ViewController4

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //    UILabel *lab = [[UILabel alloc] init];
    //    lab.text = @"label1";
    //    label = lab;
    //    label2 = label;
    
    //    NSLog(@"label = %@",label);
    //    NSLog(@"label2= %@",label2);
    //    NSLog(@"\n");
    //
    //    NSLog(@"label = %@",label.text);
    //    NSLog(@"label2= %@",label2.text);
    //    NSLog(@"\n");
    //
    //    label.text = @"789";
    //    NSLog(@"label = %@",label.text);
    //    NSLog(@"label2= %@",label2.text);
    //    NSLog(@"\n");
    //
    //    label2.text = @"345";
    //    NSLog(@"label = %@",label.text);
    //    NSLog(@"label2= %@",label2.text);
    //    NSLog(@"\n");
    //
    //    label2 = nil;
    //    NSLog(@"label = %@",label.text);
    //    NSLog(@"label2= %@",label2.text);
    //    NSLog(@"\n");
    //    NSLog(@"label = %@",label);
    //    NSLog(@"label2= %@",label2);
    //    NSLog(@"\n");
    //
    //    label2 = label;
    //    label = nil;
    //    NSLog(@"label = %@",label.text);
    //    NSLog(@"label2= %@",label2.text);
    //    NSLog(@"\n");
    //
    //    NSLog(@"label = %@",label);
    //    NSLog(@"label2= %@",label2);
    //    NSLog(@"\n");
    
    
    //    __weak typeof(UILabel) *weakLab = label;
    //    __weak typeof(UILabel) *weakLab2 = label2;
    
    //    UILabel *tmpLab = [[UILabel alloc] init];
    //    tmpLab.text = @"tmp";
    //    __weak typeof(UILabel) *weakLab = tmpLab;
    //    void (^action)() = ^(){
    //
    //        tmpLab.text = @"tmpLab";
    //        weakLab.text = @"hhhhhhh";
    //        NSLog(@"tmpLab :%@",tmpLab);
    //
    //        __strong typeof(UILabel) *strongLab = weakLab;
    //        strongLab.text = @"ggggggggg";
    //        __strong typeof(UILabel) *strongLab2 = weakLab2;
    //
    //        strongLab.text = @"block";
    //        weakLab.text = @"BLOCK";
    //        label.text = @"12345";
    //        label2.text = @"6789";
    //        NSLog(@"weakLab   = %@",weakLab);
    //        NSLog(@"strongLab = %@",strongLab);
    //        NSLog(@"strongLab2= %@",strongLab2);
    //
    //        strongLab = nil;
    //        strongLab2 = nil;
    //        label2 = nil;
    //        NSLog(@"strongLab2= %@",strongLab2);
    //        NSLog(@"strongLab = %@",strongLab);
    //        NSLog(@"label     = %@",label);
    //        NSLog(@"label2    = %@",label2);
    //        NSLog(@"\n");
    //    };
    //
    //
    //
    //    action();
    //    weakLab = nil;
    //    NSLog(@"weakLab :%@",weakLab);
    //    NSLog(@"tmpLab :%@",tmpLab);
    //    label = nil;
    //    NSLog(@"weakLab = %@",weakLab);
    //    NSLog(@"weakLab2= %@",weakLab2);
    //    NSLog(@"label   = %@",label);
    //    NSLog(@"label2  = %@",label2);
    //    NSLog(@"\n");
    
    
    //btn1
    UIButton *btn1=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn1.frame=CGRectMake((self.view.frame.size.width-200)/2+40, 70, 120, 40);
    [btn1 setTitle:@"testGlobalObj" forState:UIControlStateNormal];
    [btn1 addTarget:self action:@selector(btnAction1) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn1];
    
    //btn2
    UIButton *btn2=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn2.frame=CGRectMake((self.view.frame.size.width-200)/2+40, 120, 120, 40);
    [btn2 setTitle:@"testStaticObj" forState:UIControlStateNormal];
    [btn2 addTarget:self action:@selector(btnAction2) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn2];
    
    //btn3
    UIButton *btn3=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn3.frame=CGRectMake((self.view.frame.size.width-200)/2+40, 170, 120, 40);
    [btn3 setTitle:@"testLocalObj" forState:UIControlStateNormal];
    [btn3 addTarget:self action:@selector(btnAction3) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn3];
    
    //btn4
    UIButton *btn4=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn4.frame=CGRectMake((self.view.frame.size.width-200)/2+40, 220, 120, 40);
    [btn4 setTitle:@"testBlockObj" forState:UIControlStateNormal];
    [btn4 addTarget:self action:@selector(btnAction4) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn4];
    
    //btn5
    UIButton *btn5=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn5.frame=CGRectMake((self.view.frame.size.width-200)/2+40, 270, 120, 40);
    [btn5 setTitle:@"testWeakObj" forState:UIControlStateNormal];
    [btn5 addTarget:self action:@selector(btnAction5) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn5];
    
    
    //btn6
    UIButton *btn6=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn6.frame=CGRectMake((self.view.frame.size.width-200)/2+40, 320, 120, 40);
    [btn6 setTitle:@"testCycle" forState:UIControlStateNormal];
    [btn6 addTarget:self action:@selector(btnAction6) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn6];
    
    
}



#pragma mark - response
- (void) btnAction1 {
    [self testGlobalObj];
}

- (void) btnAction2 {
    
    [self testStaticObj];
}

-(void) btnAction3 {
    
    [self testLocalObj];
}

-(void) btnAction4 {
    
    [self testBlockObj];
}

-(void) btnAction5 {
    
    [self testWeakObj];
}

//测试block循环引用
-(void) btnAction6 {
    
    TestRetainCycle *obj = [[TestRetainCycle alloc] init];
    
    NSArray *arr = [[NSArray alloc] initWithObjects:@"1", @"2", nil];
    obj.array = arr;
    //    NSLog(@"obj.array %@", obj.array);
    //    arr = nil;
    obj.array = nil;
    NSLog(@"obj.array %@", obj.array);
    NSLog(@"arr %@", arr);
    //    obj = nil;
}


NSString *__globalString = nil;

- (void)testGlobalObj

{
    __globalString = @"1";
    void (^TestBlock)(void) = ^{
        NSLog(@"string is :%@", __globalString); //string is :(null)
    };
    __globalString = nil;
    TestBlock();
}



- (void)testStaticObj

{
    static NSString *__staticString = nil;
    __staticString = @"1";
    
    printf("static address: %p\n", &__staticString);     //static address: 0x6a8c
    void (^TestBlock)(void) = ^{
        printf("static address: %p\n", &__staticString); //static address: 0x6a8c
        NSLog(@"string is : %@", __staticString); //string is : (null)
    };
    
    __staticString = nil;
    TestBlock();
}


- (void)testLocalObj

{
    NSString *__localString = nil;
    __localString = @"1";
    printf("local address: %p\n", &__localString); //local address: 0xbfffd9c0
    
    void (^TestBlock)(void) = ^{
        printf("local address: %p\n", &__localString); //local address: 0x71723e4
        NSLog(@"string is : %@", __localString); //string is : 1
    };
    
    __localString = nil;
    TestBlock();
}



- (void)testBlockObj

{
    __block NSString *_blockString = @"1";
    void (^TestBlock)(void) = ^{
        NSLog(@"string is : %@", _blockString); //string is : (null)
    };
    
    _blockString = nil;
    TestBlock();
}


- (void)testWeakObj

{
    NSString *__localString = @"1";
    __weak NSString *weakString = __localString;
    printf("weak address: %p\n", &weakString);    //weak address: 0xbfffd9c4
    printf("weak str address: %p\n", weakString); //weak str address: 0x684c
    
    void (^TestBlock)(void) = ^{
        printf("weak address: %p\n", &weakString);    //weak address: 0x7144324
        printf("weak str address: %p\n", weakString); //weak str address: 0x684c
        NSLog(@"string is : %@", weakString);         //string is :1
        
    };
    __localString = nil;
    TestBlock();
    
}

@end
