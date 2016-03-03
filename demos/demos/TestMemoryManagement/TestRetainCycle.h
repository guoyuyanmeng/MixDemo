//
//  TestRetainCycle.h
//  demos
//
//  Created by kang on 16/2/3.
//  Copyright © 2016年 kang. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^MyBlock)();
@interface TestRetainCycle : NSObject

@property (nonatomic, strong) MyBlock myblock  ;
@property (nonatomic, weak) NSArray *array;
@end
