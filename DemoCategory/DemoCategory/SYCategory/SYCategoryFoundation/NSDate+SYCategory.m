//
//  NSDate+SYCategory.m
//  zhangshaoyu
//
//  Created by zhangshaoyu on 16/6/25.
//  Copyright © 2016年 zhangshaoyu. All rights reserved.
//

#import "NSDate+SYCategory.h"

@implementation NSDate (SYCategory)

/**
 *  获取指定时间时间，并根据指定格式显示
 *
 *  @param format 时间显示格式
 *
 *  @return 指定显示格式时间
 */
- (NSString *)timeDateWithFormat:(NSString *)format
{
    NSDateFormatter *dateFormater = [[NSDateFormatter alloc] init];
    dateFormater.dateFormat = format;
    NSString *result = [dateFormater stringFromDate:self];
    return result;
}

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
+ (NSString *)timeDateWithLastTime:(NSString *)lastTime lastTimeFormat:(NSString *)lastFormat currentTime:(NSString *)currentTime currentTimeFormat:(NSString *)currentFormat
{
    // 上次时间
    NSDateFormatter *dateFormatLast = [[NSDateFormatter alloc] init];
    dateFormatLast.dateFormat = lastFormat;
    NSDate *dateLast = [dateFormatLast dateFromString:lastTime];
    
    // 当前时间
    NSDateFormatter *dateFormatNow = [[NSDateFormatter alloc] init];
    dateFormatNow.dateFormat = currentFormat;
    NSDate *dateNow = [dateFormatNow dateFromString:currentTime];
    
    NSTimeZone *timeZone = [NSTimeZone systemTimeZone];
    // 上次时间
    NSDate *lastDate = [dateLast dateByAddingTimeInterval:[timeZone secondsFromGMTForDate:dateLast]];
    // 当前时间
    NSDate *nowDate = [dateNow dateByAddingTimeInterval:[timeZone secondsFromGMTForDate:dateNow]];
    // 时间间距
    NSInteger intervalTime = [nowDate timeIntervalSinceReferenceDate] - [lastDate timeIntervalSinceReferenceDate];
    // 秒、分、小时、天、月、年
    NSInteger minutes = intervalTime / 60;
    NSInteger hours = intervalTime / 60 / 60;
    NSInteger day = intervalTime / 60 / 60 / 24;
    NSInteger month = intervalTime / 60 / 60 / 24 / 30;
    NSInteger years = intervalTime / 60 / 60 / 24 / 365;
    
    NSString *resutl = nil;
    if (minutes < 10)
    {
        resutl = @"刚刚";
    }
    else if (minutes < 60)
    {
        resutl = [NSString stringWithFormat:@"%@分钟前", @(minutes)];
    }
    else if (hours < 24)
    {
        resutl = [NSString stringWithFormat:@"%@小时前", @(hours)];
    }
    else if (day < 30)
    {
        resutl = [NSString stringWithFormat:@"%@天前", @(day)];
    }
    else if (month < 12)
    {
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        dateFormatter.dateFormat = @"M月d日";
        resutl = [dateFormatter stringFromDate:lastDate];
    }
    else if (years >=1)
    {
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        dateFormatter.dateFormat = @"yyyy年M月d日";
        resutl = [dateFormatter stringFromDate:lastDate];
    }
    
    return resutl;
}

#pragma mark - 转换（NSDateComponents/NSDate）

/// 时间转换成NSDateComponents
+ (NSDateComponents *)getDateComponents:(long long)time
{
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:time];
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSInteger unitFlags = NSMonthCalendarUnit | NSDayCalendarUnit | NSYearCalendarUnit | NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit;
    NSDateComponents *component = [calendar components:unitFlags fromDate:date];
    
    return component;
}

