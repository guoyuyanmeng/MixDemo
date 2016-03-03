//
//  NetWorker.m
//  demos
//
//  Created by kang on 16/1/26.
//  Copyright © 2016年 kang. All rights reserved.
//

#import "NetWorker.h"
#import <UIKit/UIKit.h>


@implementation NetWorker


static NetWorker* _instance = nil;

+(instancetype) shareInstance
{
    static dispatch_once_t onceToken ;
    dispatch_once(&onceToken, ^{
        _instance = [[self alloc] init] ;
    }) ;
    
    return _instance ;
}

+(id) allocWithZone:(struct _NSZone *)zone
{
    return [NetWorker shareInstance] ;
}

-(id) copyWithZone:(struct _NSZone *)zone
{
    return [NetWorker shareInstance] ;
}



-(AFHTTPSessionManager *)baseHtppRequest{
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager.requestSerializer setTimeoutInterval:20];
    //header 设置
    
    //    [manager.requestSerializer setValue:K_PASS_IP forHTTPHeaderField:@"Host"];
    //    [manager.requestSerializer setValue:@"max-age=0" forHTTPHeaderField:@"Cache-Control"];
    //    [manager.requestSerializer setValue:@"text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8" forHTTPHeaderField:@"Accept"];
    //    [manager.requestSerializer setValue:@"zh-cn,zh;q=0.8,en-us;q=0.5,en;q=0.3" forHTTPHeaderField:@"Accept-Language"];
    //    [manager.requestSerializer setValue:@"gzip, deflate" forHTTPHeaderField:@"Accept-Encoding"];
    //    [manager.requestSerializer setValue:@"keep-alive" forHTTPHeaderField:@"Connection"];
    //    [manager.requestSerializer setValue:@"Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:35.0) Gecko/20100101 Firefox/35.0" forHTTPHeaderField:@"User-Agent"];
    
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/plain", @"text/html",@"application/javascript",@"application/json", nil];
    
    return manager;
}

-(void)getResultWithParameter:(NSDictionary *)parameter url:(NSString *)url successBlock:(SuccessBlock)successBlock failureBlock:(FailureBlock)failureBlock
{
    AFHTTPSessionManager *manager = [self baseHtppRequest];
//    NSString *urlStr = [url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSString *urlStr = [url stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLPathAllowedCharacterSet]];
    
    [manager GET:urlStr parameters:parameter success:^(NSURLSessionDataTask *task, id responseObject)
     {
         successBlock(responseObject);
         
     }
         failure:^(NSURLSessionDataTask *task, NSError *error)
     {
         NSString *errorStr = [error.userInfo objectForKey:@"NSLocalizedDescription"];
         failureBlock(errorStr);
     }];
    
    
}

-(void)postResultWithParameter:(NSDictionary *)parameter url:(NSString *)url successBlock:(SuccessBlock)successBlock failureBlock:(FailureBlock)failureBlock
{
    AFHTTPSessionManager *manager = [self baseHtppRequest];
//    NSString *urlStr = [url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSString *urlStr = [url stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLPathAllowedCharacterSet]];
    [manager POST:urlStr
       parameters:parameter
          success:^(NSURLSessionDataTask *task, id responseObject){
        successBlock(responseObject);
    }
          failure:^(NSURLSessionDataTask *task, NSError *error){
        NSString *errorStr = [error.userInfo objectForKey:@"NSLocalizedDescription"];
        failureBlock(errorStr);
    }];
}

-(void)upImageWithParameter:(NSDictionary *)parameter imageArray:(NSArray *)images url:(NSString *)url successBlock:(SuccessBlock)successBlock failureBlock:(FailureBlock)failureBlock
{
    
    AFHTTPSessionManager *manger=[self baseHtppRequest];
//    NSString *urlStr=[url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSString *urlStr = [url stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLPathAllowedCharacterSet]];
    
    [manger POST:urlStr parameters:parameter constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
        
        for (int i=1; i<=images.count; i++) {
            
            NSData *imageData=UIImageJPEGRepresentation(images[i-1], 1.0);
            
            [formData appendPartWithFileData:imageData name:[NSString stringWithFormat:@"image%d",i] fileName:@"image" mimeType:@"image/jpg"];
        }
        
    } success:^(NSURLSessionDataTask *task, id responseObject) {
        successBlock(responseObject);
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        NSString *errorStr = [error.userInfo objectForKey:@"NSLocalizedDescription"];
        failureBlock(errorStr);
    }];
}



- (NSDictionary *) uploadPic:(UIImage *)image {
    UIApplication *app = [UIApplication sharedApplication];
    app.networkActivityIndicatorVisible = YES;
    
    
//    NSDictionary * dit = [NSDictionary dictionaryWithObjectsAndKeys:@"status",@"SUCCESS", nil];
    NSDictionary * dit = [NSDictionary dictionaryWithObjectsAndKeys:@"status",@"FAILURE", nil];
    return  dit;
}


@end
