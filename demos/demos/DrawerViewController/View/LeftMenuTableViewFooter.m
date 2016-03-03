//
//  LeftMenuTableViewFooter.m
//  ishealth
//
//  Created by kang on 15/11/10.
//  Copyright © 2015年 cmcc. All rights reserved.
//

#import "LeftMenuTableViewFooter.h"

@interface LeftMenuTableViewFooter()

@property (nonatomic,weak) UIButton *settingBtn;
@property (nonatomic,weak) UIButton *dayBtn;
@property (nonatomic,weak) UIView *line;
@property (nonatomic,weak) NSTimer *timer;
@property (nonatomic,assign) BOOL nightSkinIsdown;
@property (nonatomic,assign) int count;
@end

@implementation LeftMenuTableViewFooter


-(instancetype)init
{
    self = [super init];
    if (self) {
        
       self.backgroundColor=[UIColor colorWithRed:29/255. green:29/255. blue:29/255. alpha:1];
    }
    return self;
}


@end
