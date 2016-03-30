//
//  TableViewCell.h
//  demos
//
//  Created by kang on 16/3/22.
//  Copyright © 2016年 kang. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface TableViewCell : UITableViewCell

//- (id) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier;

- (void) createSubviews;

- (UIButton *) delBtn;

- (UIButton *) buyBtn;

@end
