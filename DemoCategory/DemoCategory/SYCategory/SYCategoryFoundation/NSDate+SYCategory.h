//
//  NSDate+SYCategory.h
//  zhangshaoyu
//
//  Created by zhangshaoyu on 16/6/25.
//  Copyright © 2016年 zhangshaoyu. All rights reserved.
//

#import <Foundation/Foundation.h>

/// 获取时间间隔
#define TICK   CFAbsoluteTime start = CFAbsoluteTimeGetCurrent();
#define TOCK   NSLog(@"Time: %f", CFAbsoluteTimeGetCurrent() - start)

/// 时间字符格式
typedef NS_ENUM(NSInteger, SYTimeShowMode)
{
    /// 自适应，即0的不再显示（含秒）
    SYTimeShowModeDefault = 0,
    
    /// 自适应，即0的不再显示（不含秒）
    SYTimeShowModeDefaultWithSecond,
    
    /// 天时分秒
    SYTimeShowModeDayHourMinuteSecond,
    
    /// 天时分
    SYTimeShowModeDayHourMinute,
    
    /// 时分秒
    SYTimeShowModeHourMinuteSecond,
    
    /// 时分
    SYTimeShowModeHourMinute,
};

@interface NSDate (SYCategory)

/**
 *  获取指定时间时间，并根据指定格式显示
 *
 *  @param format 时间显示格式
 *
 *  @return 指定显示格式时间
 */
- (NSString *)timeDateWithFormat:(NSString *)format;

/**
 *  计算两个日期距离现在多久
 *
 *  @param lastTime      上次日期
 *  @param lastFormat    上次日期格式
 *  @param currentTime   最近日期
 *  @param currentFormat 最近日期格式
 *
 *  @return 日期距离
 */
+ (NSString *)timeDateWithLastTime:(NSString *)lastTime lastTimeFormat:(NSString *)lastFormat currentTime:(NSString *)currentTime currentTimeFormat:(NSString *)currentFormat;


#pragma mark - 当前时间

/// 获取当前日期 NSDate（直接显示会出现相差8个小时，使用NSDateFormatter时间格式则不会）
+ (NSDate *)getCurrentDate;

/// 获取当前时间
+ (NSString *)getCurrentTime;

/// 获取当前年份
+ (NSInteger)getCurrentYear;

/// 获取当前月份
+ (NSInteger)getCurrentMonth;

/// 获取当前日期
+ (NSInteger)getCurrentDay;

/// 获取当前小时
+ (NSInteger)getCurrentHour;

/// 获取当前分钟
+ (NSInteger)getCurrentMinute;

/// 获取当前秒
+ (NSInteger)getCurrentSecond;

/// 获取当前星期
+ (NSString *)getCurrentWeekDay;


@end
