//
//  DrawerViewController.h
//  ishealth
//
//  Created by kang on 15/11/14.
//  Copyright © 2015年 cmcc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "User.h"
//
//@protocol MSDynamicsTransDelegate <NSObject>
//@optional
//- (void)transitionToVC:(int)index withUrl:(BOOL )type;
//- (void)changeLeftReverseButtonFunction:(int)funtype sender:(UIViewController *)uivc action:(SEL)section;
//- (void)needChangeAvatarInMenu:(User *)userdata;
//- (void)transitionToPlan;
//@end


typedef NS_OPTIONS(NSInteger, LeftMenuDirection) {
    LeftMenuDirectionNone       = UIRectEdgeNone, //0
    LeftMenuDirectionTop        = UIRectEdgeTop,  //1
    LeftMenuDirectionLeft       = UIRectEdgeLeft, //2
    LeftMenuDirectionBottom     = UIRectEdgeBottom,//4
    LeftMenuDirectionRight      = UIRectEdgeRight,//8
    LeftMenuDirectionHorizontal = (UIRectEdgeLeft | UIRectEdgeRight),//10
    LeftMenuDirectionVertical   = (UIRectEdgeTop | UIRectEdgeBottom),//5
};

typedef NS_ENUM(NSInteger, LeftMenuState) {
    LeftMenuStateClosed,   // Drawer view entirely hidden by pane view
    LeftMenuStateOpen,     // Drawer view revealed to open width
    LeftMenuStateOpenWide, // Drawer view entirely visible
};

typedef void (^DrawerActionBlock)(LeftMenuDirection maskedValue);

@interface DrawerViewController : UIViewController

@property (nonatomic, assign) BOOL shouldAlignStatusBarToPaneView;


@property (nonatomic, strong) UIViewController *paneViewController;
@property (nonatomic, strong) UIViewController *drawerViewController;
@property (nonatomic, assign) LeftMenuState paneState;

@property (nonatomic, strong) UIView *drawerView;
@property (nonatomic, strong) UIView *paneView;


- (void)setPaneState:(LeftMenuState)paneState animated:(BOOL)animated allowUserInterruption:(BOOL)allowUserInterruption completion:(void (^)(void))completion;

- (void)setPaneState:(LeftMenuState)paneState inDirection:(LeftMenuDirection)direction animated:(BOOL)animated allowUserInterruption:(BOOL)allowUserInterruption completion:(void (^)(void))completion;

- (void)setPaneViewController:(UIViewController *)paneViewController animated:(BOOL)animated completion:(void (^)(void))completion;
- (void)setDrawerViewController:(UIViewController *)drawerViewController forDirection:(LeftMenuDirection)direction;

- (CGFloat)revealWidthForDirection:(LeftMenuDirection)direction;
- (void)addStylersFromArray:(NSArray *)stylers forDirection:(LeftMenuDirection)direction;

//- (void)setPaneViewController:(UIViewController *)newPaneViewController;
@end
