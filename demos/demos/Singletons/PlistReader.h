//
//  PlistReader.h
//  demos
//
//  Created by kang on 16/1/26.
//  Copyright © 2016年 kang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PlistReader : NSObject

+(instancetype) shareInstance ;


- (NSDictionary*) getClassPistValueBySection:(NSInteger)section row:(NSInteger) row;

- (NSArray*) getClassPistArray;
@end
