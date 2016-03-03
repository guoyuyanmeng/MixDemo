//
//  LeftTableViewCell.m
//  ishealth
//
//  Created by kang on 15/11/10.
//  Copyright © 2015年 cmcc. All rights reserved.
//

#import "LeftMenuTableViewCell.h"
#import "ColorTool.h"

@implementation LeftMenuTableViewCell

@synthesize r;
@synthesize g;
@synthesize b;
@synthesize imageview;
@synthesize label;

#pragma mark - UITableViewCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        UIView *selectedBackgroundView = [UIView new];
        selectedBackgroundView.backgroundColor = [ColorTool colorWithHexString:@"#668fc823"];
        self.selectedBackgroundView = selectedBackgroundView;
        
        
        UIImageView *_imageView=[[UIImageView alloc]initWithFrame:CGRectMake(15, (self.frame.size.height-27)/2, 28, 27)];
        _imageView.backgroundColor=[UIColor clearColor];
        self.imageview=_imageView;
        [self.contentView addSubview:_imageView];
        
        UILabel *_label=[[UILabel alloc]initWithFrame:CGRectMake(55, (self.frame.size.height-30)/2, 150, 30)];
        _label.numberOfLines=1;
        _label.textColor=[UIColor whiteColor];
        _label.font=[UIFont systemFontOfSize:17];
        _label.backgroundColor=[UIColor clearColor];
        self.label=_label;
        [self.contentView addSubview:_label];
        
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetRGBStrokeColor(context, self.r, self.g, self.b, 1.0f);
    
    CGContextSetLineWidth(context, 10.0f);
    CGContextMoveToPoint(context, 0, .5);
    CGContextAddLineToPoint(context, 0, self.frame.size.height-.5);
    CGContextStrokePath(context);
    
    [super drawRect:rect];
    
}


@end
