//
//  LeftMenuTableView.m
//  ishealth
//
//  Created by kang on 15/11/10.
//  Copyright © 2015年 cmcc. All rights reserved.
//

#import "LeftMenu.h"
#import "LeftMenuViewController.h"
#import "APIConstant.h"

NSString * const LeftMenuTableViewCellReuseIdentifier = @"LeftMenuTableview Cell";
NSString * const LeftMenuTableViewHeaderFooterReuseIdentifier = @"LeftMenuTableview Header";

@interface LeftMenu()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic, strong) NSArray *_R;
@property (nonatomic, strong) NSArray *_G;
@property (nonatomic, strong) NSArray *_B;
@end

@implementation LeftMenu
@synthesize _R,_G,_B;

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self._R=[[NSArray alloc]initWithObjects:@(95),@(147),@(237),@(250),@(205),@(95),@(50),@(152),@(173),nil];
        self._G=[[NSArray alloc]initWithObjects:@(206),@(211),@(192),@(46),@(118),@(229),@(133),@(251),@(255),nil];
        self._B=[[NSArray alloc]initWithObjects:@(168),@(85),@(55),@(44),@(184),@(202),@(24),@(152),@(47),nil];
        self.backgroundColor=[UIColor colorWithRed:29/255. green:29/255. blue:29/255. alpha:1];
        
        //添加一个tableView
//        UITableView *tableview = [[UITableView alloc] init];
//        tableview.delegate = self;
//        tableview.dataSource = self;
//        self.tableView = tableview;

        self.delegate = self;
        self.dataSource = self;
        self.backgroundColor = [UIColor clearColor];
        self.separatorColor = [UIColor blackColor];
        
        [self registerClass:[LeftMenuTableViewCell class] forCellReuseIdentifier:LeftMenuTableViewCellReuseIdentifier];
//        [self registerClass:[LeftMenuTableViewHeader class]
//            forHeaderFooterViewReuseIdentifier:LeftMenuTableViewHeaderFooterReuseIdentifier];
        
        //添加头部的View
        LeftMenuTableViewHeader *headerView = [[LeftMenuTableViewHeader alloc]
                                               initWithFrame:CGRectMake(0, 0, screen_width, 300)];
        _headerView = headerView;
        self.separatorColor = [UIColor lightGrayColor];
        self.contentInset = UIEdgeInsetsMake(-200, 0, 0, 0);
        self.tableHeaderView = _headerView;
        
        //设置初始化就选中第一行
        NSIndexPath *indexPath =[NSIndexPath indexPathForRow:0 inSection:0];
        [self selectRowAtIndexPath:indexPath animated:NO scrollPosition:UITableViewScrollPositionNone];

        
//        [self registerClass:[LeftMenuTableViewCell class] forCellReuseIdentifier:LeftMenuTableViewCellReuseIdentifier];
//        [self.tableView registerClass:[LeftMenuTableViewHeader class]
//   forHeaderFooterViewReuseIdentifier:LeftMenuTableViewHeaderFooterReuseIdentifier];
//        self.tableView.backgroundColor = [UIColor clearColor];
//        self.tableView.separatorColor = [UIColor blackColor];
        
        
//        //添加头部的View
//        LeftMenuTableViewHeader *headerView = [[LeftMenuTableViewHeader alloc] init];
//        _headerView = headerView;
//        self.tableView.separatorColor = [UIColor lightGrayColor];
//        self.tableView.contentInset = UIEdgeInsetsMake(0, 0, 0, 0);
//        //        [self addSubview:_headerView];
//        self.tableView.tableHeaderView = _headerView;
        
        
        //        //添加底部的View
        //        LeftMenuTableViewFooter *footerView = [[LeftMenuTableViewFooter alloc] init];
        //        _footView = footerView;
        //        _tableView.tableFooterView = _footView;
        
//        //设置初始化就选中第一行
//        NSIndexPath *indexPath =[NSIndexPath indexPathForRow:0 inSection:0];
//        [self.tableView selectRowAtIndexPath:indexPath animated:NO scrollPosition:UITableViewScrollPositionNone];
//    
//        [self addSubview:self.tableView];
        
 
    }
    return self;
}


