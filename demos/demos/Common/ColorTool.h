//
//  ColorTool.h
//  demos
//
//  Created by kang on 16/1/26.
//  Copyright © 2016年 kang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ColorTool : NSObject

//将string类型颜色转换成 RGB 等颜色代码值
+ (UIColor *) colorWithHexString: (NSString *) hexString;


@end
