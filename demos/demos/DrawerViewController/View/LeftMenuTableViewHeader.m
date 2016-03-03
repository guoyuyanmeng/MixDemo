//
//  LeftMenuTableView.m
//  ishealth
//
//  Created by kang on 15/11/10.
//  Copyright © 2015年 cmcc. All rights reserved.
//

#import "LeftMenuTableViewHeader.h"
#import "SDImageCache.h"
#import "SDWebImageManager.h"
#import "UIImageView+AFNetworking.h"
#import "APIConstant.h"
#import "User.h"
#import "ImageTool.h"
#import "MangerUser.h"
@interface LeftMenuTableViewHeader ()


@end
@implementation LeftMenuTableViewHeader
@synthesize switchingButton;
@synthesize settingButton;
@synthesize titleNameLabel;
@synthesize titleAvatar;


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
//        UIView *backgoundView = [UIView new];
//        backgoundView.backgroundColor=[UIColor colorWithRed:29/255. green:29/255. blue:29/255. alpha:1];
//        backgoundView.backgroundColor =[[CommonTool colorWithHexString:@"#4e90ef"] colorWithAlphaComponent:0.3];
//        self.backgroundView = backgoundView;
        [self setImage:[UIImage imageNamed:@"menu_upimage"]];
        self.backgroundColor = [UIColor colorWithRed:29/255. green:29/255. blue:29/255. alpha:1];
        
        [self buildUI];
        
    }
    return self;
}

-(void)drawRect:(CGRect)rect
{
    //画线
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetRGBStrokeColor(context, 227./255, 247./255, 36./255, 1.0f);
    CGContextSetLineWidth(context, 3.f);
    CGContextMoveToPoint(context, 0, self.bounds.size.height);
    CGContextAddLineToPoint(context, self.bounds.size.width, self.bounds.size.height);
    CGContextStrokePath(context);
    
}

-(void) buildUI {

    User *user=[MangerUser getUser];
    
    //用户头像
    titleAvatar = [[UIImageView alloc]initWithFrame:CGRectMake(10, 216, 72, 72)];
    titleAvatar.userInteractionEnabled = YES;
    titleAvatar.layer.masksToBounds = YES;
    titleAvatar.layer.cornerRadius = 36;
    titleAvatar.contentMode = UIViewContentModeScaleAspectFill;
    titleAvatar.layer.borderColor = [[UIColor whiteColor] CGColor];
    titleAvatar.layer.borderWidth = 2.0f;
    [titleAvatar setImageWithURL:[NSURL URLWithString:[AVRTAR_URL stringByAppendingString:user.pic]] placeholderImage:[UIImage imageNamed:@"unknow_avatar.png"]];
    
    UITapGestureRecognizer *portraitTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(avtarTap)];
    [self.titleAvatar addGestureRecognizer:portraitTap];
    
    //用户名
    titleNameLabel = [[UILabel alloc]initWithFrame:CGRectMake(92, 236, 60, 20)];
    titleNameLabel.text = user.nickname;
    titleNameLabel.textColor=[UIColor whiteColor];
    [titleNameLabel setBackgroundColor:[UIColor clearColor]];
    
    //切换用户按钮
    switchingButton = [UIButton buttonWithType:UIButtonTypeCustom];
    switchingButton.frame = CGRectMake(75, 265, 100, 20);
    switchingButton.userInteractionEnabled = YES;
    switchingButton.enabled = YES;
    switchingButton.titleLabel.font=[UIFont systemFontOfSize:15];
    [switchingButton setImage:[ImageTool reSizeImage:[UIImage imageNamed:@"change_avatar_left_menu.png"] toSize:CGSizeMake(15,15)] forState:UIControlStateNormal];
    [switchingButton setTitle:@"切换帐号" forState:UIControlStateNormal];
    [switchingButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [switchingButton setTitleColor:[UIColor orangeColor] forState:UIControlStateHighlighted];
    [switchingButton setTitleColor:[UIColor orangeColor] forState:UIControlStateSelected];
    [switchingButton addTarget:self action:@selector(switchBtnClick) forControlEvents:UIControlEventTouchUpInside];

    //设置按钮
    settingButton = [UIButton buttonWithType:UIButtonTypeCustom];
    settingButton.frame = CGRectMake(170, 240, 80, 20);
    settingButton.userInteractionEnabled = YES;
    settingButton.enabled = YES;
    settingButton.hidden= YES;
    
    [settingButton setTitle:@"设置" forState:UIControlStateNormal];
    [settingButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [settingButton setTitleColor:[UIColor orangeColor] forState:UIControlStateHighlighted];
    [settingButton setTitleColor:[UIColor orangeColor] forState:UIControlStateSelected];
    settingButton.imageView.contentMode = UIViewContentModeScaleAspectFit;
    [settingButton setImage:[UIImage imageNamed:@"img_setting.png"] forState:UIControlStateNormal];
    [settingButton setImage:[UIImage imageNamed:@"img_setting_down.png"] forState:UIControlStateSelected];
    [settingButton addTarget:self action:@selector(settingBtnClick) forControlEvents:UIControlEventTouchUpInside];
    
    [self addSubview:titleAvatar];
    [self addSubview:switchingButton];
    [self addSubview:titleNameLabel];
    [self addSubview:settingButton];
}

- (void) avtarTap {
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"avtarClick" object:nil userInfo:nil];
}

- (void) switchBtnClick {

    [[NSNotificationCenter defaultCenter] postNotificationName:@"switchBtnClick" object:nil userInfo:nil];
}

- (void) settingBtnClick {
    [[NSNotificationCenter defaultCenter] postNotificationName:@"settingViewBtnClick" object:nil userInfo:nil];
}





@end