-(void) layoutSubviews {

    [super layoutSubviews];
//    CGFloat W = self.frame.size.width;
//    CGFloat footH = 30;
//    _headerView.frame = CGRectMake(0, 0, W, 100);
//    _tableView.frame = CGRectMake(0, 0, W, self.frame.size.height-100);
//    _footView.frame = CGRectMake(0, self.frame.size.height - footH - 20, W, footH);
    
}


#pragma mark UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return 6;
    } else {
        return 3;
    }
    
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    
    UITableViewHeaderFooterView *headerView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:LeftMenuTableViewHeaderFooterReuseIdentifier];
    headerView.backgroundColor = [UIColor blueColor];
    
    return headerView;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    
    
    return [UIView new]; // Hacky way to prevent extra dividers after the end of the table from showing
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 10.0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    if (section == 1) {
        return 10.0;
    }else {
    
        return CGFLOAT_MIN;
    }
//    return CGFLOAT_MIN; // Hacky way to prevent extra dividers after the end of the table from showing
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
//    NSDictionary *dict = self.lists[indexPath.row];
    NSDictionary *dict = self.lists[indexPath.section][indexPath.row];
    NSLog(@"section=%d,row=%d",indexPath.section,indexPath.row);
    NSLog(@"dict:%@",dict);
    
    
    static NSString *idstr=@"cell";
    LeftMenuTableViewCell *cell=(LeftMenuTableViewCell *)[tableView dequeueReusableCellWithIdentifier:idstr];
    if (!cell) {
        
        cell=[[LeftMenuTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:idstr];
        
        if (indexPath.section==0)
        {
            
            if (indexPath.row==0)
            {
                cell.imageview.image=[UIImage imageNamed:dict[@"image_on"]];
                cell.label.textColor=[UIColor colorWithRed:79.0/255 green:165.0/255 blue:218.0/255 alpha:1.];
            }
            else
            {
                cell.imageview.image=[UIImage imageNamed:dict[@"image_off"]];
            }
            
            cell.r=[[_R objectAtIndex:indexPath.row] floatValue]/255.0;
            cell.g=[[_G objectAtIndex:indexPath.row] floatValue]/255.0;
            cell.b=[[_B objectAtIndex:indexPath.row] floatValue]/255.0;
        }
        else
        {
            cell.imageview.image=[UIImage imageNamed:dict[@"image_off"]];
            cell.r=[[_R objectAtIndex:indexPath.row+6] floatValue]/255.0;
            cell.g=[[_G objectAtIndex:indexPath.row+6] floatValue]/255.0;
            cell.b=[[_B objectAtIndex:indexPath.row+6] floatValue]/255.0;
        }
        
        cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
        cell.label.text = dict[@"title"];
        
    }
    
    return cell;
}


#pragma mark UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSDictionary *dict = self.lists[indexPath.section][indexPath.row];
    
    LeftMenuTableViewCell *cell=(LeftMenuTableViewCell *)[tableView cellForRowAtIndexPath:indexPath];
    cell.imageview.image = [UIImage imageNamed:dict[@"image_on"]];
    cell.label.textColor=[UIColor colorWithRed:79.0/255 green:165.0/255 blue:218.0/255 alpha:1.];
    
    if ([self.leftDelegate respondsToSelector:@selector(leftMenuDidSeletedPathForClass:title:)]) {
        Class targetClass = NSClassFromString (dict[@"class"]);
        [self.leftDelegate leftMenuDidSeletedPathForClass:targetClass title:dict[@"title"]];
    }

}

- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    NSDictionary *dict = self.lists[indexPath.section][indexPath.row];
//
    LeftMenuTableViewCell *cell=(LeftMenuTableViewCell *)[tableView cellForRowAtIndexPath:indexPath];
    cell.imageview.image = [UIImage imageNamed:dict[@"image_off"]];
    cell.label.textColor = [UIColor whiteColor];
//    cell.selectedBackgroundView.backgroundColor =  [CommonTool colorWithHexString:@"#668fc823"];
//
//    Class viewController = dict[@"class"];
//    BaseVC *baseViewController = (BaseVC *) [viewController new];
//    baseViewController.navigationItem.title = dict[@"title"];
    
    

}


@end