/// 日期转换成NSDateComponents
+ (NSDateComponents *)getDateCompontsWithDate:(NSDate *)date
{
    if (!date)
    {
        return nil;
    }
    
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSInteger unitFlags = NSMonthCalendarUnit | NSDayCalendarUnit | NSYearCalendarUnit |NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit | NSWeekCalendarUnit |NSWeekdayCalendarUnit;
    
    NSDateComponents *component = [calendar components:unitFlags fromDate:date];
    
    return component;
}

/// 获取任意时间秒数，即NSDate转NSTimeInterval
+ (NSTimeInterval)getTimeSecondWithDate:(NSDate *)date
{
    if (!date)
    {
        return 0;
    }
    
    NSDate *currentDate = date;
    NSTimeInterval timeSecond = [currentDate timeIntervalSince1970];
    
    return timeSecond;
}

/// 获取任意时间，即NSTimeInterval转NSDate
+ (NSDate *)getDateWithTime:(NSTimeInterval)time
{
    NSDate *date = [NSDate dateWithTimeIntervalSinceNow:time];
    return date;
}

#pragma mark - 年/月/日/周

/// 获取年份
+ (NSInteger)getYearWithDate:(NSDate *)date
{
    if (!date)
    {
        return 0;
    }
    
    NSDateComponents *component = [self getDateCompontsWithDate:date];
    
    NSInteger yearNumber = [component year];
    
    return yearNumber;
}

/// 获取月份
+ (NSInteger)getMonthWithDate:(NSDate *)date
{
    if (!date)
    {
        return 0;
    }
    
    NSDateComponents *component = [self getDateCompontsWithDate:date];
    
    NSInteger monthNumber = [component month];
    
    return monthNumber;
}

/// 获取日期
+ (NSInteger)getDayWithDate:(NSDate *)date
{
    if (!date)
    {
        return 0;
    }
    
    NSDateComponents *component = [self getDateCompontsWithDate:date];
    NSInteger dayNumber = [component day];
    return dayNumber;
}

/// 获取小时
+ (NSInteger)getHourWithDate:(NSDate *)date
{
    if (!date)
    {
        return 0;
    }
    
    NSDateComponents *component = [self getDateCompontsWithDate:date];
    NSInteger hour = [component hour];
    return hour;
}

/// 获取分钟
+ (NSInteger)getMinuteWithDate:(NSDate *)date
{
    if (!date)
    {
        return 0;
    }
    
    NSDateComponents *component = [self getDateCompontsWithDate:date];
    NSInteger minute = [component minute];
    return minute;
}

/// 获取秒
+ (NSInteger)getSecondWithDate:(NSDate *)date
{
    if (!date)
    {
        return 0;
    }
    
    NSDateComponents *component = [self getDateCompontsWithDate:date];
    NSInteger minute = [component second];
    return minute;
}

/// 获取星期
+ (NSString *)getWeekWithDate:(NSDate *)date
{
    if (!date)
    {
        return nil;
    }
    
    NSDateComponents *component = [self getDateCompontsWithDate:date];
    
    NSString *weekStr;
    NSInteger weekday = [component weekday];
    switch (weekday)
    {
        case 1: weekStr = @"日"; break;
        case 2: weekStr = @"一"; break;
        case 3: weekStr = @"二"; break;
        case 4: weekStr = @"三"; break;
        case 5: weekStr = @"四"; break;
        case 6: weekStr = @"五"; break;
        case 7: weekStr = @"六"; break;
        default: break;
    }
    
    return weekStr;
}

#pragma mark - 当前时间

/// 获取当前日期 NSDate（直接显示会出现相差8个小时，使用NSDateFormatter时间格式则不会）
+ (NSDate *)getCurrentDate
{
    NSDate *currentDate = [NSDate date];
    return currentDate;
}

/// 获取当前时间
+ (NSString *)getCurrentTime
{
    NSDate *nowDate = [self getCurrentDate];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setTimeZone:[NSTimeZone localTimeZone]];
    [dateFormatter setDateStyle:NSDateFormatterMediumStyle];
    [dateFormatter setTimeStyle:NSDateFormatterMediumStyle];
    NSString *time = [dateFormatter stringFromDate:nowDate];
    return time;
}

