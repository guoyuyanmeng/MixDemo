//
//  TableDelCell.m
//  demos
//
//  Created by kang on 16/3/23.
//  Copyright © 2016年 kang. All rights reserved.
//

#import "TableDelCell.h"
#import "Masonry.h"
#import <objc/runtime.h>



@interface TableDelCell ()<UIGestureRecognizerDelegate>
{
    UIView *_rightView;
    CellStatus cellState;
    CGFloat _panStartPoint;
    UITableView *_tableView;
}
@end


@implementation TableDelCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}



- (void) createButton:(UITableView *)tableview {
    self.contentView.backgroundColor = [UIColor whiteColor];
    //rightView
    UIView *rightView = [[UIView alloc]init];
    _rightView = rightView;
    [self insertSubview:_rightView belowSubview:self.contentView];
    [self.contentView addSubview:_rightView];
    
    // 添加删除按钮
    UIButton *delBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [delBtn setTitle:@"删除" forState:UIControlStateNormal];
    delBtn.backgroundColor = [UIColor redColor];
    delBtn.titleLabel.font = [UIFont systemFontOfSize:20];
    delBtn.frame = CGRectMake(0, 0, 120, 0);
//    [delBtn addTarget:self action:@selector(buyAction) forControlEvents:UIControlEventTouchUpInside];
    [rightView addSubview:delBtn];

    
    //添加购物按钮
    UIButton *buyBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [buyBtn setTitle:@"购买" forState:UIControlStateNormal];
    buyBtn.backgroundColor = [UIColor grayColor];
    buyBtn.titleLabel.font = [UIFont systemFontOfSize:20];
    buyBtn.frame = CGRectMake(0, 0, 120, 0);
    [delBtn addTarget:self action:@selector(buyAction) forControlEvents:UIControlEventTouchUpInside];
    [rightView addSubview:buyBtn];
    
    
    
    
    /****     delBtn     *****/
    //删除按钮布局
    //    [delBtn mas_makeConstraints:^(MASConstraintMaker *make){
    //        make.edges.equalTo(weakSelf).with.insets(UIEdgeInsetsMake(0, weakSelf.frame.size.width-60, 1, 2));
    //    }];
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
    /****     buyBtn     *****/
    //购物按钮布局
//    __weak typeof(UIView) *weakView = rightView;
//    [buyBtn mas_makeConstraints:^(MASConstraintMaker *make){
//        //                make.width.equalTo(weakBtn);
//        //                make.height.equalTo(weakBtn);
//        //                make.right.equalTo(weakBtn.mas_left);
//        make.edges.equalTo(weakView).with.insets(UIEdgeInsetsMake(0, -delBtn.frame.size.width, 0, delBtn.frame.size.width));
//    }];

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
//    //trailing
//    [self addConstraint:[NSLayoutConstraint constraintWithItem:rightView
//                                                     attribute:NSLayoutAttributeTrailing
//                                                     relatedBy:NSLayoutRelationEqual
//                                                        toItem:self
//                                                     attribute:NSLayoutAttributeTrailing
//                                                    multiplier:1
//                                                      constant:0]];
//    //top
//    [self addConstraint:[NSLayoutConstraint constraintWithItem:rightView
//                                                     attribute:NSLayoutAttributeTop
//                                                     relatedBy:NSLayoutRelationEqual
//                                                        toItem:self
//                                                     attribute:NSLayoutAttributeTop
//                                                    multiplier:1
//                                                      constant:0]];
//    //bottom
//    [self addConstraint:[NSLayoutConstraint constraintWithItem:rightView
//                                                     attribute:NSLayoutAttributeBottom
//                                                     relatedBy:NSLayoutRelationEqual
//                                                        toItem:self
//                                                     attribute:NSLayoutAttributeBottom
//                                                    multiplier:1
//                                                      constant:0]];
//    //width
//    [self addConstraint:[NSLayoutConstraint constraintWithItem:rightView
//                                                     attribute:NSLayoutAttributeWidth
//                                                     relatedBy:NSLayoutRelationEqual
//                                                        toItem:nil
//                                                     attribute:NSLayoutAttributeNotAnAttribute
//                                                    multiplier:1
//                                                      constant:buyBtn.frame.size.width +delBtn.frame.size.width]];
    
    
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

    [self addGestureRecognizerForCell];
    
    _tableView = tableview;
}


- (void)openManual
{
    
    NSNumber *status = (NSNumber *)objc_getAssociatedObject(_tableView, cellStatus);
    cellState =  (CellStatus)[status integerValue];
    //    _cellState = (CellStatus)[[_tableView valueForKey:@"_cellStatus"] integerValue];
    
    if (cellState == CellStatusOpen) {
        return ;
    }else {
        [UIView animateWithDuration:.3 animations:^{
            self.contentView.frame = ({
                CGRect f = self.contentView.frame;
                f.origin.x = - _rightView.frame.size.width;
                f;
            });
        } completion:^(BOOL finished) {
            cellState = CellStatusOpen;
            //        [self.superview setValue:@"1" forKey:@"_cellStatus"];
            NSNumber *status = [NSNumber numberWithInteger:CellStatusOpen];
            objc_setAssociatedObject(_tableView, cellStatus, status, OBJC_ASSOCIATION_ASSIGN);
        }];
    }
}



- (void)closeManual
{
    [UIView animateWithDuration:.3 animations:^{
        self.contentView.frame = ({
            CGRect f = self.contentView.frame;
            f.origin.x = 0;
            f;
        });
    } completion:^(BOOL finished) {
        cellState = CellStatusClose;
        
        NSNumber *status = [NSNumber numberWithInteger:CellStatusClose];
        objc_setAssociatedObject(_tableView, cellStatus, status, OBJC_ASSOCIATION_ASSIGN);
//        [self.superview setValue:@"0" forKey:@"_cellStatus"];
    }];
}


- (void) addGestureRecognizerForCell {
    
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panHandler:)];
    pan.delegate = self;
    [self addGestureRecognizer:pan];
}

-(void) panHandler:(UIPanGestureRecognizer *)panGesture {
    
    if (cellState == CellStatusOpen) {
        [self closeManual];
        return;
    }
    
    switch (panGesture.state) {
        case UIGestureRecognizerStateBegan:
            if (cellState == CellStatusOpen) {
                
            }else{
                _panStartPoint = [panGesture locationInView:self.contentView].x;
            }
            break;
        case UIGestureRecognizerStateChanged:
            if (cellState == CellStatusOpen) {
                return;
            }
            if (_panStartPoint > [panGesture locationInView:self.contentView].x ) {
                self.contentView.frame = ({
                    CGRect f = self.contentView.frame;
                    f.origin.x = [panGesture locationInView:self.contentView].x - _panStartPoint;
                    f;
                });
            }
            break;
        case UIGestureRecognizerStateEnded:
            if (cellState == CellStatusOpen) {
                return;
            }
            
            if (abs((int)self.contentView.frame.origin.x) > _rightView.frame.size.width/2) {
                [self openManual];
                
            }else{
                [self closeManual];
            }
            break;
        default:
            break;
    }

}

- (void) buyAction {
    NSLog(@"buyAction");
    [_tableView setEditing:NO animated:YES];
//    [_tableView setZoomScale:<#(CGFloat)#> animated:<#(BOOL)#>]
}

#pragma mark - UIGestureRecognizerDelegate
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer
{
    
    return YES;
}

@end
