//
//  NSDate+ZWDate.h
//  BeeSi
//
//  Created by Mr.C on 16/6/27.
//  Copyright © 2016年 Mr.C. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (ZWDate)

// 判断下是否是今年
- (BOOL)isThisYear;

// 是否是今天
- (BOOL)isThisToday;

// 是否是昨天
- (BOOL)isThisYesterday;

// 获取与当前时间差值
- (NSDateComponents *)deltaWithNow;

@end