/// 获取当前年份
+ (NSInteger)getCurrentYear
{
    NSInteger yearNumber = [self getYearWithDate:[self getCurrentDate]];
    return yearNumber;
}

/// 获取当前月份
+ (NSInteger)getCurrentMonth
{
    NSInteger monthNumber = [self getMonthWithDate:[self getCurrentDate]];
    return monthNumber;
}

/// 获取当前日期
+ (NSInteger)getCurrentDay
{
    NSInteger dayNumber = [self getDayWithDate:[self getCurrentDate]];
    return dayNumber;
}

/// 获取当前小时
+ (NSInteger)getCurrentHour
{
    NSInteger hour = [self getHourWithDate:[self getCurrentDate]];
    return hour;
}

/// 获取当前分钟
+ (NSInteger)getCurrentMinute
{
    NSInteger minute = [self getMinuteWithDate:[self getCurrentDate]];
    return minute;
}

/// 获取当前秒
+ (NSInteger)getCurrentSecond
{
    NSInteger minute = [self getSecondWithDate:[self getCurrentDate]];
    return minute;
}

/// 获取当前星期
+ (NSString *)getCurrentWeekDay
{
    NSString *weekday = [self getWeekWithDate:[self getCurrentDate]];
    return weekday;
}

#pragma mark - 时间差

/// 字符串转换成自定义格式时间（时间字符格式与format必须一致，否则返回nil）
+ (NSDate *)getDateWithTime:(NSString *)time format:(NSString *)format
{
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    dateFormat.dateFormat = format;
    
    NSDate *currentDate = [dateFormat dateFromString:time];
    return currentDate;
}

/// 从现在开始的24小时之后的某个时间（如明天，后天），或之前的某个时间（如昨天，前天）
+ (NSDate *)getDateWithDay:(float)day after:(BOOL)after
{
    NSTimeInterval secondsPerDay = (24 * 60 * 60) * day;
    if (!after)
    {
        // 之前
        secondsPerDay = -secondsPerDay;
    }
    NSDate *date = [self getDateWithTime:secondsPerDay];
    
    return date;
}

/// 计算任意两个日期间的天数
+ (NSInteger)getDayBetweenDate:(NSDate *)startDate endDate:(NSDate *)endDate
{
    // 创建日历对象
    NSCalendar *nsCalendar = [[NSCalendar alloc ] initWithCalendarIdentifier:NSGregorianCalendar];
    // 设置组件标志识
    NSUInteger unitFlags = NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit | NSDayCalendarUnit | NSMonthCalendarUnit | NSYearCalendarUnit;
    
    // 创建日期组件对象，由日历对象通过起止日期及标识创建
    NSDateComponents *cps = [nsCalendar components:unitFlags fromDate:startDate toDate:endDate options:0];
    // NSInteger diffHour = [cps hour];
    // NSInteger diffMin = [cps minute];
    // NSInteger diffSec = [cps second];
    NSInteger diffDay = [cps day];
    // NSInteger diffMon = [cps month];
    // NSInteger diffYear = [cps year];
    
    return diffDay;
}

/// 秒数计算时间天数（20秒为0天）
+ (NSInteger)getDayWithTime:(NSTimeInterval)time
{
    NSInteger day = time / (24 * 60 * 60);
    return day;
}

/// 计算时间差，秒数（两个日期对象的时间间隔）
+ (NSTimeInterval)getTimeBetweenDate:(NSDate *)fromDate endDate:(NSDate *)nowDate
{
    if (!fromDate || !nowDate)
    {
        return 0;
    }
    
    NSTimeInterval second = [nowDate timeIntervalSinceDate:fromDate];
    return second;
}

