//
//  MangerUser.m
//  demos
//
//  Created by kang on 16/1/26.
//  Copyright © 2016年 kang. All rights reserved.
//

#import "MangerUser.h"

@implementation MangerUser

//获取本地用户信息
+ (User *) getUser {
    
    User *user = [User shareInstance];
    
    NSUserDefaults *userDefaults=[NSUserDefaults standardUserDefaults];
    user.device_bp=[userDefaults objectForKey:@"devide_bp"];
    user.device_bs=[userDefaults objectForKey:@"device_bs"];
    user.device_wt=[userDefaults objectForKey:@"device_wt"];
    user.fid=[userDefaults objectForKey:@"fid"];
    user._id=[userDefaults objectForKey:@"id"];
    user.nickname=[userDefaults objectForKey:@"nickname"];
    user.password=[userDefaults objectForKey:@"password"];
    user.pic=[userDefaults objectForKey:@"pic"];
    user.birth=[userDefaults objectForKey:@"birth"];
    user.email=[userDefaults objectForKey:@"email"];
    user.height=[userDefaults objectForKey:@"height"];
    user.name=[userDefaults objectForKey:@"name"];
    user.phoneNum=[userDefaults objectForKey:@"phonenum"];
    user.sex=[userDefaults objectForKey:@"sex"];
    user.weight=[userDefaults objectForKey:@"weight"];
    user.status=[userDefaults objectForKey:@"status"];
    
    return user;
}

// 同步用户信息到本地
+(void) synchronizeUser
{
    User *user = [User shareInstance];
    NSUserDefaults *userDefaults=[NSUserDefaults standardUserDefaults];
    [userDefaults setObject:user.device_bp forKey:@"devide_bp"];
    [userDefaults setObject:user.device_bs forKey:@"device_bs"];
    [userDefaults setObject:user.device_wt forKey:@"device_wt"];
    [userDefaults setObject:user.fid forKey:@"fid"];
    [userDefaults setObject:user._id forKey:@"id"];
    [userDefaults setObject:user.nickname forKey:@"nickname"];
    [userDefaults setObject:user.password forKey:@"password"];
    [userDefaults setObject:user.pic forKey:@"pic"];
    [userDefaults setObject:user.birth forKey:@"birth"];
    [userDefaults setObject:user.email forKey:@"email"];
    [userDefaults setObject:user.height forKey:@"height"];
    [userDefaults setObject:user.name forKey:@"name"];
    [userDefaults setObject:user.phoneNum forKey:@"phonenum"];
    [userDefaults setObject:user.sex forKey:@"sex"];
    [userDefaults setObject:user.weight forKey:@"weight"];
    [userDefaults setObject:user.status forKey:@"status"];
    
    [[NSUserDefaults standardUserDefaults] synchronize];
    
}

//删除本地用户信息
+(void)removeLoginUser
{
    
    NSUserDefaults *userDefault=[NSUserDefaults standardUserDefaults];
    
    [userDefault removeObjectForKey:@"devide_bp"];
    [userDefault removeObjectForKey:@"device_bs"];
    [userDefault removeObjectForKey:@"device_wt"];
    [userDefault removeObjectForKey:@"fid"];
    [userDefault removeObjectForKey:@"id"];
    [userDefault removeObjectForKey:@"nickname"];
    [userDefault removeObjectForKey:@"password"];
    [userDefault removeObjectForKey:@"pic"];
    [userDefault removeObjectForKey:@"birth"];
    [userDefault removeObjectForKey:@"email"];
    [userDefault removeObjectForKey:@"height"];
    [userDefault removeObjectForKey:@"name"];
    [userDefault removeObjectForKey:@"phonenum"];
    [userDefault removeObjectForKey:@"sex"];
    [userDefault removeObjectForKey:@"weight"];
    [userDefault removeObjectForKey:@"subUsers"];
    [userDefault removeObjectForKey:@"status"];
    
    [[NSUserDefaults standardUserDefaults] synchronize];
    
}

@end
