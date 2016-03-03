//
//  ViewController1.m
//  demos
//
//  Created by kang on 16/2/11.
//  Copyright © 2016年 kang. All rights reserved.
//

#import "ViewController1.h"
#import "SDCycleScrollView.h"
#import "APIConstant.h"
#import "NSString+Times.h"
#import "NetWorker.h"
#import "TOPdata.h"
#import "NewShowData.h"
#import "ChanelData.h"
#import "MJExtension.h"

//接口地址
#define TOP_URl @"http://www.douyutv.com/api/v1/slide/6"

#define NEW_URl @"http://www.douyutv.com/api/v1/home_newbie_list?aid=ios&auth=3c0837ba99e8506db591b7971dfb20c2&client_sys=ios&time="

#define NEW_Image_URl @"http://uc.douyutv.com/upload/avatar"

#define NEW_Time_URl @"_avatar_big.jpg?upt="

#define CHANEL_URl @"http://www.douyutv.com/api/v1/channel?aid=ios&auth=6a4c6b01d851ceece76aee1980b9e5bb&client_sys=ios&limit=4&time="

@interface ViewController1 () <SDCycleScrollViewDelegate>
{
    SDCycleScrollView *_headView;
    
    NSMutableArray *_topDataArray;
    NSMutableArray *_imageArray;
    NSMutableArray *_titleArray;
    
    NSMutableArray *_NewDataArray;
    
    NSMutableArray *_ChanelDataArray;
    NSMutableArray *_ChanelDatas;
}
@end

@implementation ViewController1


- (id) init {
    
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
//    
//    [self loadChanelData];
//    
    [self loadTopData];
//    [self loadNewShowData];
//    
    [self initHeadView];
//    [self initTableView];
    
    _topDataArray=[NSMutableArray array];
    _imageArray=[NSMutableArray array];
    _titleArray=[NSMutableArray array];
    
//    _NewDataArray=[NSMutableArray array];
//    
//    _ChanelDataArray=[NSMutableArray array];
//    _ChanelDatas=[NSMutableArray array];
    
    
};


-(void)loadTopData
{
    
    NSDictionary *parameteiDic=@{@"aid":@"ios",@"auth":@"97d9e4d3e9dfab80321d11df5777a107",@"client_sys":@"ios",@"time":[NSString GetNowTimes]};
    
    [[NetWorker shareInstance] getResultWithParameter:parameteiDic
                                                  url:TOP_URl
                                         successBlock:^(id responseBody) {
        
        _topDataArray=[TOPdata mj_objectArrayWithKeyValuesArray:[responseBody objectForKey:@"data"]];
        
        
        for (TOPdata *topdata in _topDataArray) {
            
            [_imageArray addObject:topdata.pic_url];
            
            [_titleArray addObject:topdata.title];
        }
        
        _headView.imageURLStringsGroup=_imageArray;
        _headView.titlesGroup=_titleArray;
        
    }
                                         failureBlock:^(NSString *error) {
//        NSLog(@"Error:%@",error);
    }];
    
}

- (void) initHeadView
{
    _headView=[SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, screen_width, 200*KWidth_Scale) imageURLStringsGroup:_imageArray];
    _headView.titlesGroup=_titleArray;
    _headView.placeholderImage=[UIImage imageNamed:@"Img_default"];
    _headView.delegate=self;
    _headView.pageControlStyle=SDCycleScrollViewPageContolStyleClassic;
    _headView.pageControlAliment = SDCycleScrollViewPageContolAlimentRight;
    _headView.titleLabelTextFont=[UIFont systemFontOfSize:17];
    [self.view addSubview:_headView];
    
}

#pragma mark - delegates
#pragma mark cycleScrollView delegate
- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index
{
    
//    TOPdata *topdata=_topDataArray[index];
//    
//    PlayerController *playVC=[[PlayerController alloc]init];
//    
//    NSLog(@"%@",[topdata.room objectForKey:@"hls_url"]);
//    
//    playVC.Hls_url=[topdata.room objectForKey:@"hls_url"];
//    
//    [self setHidesBottomBarWhenPushed:YES];
//    [self presentViewController:playVC animated:YES completion:nil];
    
    
}

@end
