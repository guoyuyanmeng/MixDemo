//
//  ShopingCart.m
//  demos
//
//  Created by kang on 16/3/22.
//  Copyright © 2016年 kang. All rights reserved.
//

#import "ShopingCart.h"

@interface ShopingCart (){
    
    NSInteger shopingCount;//购物车数量
}

@end
@implementation ShopingCart

static ShopingCart* _instance = nil;

+(instancetype) shareInstance
{
    static dispatch_once_t onceToken ;
    dispatch_once(&onceToken, ^{
        _instance = [[self alloc] init] ;
    }) ;
    
    return _instance ;
}

+(id) allocWithZone:(struct _NSZone *)zone
{
    return [ShopingCart shareInstance] ;
}

-(id) copyWithZone:(struct _NSZone *)zone
{
    return [ShopingCart shareInstance] ;
}

@end
