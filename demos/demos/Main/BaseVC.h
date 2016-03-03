//
//  BaseVC.h
//  ishealth
//
//  Created by kang on 15/11/17.
//  Copyright © 2015年 cmcc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MSDynamicsTransDelegate.h"

@interface BaseVC : UIViewController
@property (nonatomic) id<MSDynamicsTransDelegate> msdelegate;
@property (nonatomic) int currentInex;

@end
