//
//  User.m
//  ishealth
//
//  Created by ishanghealth on 14-5-14.
//  Copyright (c) 2014年 cmcc. All rights reserved.
//

#import "User.h"



@implementation User

@synthesize device_bp,device_bs,device_wt,fid,_id,nickname,password,pic,birth,email,height,name,phoneNum,sex,weight;
@synthesize status;

static User *_userInstance = nil;
+ (instancetype) shareInstance
{
    static dispatch_once_t onceToken ;
    dispatch_once(&onceToken, ^{
        _userInstance = [[self alloc] init] ;
        
        NSUserDefaults *userDefaults=[NSUserDefaults standardUserDefaults];
        _userInstance.device_bp=[userDefaults objectForKey:@"devide_bp"];
        _userInstance.device_bs=[userDefaults objectForKey:@"device_bs"];
        _userInstance.device_wt=[userDefaults objectForKey:@"device_wt"];
        _userInstance.fid=[userDefaults objectForKey:@"fid"];
        _userInstance._id=[userDefaults objectForKey:@"id"];
        _userInstance.nickname=[userDefaults objectForKey:@"nickname"];
        _userInstance.password=[userDefaults objectForKey:@"password"];
        _userInstance.pic=[userDefaults objectForKey:@"pic"];
        _userInstance.birth=[userDefaults objectForKey:@"birth"];
        _userInstance.email=[userDefaults objectForKey:@"email"];
        _userInstance.height=[userDefaults objectForKey:@"height"];
        _userInstance.name=[userDefaults objectForKey:@"name"];
        _userInstance.phoneNum=[userDefaults objectForKey:@"phonenum"];
        _userInstance.sex=[userDefaults objectForKey:@"sex"];
        _userInstance.weight=[userDefaults objectForKey:@"weight"];
        _userInstance.status=[userDefaults objectForKey:@"status"];
        
    }) ;
    
    return _userInstance ;
}

+(id) allocWithZone:(struct _NSZone *)zone
{
    return [User shareInstance] ;
}

-(id) copyWithZone:(struct _NSZone *)zone
{
    return [User shareInstance] ;
}



+(User *)pasersubUser:(id)data
{
    User *user=[[User alloc]init];
    if ([data isKindOfClass:[NSDictionary class]]) {
       
        NSArray *keys=[data allKeys];
        for (NSString *key in keys) {
         
            id subValue=[data objectForKey:key];
            if ([key isEqualToString:@"device_bp"]) {
                
                user.device_bp=subValue;
            }
            if ([key isEqualToString:@"device_bs"]) {
                user.device_bs=subValue;
            }
            if ([key isEqualToString:@"device_wt"]) {
                user.device_wt=subValue;
            }
            if ([key isEqualToString:@"fid"]) {
                user.fid=subValue;
            }
            if ([key isEqualToString:@"id"]) {
                user._id=subValue;
            }
            if ([key isEqualToString:@"nickname"]) {
                
                user.nickname=subValue;
            }
            if ([key isEqualToString:@"password"]) {
                
                user.password=subValue;
            }
            if ([key isEqualToString:@"pic"]) {
                
                user.pic=subValue;
            }
            if ([key isEqualToString:@"userbirth"]) {
                
                user.birth=subValue;
            }
            if ([key isEqualToString:@"useremail"]) {
                
                user.email=subValue;
            }
            if ([key isEqualToString:@"userheight"]) {
                
                user.height=subValue;
            }
            if ([key isEqualToString:@"username"]) {
                user.name=subValue;
            }
            if ([key isEqualToString:@"userphone"]) {
                
                user.phoneNum=subValue;
            }
            if ([key isEqualToString:@"usersex"]) {
                
                user.sex=subValue;
            }
            if ([key isEqualToString:@"userweight"]) {
                
                user.weight=subValue;
            }
        }
        
    }
    return user;
}

+(User *)paserUser:(id)data

{
    User *user=[[User alloc]init];
    
    if ([data isKindOfClass:[NSDictionary class]]) {

        NSArray *keys=[data allKeys];
        for (NSString *key in keys) {
            id value=[data objectForKey:key];

            if ([key isEqualToString:@"patient"]) {
                if ([value isKindOfClass:[NSDictionary class]]) {
                   
                    NSArray *subKeys=[value allKeys];
                    
                    for (NSString *subKey in subKeys) {
                        id subValue=[value objectForKey:subKey];
                        
                        if ([subKey isEqualToString:@"device_bp"]) {
                            
                            user.device_bp=subValue;
                        }
                        if ([subKey isEqualToString:@"device_bs"]) {
                            user.device_bs=subValue;
                        }
                        if ([subKey isEqualToString:@"device_wt"]) {
                            user.device_wt=subValue;
                        }
                        if ([subKey isEqualToString:@"fid"]) {
                            user.fid=subValue;
                        }
                        if ([subKey isEqualToString:@"id"]) {
                            user._id=subValue;
                        }
                        if ([subKey isEqualToString:@"nickname"]) {
                            
                            user.nickname=subValue;
                        }
                        if ([subKey isEqualToString:@"password"]) {
                            
                            user.password=subValue;
                        }
                        if ([subKey isEqualToString:@"pic"]) {
                            
                            user.pic=subValue;
                        }
                        if ([subKey isEqualToString:@"userbirth"]) {
                            
                            user.birth=subValue;
                        }
                        if ([subKey isEqualToString:@"useremail"]) {
                            
                            user.email=subValue;
                        }
                        if ([subKey isEqualToString:@"userheight"]) {
                            
                            user.height=subValue;
                        }
                        if ([subKey isEqualToString:@"username"]) {
                            user.name=subValue;
                        }
                        if ([subKey isEqualToString:@"userphone"]) {
                            
                            user.phoneNum=subValue;
                        }
                        if ([subKey isEqualToString:@"usersex"]) {
                            
                            user.sex=subValue;
                        }
                        if ([subKey isEqualToString:@"userweight"]) {
                            
                            user.weight=subValue;
                        }
                        
                    }
                }

            }
            if ([key isEqualToString:@"status"]) {
                user.status=value;
            }
            
        }
    
    }
    
    return user;
}



@end
