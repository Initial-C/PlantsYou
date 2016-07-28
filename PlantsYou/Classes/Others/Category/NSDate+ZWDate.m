//
//  NSDate+ZWDate.m
//  BeeSi
//
//  Created by Mr.C on 16/6/27.
//  Copyright © 2016年 Mr.C. All rights reserved.
//

#import "NSDate+ZWDate.h"

@implementation NSDate (ZWDate)

- (BOOL)isThisYear
{
    // 获取当前时间
    NSDate *currentDate = [NSDate date];
    // 当前日历
    NSCalendar *calendar = [NSCalendar currentCalendar];
    // 从当前时间以日历获取当前年份
    NSDateComponents *curComp = [calendar components:NSCalendarUnitYear fromDate:currentDate];
    
    // 从需要判断的时间获取需要判断的年份
    NSDateComponents *comp = [calendar components:NSCalendarUnitYear fromDate:self];
    
    return curComp.year == comp.year;
    
}
- (BOOL)isThisToday
{
    // 日历类
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    return  [calendar isDateInToday:self];
}

- (BOOL)isThisYesterday
{
    // 日历类
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    return [calendar isDateInYesterday:self];
}

- (NSDateComponents *)deltaWithNow
{
    // 获取当前时间
    NSDate *currentDate = [NSDate date];
    // 日历类
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    // 获取两个日期差值 从(fromDate)指定时间到当前时间(toDate) 时间格式: 小时:分钟  wrap包
    return  [calendar components:NSCalendarUnitHour | NSCalendarUnitMinute fromDate:self toDate:currentDate options:NSCalendarWrapComponents];
}

@end
