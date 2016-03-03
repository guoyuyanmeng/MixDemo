//
//  MangerUser.h
//  demos
//
//  Created by kang on 16/1/26.
//  Copyright © 2016年 kang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "User.h"

@interface MangerUser : NSObject

//获取本地用户信息
+ (User *) getUser;

// 同步用户信息到本地
+(void) synchronizeUser;

//删除本地用户信息
+(void)removeLoginUser;

//获取是否是第一次使用引导图
+ (BOOL) getIsFirtGuide;
//标记引导图已经使用过
+ (void) setIsFirstGuide;
@end
