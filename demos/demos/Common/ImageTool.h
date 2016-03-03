//
//  ImageTool.h
//  demos
//
//  Created by kang on 16/1/26.
//  Copyright © 2016年 kang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ImageTool : NSObject

+ (UIImage *)reSizeImage:(UIImage *)image toSize:(CGSize)reSize;

//图片大小缩放
+(UIImage*) OriginImage:(UIImage *)image scaleToSize:(CGSize)size;

@end
