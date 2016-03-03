//
//  DrawerStyler.h
//  ishealth
//
//  Created by kang on 15/11/17.
//  Copyright © 2015年 cmcc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DrawerViewController.h"
#import "LeftMenuViewController.h"
@protocol DrawerStyler <NSObject>
+ (instancetype)styler;
/**
 Invoked when the `MSDynamicsDrawerViewController` has an update to its pane closed fraction.
 
 @param dynamicsDrawerViewController The `MSDynamicsDrawerViewController` that is being styled by the `MSDynamicsDrawerStyler` instance.
 @param paneClosedFraction The fraction that `MSDynamicsDrawerViewController` instance's pane is closed. `1.0` when closed, `0.0` when opened.
 @param direction The direction that the `MSDynamicsDrawerViewController` instance is opening in. Will not be masked.
 */
- (void)dynamicsDrawerViewController:(DrawerViewController *)dynamicsDrawerViewController didUpdatePaneClosedFraction:(CGFloat)paneClosedFraction forDirection:(LeftMenuDirection)direction;

@optional

/**
 Used to set up the appearance of the styler when it is added to a `MSDynamicsDrawerViewController` instance.
 
 @param dynamicsDrawerViewController The `MSDynamicsDrawerViewController` that is now being styled by the `MSDynamicsDrawerStyler` instance.
 */
- (void)stylerWasAddedToDynamicsDrawerViewController:(DrawerViewController *)dynamicsDrawerViewController;

/**
 Used to tear down the appearance of the styler when it is removed from a `MSDynamicsDrawerViewController` instance.
 
 @param dynamicsDrawerViewController The `MSDynamicsDrawerViewController` that was being styled by the `MSDynamicsDrawerStyler` instance.
 */
- (void)stylerWasRemovedFromDynamicsDrawerViewController:(DrawerViewController *)dynamicsDrawerViewController;

@end

/**
 Creates a parallax effect on the `drawerView` while sliding the `paneView` within a `MSDynamicsDrawerViewController`.
 */
@interface DrawerParallaxStyler : NSObject <DrawerStyler>

/**
 The amount that the parallax should offset the `drawerView` when the `paneView` is closed, as a fraction of the visible reveal width.
 
 `0.35` by default.
 */
@property (nonatomic, assign) CGFloat parallaxOffsetFraction;

@end

/**
 Creates a fade effect on the `drawerView` while sliding the `paneView` within a `MSDynamicsDrawerViewController`.
 */
@interface DrawerFadeStyler : NSObject <DrawerStyler>

/**
 The amount that the `drawerView` is faded when the `paneView` is closed.
 
 The `drawerView` is faded from the `closedAlpha` when closed to 1.0 when open. `0.0` by default.
 */
@property (nonatomic, assign) CGFloat closedAlpha;

@end

/**
 Creates a zoom-in scaling effect on the `drawerView` while sliding the `paneView` within a `MSDynamicsDrawerViewController`.
 */
@interface DrawerScaleStyler : NSObject <DrawerStyler>

/**
 The amount that the `drawerView` is scaled when the `paneView` is closed. The `drawerView` is transformed from the `closedScale` when closed to 1.0 when open. `0.1` by default.
 */
@property (nonatomic, assign) CGFloat closedScale;


@end
