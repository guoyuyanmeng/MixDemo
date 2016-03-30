//
//  TableViewCell.m
//  demos
//
//  Created by kang on 16/3/22.
//  Copyright © 2016年 kang. All rights reserved.
//

#import "TableViewCell.h"
#import "Masonry.h"
#import "AppDelegate.h"

@interface TableViewCell ()
{
    UIButton *delBtn;
    UIButton *buyBtn;
    
//    UIView *move;

}
@end


@implementation TableViewCell

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
        
    }
    
    return self;
}

- (void) createSubviews {

    __weak typeof(self) weakSelf = self;
    
//    delBtn = [UIButton buttonWithType:UIButtonTypeCustom];
//    [delBtn setTitle:@"删除" forState:UIControlStateNormal];
//    delBtn.backgroundColor = [UIColor redColor];
//    delBtn.titleLabel.font = [UIFont systemFontOfSize:20];
////    [delBtn addTarget:self action:@selector(buyAction:) forControlEvents:UIControlEventTouchUpInside];
//    [self addSubview:delBtn];
//    
//    [delBtn mas_makeConstraints:^(MASConstraintMaker *make){
//        make.edges.equalTo(weakSelf).with.insets(UIEdgeInsetsMake(0, weakSelf.frame.size.width-60, 1, 2));
//    }];
    
    //
    buyBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [buyBtn setTitle:@"购买" forState:UIControlStateNormal];
    buyBtn.backgroundColor = [UIColor grayColor];
    buyBtn.titleLabel.font = [UIFont systemFontOfSize:20];
    //    [delBtn addTarget:self action:@selector(buyAction:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:buyBtn];
    
    [buyBtn mas_makeConstraints:^(MASConstraintMaker *make){
//        make.width.equalTo(weakSelf.delBtn);
//        make.height.equalTo(weakSelf.delBtn);
//        make.right.equalTo(weakSelf.delBtn.mas_left);
        make.edges.equalTo(weakSelf).with.insets(UIEdgeInsetsMake(0, weakSelf.frame.size.width-60, 1, 2));
    }];


}


#pragma mark - setter
- (UIButton *) delBtn{
    return delBtn;
}

- (UIButton *) buyBtn{
    return buyBtn;
}

#pragma mark - private methods 

@end
