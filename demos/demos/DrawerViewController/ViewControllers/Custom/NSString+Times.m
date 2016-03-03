//
//  NSString+Times.m
//  demos
//
//  Created by kang on 16/2/13.
//  Copyright © 2016年 kang. All rights reserved.
//

#import "NSString+Times.h"

@implementation NSString (Times)

+(NSString *)GetNowTimes
{
    NSDate* date = [NSDate dateWithTimeIntervalSinceNow:0];
    NSTimeInterval a=[date timeIntervalSince1970];
    NSString *timeString = [NSString stringWithFormat:@"%.0f",a];
    return timeString;
}
@end
