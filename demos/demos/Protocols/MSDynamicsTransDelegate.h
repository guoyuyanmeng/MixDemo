//
//  MSDynamicsTransDelegate.h
//  demos
//
//  Created by kang on 16/1/26.
//  Copyright © 2016年 kang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "User.h"

@protocol MSDynamicsTransDelegate <NSObject>

@optional
//- (void)transitionToVC:(int)paneViewControllerType withUrl:(BOOL )type;
//- (void)changeLeftReverseButtonFunction:(int)funtype sender:(UIViewController *)uivc action:(SEL)section;
//- (void)needChangeAvatarInMenu:(User *)userdata;
//- (void)transitionToPlan;
- (void)transitionToVC:(int)index withUrl:(BOOL )type;
- (void)changeLeftReverseButtonFunction:(int)funtype sender:(UIViewController *)uivc action:(SEL)section;
- (void)needChangeAvatarInMenu:(User *)userdata;
- (void)transitionToPlan;

@end
