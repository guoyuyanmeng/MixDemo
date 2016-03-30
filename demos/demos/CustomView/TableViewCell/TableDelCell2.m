//
//  TableDelCell2.m
//  demos
//
//  Created by kang on 16/3/28.
//  Copyright © 2016年 kang. All rights reserved.
//

#import "TableDelCell2.h"
#import "Masonry.h"


@interface TableDelCell2 ()
{
    UIView *_rightView;
    CellStatus cellState;
    CGFloat _panStartPoint;
    UITableView *_tableView;
}
@end



@implementation TableDelCell2

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (id) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
//        [self createButton];
    }
    
    return self;
}


- (void) createButton{
    self.contentView.backgroundColor = [UIColor whiteColor];
    //rightView
    UIView *rightView = [[UIView alloc]init];
    _rightView = rightView;
//    [self insertSubview:_rightView belowSubview:self.contentView];
    [self.contentView addSubview:_rightView];
    
    
    // 添加删除按钮
    UIButton *delBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [delBtn setTitle:@"删除" forState:UIControlStateNormal];
    delBtn.backgroundColor = [UIColor redColor];
    delBtn.titleLabel.font = [UIFont systemFontOfSize:20];
    delBtn.frame = CGRectMake(0, 0, 120, 0);
    //    [delBtn addTarget:self action:@selector(buyAction:) forControlEvents:UIControlEventTouchUpInside];
    [rightView addSubview:delBtn];
    
    
    //添加购物按钮
    UIButton *buyBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [buyBtn setTitle:@"购买" forState:UIControlStateNormal];
    buyBtn.backgroundColor = [UIColor grayColor];
    buyBtn.titleLabel.font = [UIFont systemFontOfSize:20];
    buyBtn.frame = CGRectMake(0, 0, 120, 0);
    //    [delBtn addTarget:self action:@selector(buyAction:) forControlEvents:UIControlEventTouchUpInside];
    [rightView addSubview:buyBtn];
    
    
    
    delBtn.translatesAutoresizingMaskIntoConstraints = NO;
    //trailing
    [self addConstraint:[NSLayoutConstraint constraintWithItem:delBtn
                                                     attribute:NSLayoutAttributeTrailing
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:rightView
                                                     attribute:NSLayoutAttributeTrailing
                                                    multiplier:1
                                                      constant:0]];
    //top
    [self addConstraint:[NSLayoutConstraint constraintWithItem:delBtn
                                                     attribute:NSLayoutAttributeTop
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:rightView
                                                     attribute:NSLayoutAttributeTop
                                                    multiplier:1
                                                      constant:0]];
    //bottom
    [self addConstraint:[NSLayoutConstraint constraintWithItem:delBtn
                                                     attribute:NSLayoutAttributeBottom
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:rightView
                                                     attribute:NSLayoutAttributeBottom
                                                    multiplier:1
                                                      constant:0]];
    //width
    [self addConstraint:[NSLayoutConstraint constraintWithItem:delBtn
                                                     attribute:NSLayoutAttributeWidth
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:nil
                                                     attribute:NSLayoutAttributeNotAnAttribute
                                                    multiplier:1
                                                      constant:delBtn.frame.size.width]];
    
    
    buyBtn.translatesAutoresizingMaskIntoConstraints = NO;
    //trailing
    [self addConstraint:[NSLayoutConstraint constraintWithItem:buyBtn
                                                     attribute:NSLayoutAttributeTrailing
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:delBtn
                                                     attribute:NSLayoutAttributeLeading
                                                    multiplier:1
                                                      constant:0]];
    //top
    [self addConstraint:[NSLayoutConstraint constraintWithItem:buyBtn
                                                     attribute:NSLayoutAttributeTop
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self
                                                     attribute:NSLayoutAttributeTop
                                                    multiplier:1
                                                      constant:0]];
    //bottom
    [self addConstraint:[NSLayoutConstraint constraintWithItem:buyBtn
                                                     attribute:NSLayoutAttributeBottom
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self
                                                     attribute:NSLayoutAttributeBottom
                                                    multiplier:1
                                                      constant:0]];
    //width
    [self addConstraint:[NSLayoutConstraint constraintWithItem:buyBtn
                                                     attribute:NSLayoutAttributeWidth
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:nil
                                                     attribute:NSLayoutAttributeNotAnAttribute
                                                    multiplier:1
                                                      constant:buyBtn.frame.size.width]];
    
    /****     rightView     *****/
    rightView.translatesAutoresizingMaskIntoConstraints = NO;
    //trailing
    [self addConstraint:[NSLayoutConstraint constraintWithItem:rightView
                                                     attribute:NSLayoutAttributeLeading
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self.contentView
                                                     attribute:NSLayoutAttributeTrailing
                                                    multiplier:1
                                                      constant:0]];
    //top
    [self addConstraint:[NSLayoutConstraint constraintWithItem:rightView
                                                     attribute:NSLayoutAttributeTop
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self.contentView
                                                     attribute:NSLayoutAttributeTop
                                                    multiplier:1
                                                      constant:0]];
    //bottom
    [self addConstraint:[NSLayoutConstraint constraintWithItem:rightView
                                                     attribute:NSLayoutAttributeBottom
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self.contentView
                                                     attribute:NSLayoutAttributeBottom
                                                    multiplier:1
                                                      constant:0]];
    //width
    [self addConstraint:[NSLayoutConstraint constraintWithItem:rightView
                                                     attribute:NSLayoutAttributeWidth
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:nil
                                                     attribute:NSLayoutAttributeNotAnAttribute
                                                    multiplier:1
                                                      constant:buyBtn.frame.size.width +delBtn.frame.size.width]];
    
    
    
    
}
@end
