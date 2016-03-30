//
//  TableDelCell.h
//  demos
//
//  Created by kang on 16/3/23.
//  Copyright © 2016年 kang. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    CellStatusClose,
    CellStatusOpen,
} CellStatus;

static const void *cellStatus = "cellStatus";

@interface TableDelCell : UITableViewCell

//- (void) createButtonContrntView ;
@end
