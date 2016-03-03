//
//  TestRetainCycle.m
//  demos
//
//  Created by kang on 16/2/3.
//  Copyright © 2016年 kang. All rights reserved.
//

#import "TestRetainCycle.h"
#import "NSArray+Dealloc.h"

@interface TestRetainCycle ()



@end

#define TestCycleRetainCase1 0
#define TestCycleRetainCase2 0
#define TestCycleRetainCase3 0
#define TestCycleRetainCase4 0
@implementation TestRetainCycle


- (void)dealloc

{
      NSLog(@"no cycle retain");
}


- (id)init

{
    self = [super init];
    if (self) {

        if (TestCycleRetainCase1){
            //会循环引用
            self.myblock = ^{
                [self doSomething];
            };
        }else if (TestCycleRetainCase2) {

            //会循环引用
            __block TestRetainCycle *weakSelf = self;
            self.myblock = ^{
                [weakSelf doSomething];
            };
            
        }else if (TestCycleRetainCase3){
            
            //不会循环引用
            __weak TestRetainCycle *weakSelf = self;
            self.myblock = ^{
                [weakSelf doSomething];
            };
        }else if (TestCycleRetainCase4) {
        
            //不会循环引用
            __unsafe_unretained TestRetainCycle *weakSelf = self;
            self.myblock = ^{
                [weakSelf doSomething];
            };
        }
        
        
        NSLog(@"myblock is %@", self.myblock);
    }
    
    return self;
}


- (void)doSomething
{
    NSLog(@"do Something");
}


@end