/// 获取某个时间的前天或后天
+ (NSDate *)getDateWithDate:(NSDate *)date day:(NSInteger)day tomorrow:(BOOL)tomorrow
{
    NSTimeInterval secondsPerDay = (24 * 60 * 60) * day;
    if (!tomorrow)
    {
        // 之前
        secondsPerDay = -secondsPerDay;
    }
    
    NSTimeInterval time = [self getTimeSecondWithDate:date];
    time += secondsPerDay;
    
    NSDate *perDate = [NSDate dateWithTimeIntervalSinceNow:time];
    
    return perDate;
}

#pragma mark - 时间显示字符

/// 获取当前日期 自定义格式
+ (NSString *)getCurrentTimeWithFormat:(NSString *)format
{
    NSString *currentDateString = [self getTimeWithDate:nil format:format];
    
    return currentDateString;
}

/// 时间转换成自定义格式字条串
+ (NSString *)getTimeWithDate:(NSDate *)date format:(NSString *)format
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = ((format && 0 != format.length) ? format : @"yyyy-MM-dd HH:mm:ss");
    
    NSDate *currentDate = (date ? date : [self getCurrentDate]);
    NSString *currentDateString = [formatter stringFromDate:currentDate];
    
    return currentDateString;
}

/// 时间戳转换成自定义格式字符（秒数转化成yyyy-MM-dd hh:mm:ss格式）
+ (NSString *)getTimeWithTime:(NSTimeInterval)time format:(NSString *)format
{
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:time];
    NSString *timeString = [self getTimeWithDate:date format:format];
    return timeString;
}

/// 计算时间间隔数
+ (NSString *)getTimeWithTime:(NSTimeInterval)comparetime
{
    if (0 == comparetime)
    {
        return nil;
    }
    
    NSTimeInterval time = [[NSDate date] timeIntervalSince1970];
    
    if ((time - comparetime) >= 0 && (time - comparetime) < 60 * 1)
    {
        // 以分钟显示
        return @"刚刚";
    }
    else if ((time - comparetime) >= 60 * 1 && (time - comparetime) < 60 * 60)
    {
        // 大于1分钟小于一个小时
        int mimuteNum = (time - comparetime) / 60;
        
        return [NSString stringWithFormat:@"%d分钟前", mimuteNum];
    }
    else if ((time - comparetime) >= 60 * 60 && (time - comparetime) < 60 * 60 * 24)
    {
        // 以小时钟显示(大于1个小时小于24个小时)
        int hourNum = (time - comparetime) / (60 * 60);
        
        return [NSString stringWithFormat:@"%d小时前", hourNum];
    }
    else
    {
        // 以日期格式显示(大于24个小时)
        NSDate *date = [NSDate dateWithTimeIntervalSince1970:comparetime];
        
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"yyyy-MM-dd"];
        NSString *destDateString = [dateFormatter stringFromDate:date];
        
        return destDateString;
    }
}

/// 秒数计算时间格式显示（20秒为0天0时0分20秒）
+ (NSString *)getTimeWithTime:(NSTimeInterval)time mode:(SYTimeShowMode)mode
{
    int day = time / (24 * 60 * 60);
    int dayTmp = (int)time % (24 * 60 * 60);
    int hour = dayTmp / (60 * 60);
    int hourTmp = dayTmp % (60 * 60);
    int minute = hourTmp / 60;
    int second = hourTmp % 60;
    
    NSString *string = nil;
    if (SYTimeShowModeDefault == mode)
    {
        string = [NSString stringWithFormat:@"%d天%d时%d分%d秒", day, hour, minute, second];
        if (0 == day)
        {
            string = [NSString stringWithFormat:@"%d时%d分%d秒", hour, minute, second];
            if (0 == hour)
            {
                string = [NSString stringWithFormat:@"%d分%d秒", minute, second];
            }
        }
    }
    else if (SYTimeShowModeDefaultWithSecond == mode)
    {
        string = [NSString stringWithFormat:@"%d天%d时%d分", day, hour, minute];
        if (0 == day)
        {
            string = [NSString stringWithFormat:@"%d时%d分", hour, minute];
        }
    }
    else if (SYTimeShowModeDayHourMinuteSecond == mode)
    {
        string = [NSString stringWithFormat:@"%d天%d时%d分%d秒", day, hour, minute, second];
    }
    else if (SYTimeShowModeDayHourMinute == mode)
    {
        string = [NSString stringWithFormat:@"%d天%d时%d分", day, hour, minute];
    }
    else if (SYTimeShowModeHourMinuteSecond == mode)
    {
        string = [NSString stringWithFormat:@"%d时%d分%d秒", (hour + day * 24), minute, second];
    }
    else if (SYTimeShowModeHourMinute == mode)
    {
        string = [NSString stringWithFormat:@"%d时%d分", (hour + day * 24), minute];
    }
    
    return string;
}

