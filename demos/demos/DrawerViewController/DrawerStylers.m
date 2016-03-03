//
//  DrawerStyler.m
//  ishealth
//
//  Created by kang on 15/11/17.
//  Copyright © 2015年 cmcc. All rights reserved.
//

#import "DrawerStylers.h"

#pragma mark - DrawerStyler
@implementation DrawerParallaxStyler
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.parallaxOffsetFraction = 0.35;
    }
    return self;
}

+ (instancetype)styler
{
    return [self new];
}

- (void)dynamicsDrawerViewController:(DrawerViewController *)drawerViewController
         didUpdatePaneClosedFraction:(CGFloat)paneClosedFraction
                        forDirection:(LeftMenuDirection)direction
{
//    NSLog(@"*****************************");
//    NSLog(@"**********   %f,%ld   ***********",paneClosedFraction,(long)direction);
//    NSLog(@"*****************************");
    CGFloat paneRevealWidth = [drawerViewController revealWidthForDirection:direction];
    CGFloat translate = ((paneRevealWidth * paneClosedFraction) * self.parallaxOffsetFraction);
    
    if (direction & (LeftMenuDirectionTop | LeftMenuDirectionLeft)) {
        translate = -translate;
    }
    CGAffineTransform drawerViewTransform = drawerViewController.drawerView.transform;
    if (direction & LeftMenuDirectionHorizontal) {
        drawerViewTransform.tx = CGAffineTransformMakeTranslation(translate, 0.0).tx;
    } else if (direction & LeftMenuDirectionVertical) {
        drawerViewTransform.ty = CGAffineTransformMakeTranslation(0.0, translate).ty;
    }
    drawerViewController.drawerView.transform = drawerViewTransform;
}

- (void)stylerWasRemovedFromDynamicsDrawerViewController:(DrawerViewController *)drawerViewController
{
    NSLog(@"************** DrawerParallaxStyler ***************");
    NSLog(@"**************  remove styler   ***************");
    
    CGAffineTransform translate = CGAffineTransformMakeTranslation(0.0, 0.0);
    CGAffineTransform drawerViewTransform = drawerViewController.drawerView.transform;
    drawerViewTransform.tx = translate.tx;
    drawerViewTransform.ty = translate.ty;
    drawerViewController.drawerView.transform = drawerViewTransform;
}

- (void)stylerWasAddedToDynamicsDrawerViewController:(DrawerViewController *)dynamicsDrawerViewController
{
    
    
}
@end


#pragma mark - DrawerFadeStyler
@implementation DrawerFadeStyler

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.closedAlpha = 0.0;
    }
    return self;
}

+ (instancetype)styler
{
    return [self new];
}

- (void)dynamicsDrawerViewController:(DrawerViewController *)drawerViewController didUpdatePaneClosedFraction:(CGFloat)paneClosedFraction forDirection:(LeftMenuDirection)direction
{
//    NSLog(@"************** DrawerFadeStyler ***************");
//    NSLog(@"**********   %f,%ld   ***********",paneClosedFraction,(long)direction);
//    NSLog(@"*****************************");
    drawerViewController.drawerView.alpha = ((1.0 - self.closedAlpha) * (1.0  - paneClosedFraction));
}

- (void)stylerWasRemovedFromDynamicsDrawerViewController:(DrawerViewController *)drawerViewController
{
    NSLog(@"************** DrawerFadeStyler ***************");
    NSLog(@"**************  remove styler   ***************");

    drawerViewController.drawerView.alpha = 1.0;
}

@end


#pragma mark - DrawerScaleStyler
@implementation DrawerScaleStyler

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.closedScale = 0.1;
    }
    return self;
}

+ (instancetype)styler
{
    return [self new];
}

- (void)dynamicsDrawerViewController:(DrawerViewController *)drawerViewController didUpdatePaneClosedFraction:(CGFloat)paneClosedFraction forDirection:(LeftMenuDirection)direction
{
//    NSLog(@"*********** DrawerScaleStyler ******************");
//    NSLog(@"**********   %f,%ld   ***********",paneClosedFraction,(long)direction);
//    NSLog(@"*****************************");
    
    CGFloat scale = (1.0 - (paneClosedFraction * self.closedScale));
    CGAffineTransform scaleTransform = CGAffineTransformMakeScale(scale, scale);
    CGAffineTransform drawerViewTransform = drawerViewController.drawerView.transform;
    drawerViewTransform.a = scaleTransform.a;
    drawerViewTransform.d = scaleTransform.d;
    drawerViewController.drawerView.transform = drawerViewTransform;
}

- (void)stylerWasRemovedFromDynamicsDrawerViewController:(DrawerViewController *)drawerViewController
{
    NSLog(@"************** DrawerScaleStyler ***************");
    NSLog(@"**************  remove styler   ***************");
    CGAffineTransform scaleTransform = CGAffineTransformMakeScale(1.0, 1.0);
    CGAffineTransform drawerViewTransform = drawerViewController.drawerView.transform;
    drawerViewTransform.a = scaleTransform.a;
    drawerViewTransform.d = scaleTransform.d;
    drawerViewController.drawerView.transform = drawerViewTransform;
}
@end
