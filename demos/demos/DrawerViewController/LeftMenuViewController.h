//
//  MainViewController.h
//  ishealth
//
//  Created by kang on 15/11/9.
//  Copyright © 2015年 cmcc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VPImageCropperViewController.h"
#import "DrawerViewController.h"
#import "AppDelegate.h"
#import "MSDynamicsTransDelegate.h"


@interface LeftMenuViewController : UIViewController <UIActionSheetDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate,VPImageCropperDelegate,MSDynamicsTransDelegate> {

}
@property (nonatomic, assign) DrawerViewController *drawerViewController;

- (void) initHomeViewControllerClass:(Class)homeClass title:(NSString *)title;
//- (void) didSeletedPathForClass:(Class)indexClass title:(NSString *)title;
@end
