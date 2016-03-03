//
//  LeftMenuTableView.h
//  ishealth
//
//  Created by kang on 15/11/10.
//  Copyright © 2015年 cmcc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LeftMenuTableViewHeader.h"
#import "LeftMenuTableViewCell.h"
#import "LeftMenuTableViewFooter.h"

@protocol LeftMenuDegelate <NSObject>

-(void)leftMenuDidSeletedPathForClass:(Class)viewController title:(NSString *)title;

@end

@interface LeftMenu : UITableView

//@property (nonatomic, weak) UITableView *tableView;
@property (nonatomic, weak) LeftMenuTableViewFooter *footView;
@property (nonatomic, weak) LeftMenuTableViewHeader *headerView;

@property (nonatomic, weak) id <LeftMenuDegelate> leftDelegate;
@property (nonatomic,strong) NSArray *lists;
@end
