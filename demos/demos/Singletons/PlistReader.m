//
//  PlistReader.m
//  demos
//
//  Created by kang on 16/1/26.
//  Copyright © 2016年 kang. All rights reserved.
//

#import "PlistReader.h"

@implementation PlistReader

static PlistReader* _instance = nil;

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
    return [PlistReader shareInstance] ;
}

-(id) copyWithZone:(struct _NSZone *)zone
{
    return [PlistReader shareInstance] ;
}


- (NSDictionary*) getClassPistValueBySection:(NSInteger)section row:(NSInteger) row
{
    NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"list" ofType:@"plist"];
    NSArray *array = [[NSArray alloc] initWithContentsOfFile:plistPath];
    return array[section][row];
}

- (NSArray*) getClassPistArray
{
    NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"list" ofType:@"plist"];
    NSArray *array = [[NSArray alloc] initWithContentsOfFile:plistPath];
    return array;
}


@end