+ (NSString *)getVSTChatFormatTime:(long long)time
{
    //1.获取当前的时间
    NSDate *currentDate = [[self class] getCurrentDate];
    
    // 1.1获取年，月，日
    NSInteger currentYear = [[self class] getYearWithDate:currentDate];
    NSInteger currentMonth = [[self class] getMonthWithDate:currentDate];
    NSInteger currentDay = [[self class] getDayWithDate:currentDate];
    
    //2.获取消息发送时间
    NSDate *msgDate = [NSDate dateWithTimeIntervalSince1970:time];
    
    // 2.1获取年，月，日
    NSInteger msgYear = [[self class] getYearWithDate:msgDate];
    NSInteger msgMonth = [[self class] getMonthWithDate:msgDate];
    NSInteger msgDay = [[self class] getDayWithDate:msgDate];
    
    //3.判断:
    /*
     今天：(HH:mm)
     昨天: (昨天 HH:mm)
     昨天以前:（2016-07-27 16:07）
     */
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    if (currentYear == msgYear && currentMonth == msgMonth && currentDay == msgDay)
    {
        // 今天
        dateFormat.dateFormat = @"HH:mm";
    }
    else if(currentYear == msgYear && currentMonth == msgMonth && currentDay - 1 == msgDay)
    {
        // 昨天
        dateFormat.dateFormat= [NSString stringWithFormat:@"昨天 %@", @"HH:mm"];
    }
    else
    {
        // 昨天以前
        dateFormat.dateFormat = @"yyyy-MM-dd HH:mm";
    }
    
    return [dateFormat stringFromDate:msgDate];
}

// 比较两个时间是否在同一个小时内,若是，返回YES,否返回NO
+ (BOOL)isSameHourTime:(long long)timeA time:(long long)timeB;
{
    NSDate *dateA = [NSDate dateWithTimeIntervalSince1970:timeA];
    NSDate *dateB = [NSDate dateWithTimeIntervalSince1970:timeB];
    
    // 获取年月日
    NSString *tempStringA = [[self class] getTimeWithDate:dateA format:@"yyyy-MM-dd"];
    NSString *tempStringB = [[self class] getTimeWithDate:dateB format:@"yyyy-MM-dd"];
    
    // 获取小时
    NSInteger hourA = [[self class] getHourWithDate:dateA];
    NSInteger hourB = [[self class] getHourWithDate:dateB];
    
    if (hourA == hourB)
    {
        // 日期也需要一样
        if ([tempStringA isEqualToString:tempStringB])
        {
            return YES;
        }
        
        return NO;
    }
    else
    {
        return NO;
    }
}

// 根据时间戳返回东八区时间
+ (NSDate *)getEastEightTime:(NSTimeInterval)time format:(NSString *)format
{
    NSString *timeStr = [[self class] getTimeWithTime:(time / 1000) format:format];
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    dateFormat.dateFormat = format;
    // [dateFormat setTimeZone:[NSTimeZone timeZoneForSecondsFromGMT:8]];
    NSDate *currentDate = [dateFormat dateFromString:timeStr];
    
    return currentDate;
}

@end
