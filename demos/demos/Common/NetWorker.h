//
//  NetWorker.h
//  demos
//
//  Created by kang on 16/1/26.
//  Copyright © 2016年 kang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "AFNetworking.h"

typedef void(^SuccessBlock)(id responseBody);
typedef void(^FailureBlock)(NSString *error);


@interface NetWorker : NSObject

+(instancetype) shareInstance ;

- (NSDictionary *) uploadPic:(UIImage *)image;

#pragma mark - GET
-(void)getResultWithParameter:(NSDictionary *)parameter url:(NSString *)url successBlock:(SuccessBlock)successBlock failureBlock:(FailureBlock)failureBlock;

#pragma mark - POST
-(void)postResultWithParameter:(NSDictionary *)parameter url:(NSString *)url successBlock:(SuccessBlock)successBlock failureBlock:(FailureBlock)failureBlock;

#pragma mark - AFN上传照片
-(void)upImageWithParameter:(NSDictionary *)parameter imageArray:(NSArray *)images url:(NSString *)url successBlock:(SuccessBlock)successBlock failureBlock:(FailureBlock)failureBlock;

@end
