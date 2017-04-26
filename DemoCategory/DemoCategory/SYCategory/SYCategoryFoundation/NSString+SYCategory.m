//
//  NSString+SYCategory.m
//  zhangshaoyu
//
//  Created by zhangshaoyu on 16/6/25.
//  Copyright © 2016年 zhangshaoyu. All rights reserved.
//

#import "NSString+SYCategory.h"
#import <ifaddrs.h>
#import <arpa/inet.h>

@implementation NSString (SYCategory)

/**
 *  获取设备 ip 地址
 *
 *  @return ip 地址字符串
 */
+ (NSString *)IPAddress
{
    NSString *address = nil;
    
    struct ifaddrs *interfaces = NULL;
    struct ifaddrs *temp_addr = NULL;
    int success = 0;
    success = getifaddrs(&interfaces);
    if (0 == success)
    {
        temp_addr = interfaces;
        while (temp_addr != NULL)
        {
            if (temp_addr->ifa_addr->sa_family == AF_INET)
            {
                if ([[NSString stringWithUTF8String:temp_addr->ifa_name] isEqualToString:@"en0"])
                {
//                    address = [NSString stringWithUTF8String:inet_ntop(((struct sockaddr_in *)temp_addr->ifa_addr)->sin_addr)];
                }
            }
            temp_addr = temp_addr->ifa_next;
        }
    }
    
    freeifaddrs(interfaces);
    
    return address;
}

#pragma mark - 字符串后缀信息

- (NSString *)fileName
{
    return self.lastPathComponent;
}

- (NSString *)fileType
{
    return self.pathExtension;
}

#pragma mark - 数值转字符串

/// number转字string
+ (NSString *)stringWithNumber:(NSNumber *)value
{
    return [NSString stringWithFormat:@"%@", value];
}

/// int转字string
+ (NSString *)stringWithInteger:(int)value
{
    return [NSString stringWithFormat:@"%@", [NSNumber numberWithInt:value]];
}

/// float转字string
+ (NSString *)stringWithFloat:(float)value
{
    return [NSString stringWithFormat:@"%@", [NSNumber numberWithFloat:value]];
}

/// double转字string
+ (NSString *)stringWithDouble:(double)value
{
    return [NSString stringWithFormat:@"%@", [NSNumber numberWithDouble:value]];
}

#pragma mark -

/**
 *  获取字符串首字母（汉字会被转换成全拼音）
 *
 *  @return 字符串首字母
 */
- (NSString *)firstCharacter
{
    if (![NSString isValidNSString:self])
    {
        return nil;
    }
    NSMutableString *string = [NSMutableString stringWithString:self];
    CFStringTransform((CFMutableStringRef)string, NULL, kCFStringTransformMandarinLatin, NO);
    CFStringTransform((CFMutableStringRef)string, NULL, kCFStringTransformStripDiacritics, NO);
    NSString *result = [string capitalizedString];
    result = [result substringToIndex:1];
    
    return result;
}

/**
 *  过滤指定字符
 *
 *  @param filterText 特殊字符
 *
 *  @return 过滤特殊字符后的新字符串
 */
- (NSString *)filterWithCharacters:(NSString *)filterText
{
    // 定义一个特殊字符的集合
    NSCharacterSet *filterSet = [NSCharacterSet characterSetWithCharactersInString:filterText];
    // 过滤字符串的特殊字符
    NSString *result = [self stringByTrimmingCharactersInSet:filterSet];
    
    return result;
}

#pragma mark - 字符处理方法

/// 字符隐藏显示设置（使用诸如“*”符号代替，同时设置只显示前几位，及后几位）
- (NSString *)textHiddenWithSymbol:(NSString *)symbol showBegin:(NSInteger)begin showEnd:(NSInteger)end
{
    if (![NSString isNullNSString:symbol])
    {
        NSInteger countLength = self.length;
        NSInteger countBegin = begin;
        NSInteger countEnd = end;
        if ((countBegin + countEnd <= countLength) && (begin >= 0 && end >= 0))
        {
            NSInteger countHidden = countLength - countBegin - countEnd;
            
            NSMutableString *stringSymbol = [NSMutableString string];
            for (NSInteger i = 0; i < countHidden; i++)
            {
                [stringSymbol appendString:symbol];
            }
            
            NSRange rangeHidden = NSMakeRange(countBegin, countHidden);
            NSString *stringHidden = [self stringByReplacingCharactersInRange:rangeHidden withString:stringSymbol];
            
            return stringHidden;
        }
        
        return self;
    }
    
    return self;
}

/// 数字字符串保留小数点后任意位数
static NSString *const keyDecimalPoint = @".";
- (NSString *)textKeepDecimalPointWithNumber:(NSInteger)length
{
    NSRange rangePoint = [self rangeOfString:keyDecimalPoint];
    if (rangePoint.location != NSNotFound)
    {
        NSString *decimalString = [self substringFromIndex:rangePoint.location + rangePoint.length];
        NSInteger countDecimal = decimalString.length;
        NSInteger countKeep = length;
        countKeep = (countKeep >= countDecimal ? countDecimal : (countKeep > 0 ? countKeep : 0));
        
        NSString *resultString = [self substringToIndex:rangePoint.location + rangePoint.length + countKeep];
        
        // 不足位数时补0
        countKeep = length - countDecimal;
        NSMutableString *zeroString = [NSMutableString string];
        for (NSInteger i = 0; i < countKeep; i++)
        {
            [zeroString appendString:@"0"];
        }
        resultString = [NSString stringWithFormat:@"%@%@", resultString, zeroString];
        
        return resultString;
    }
    else
    {
        // 不足位数时补0
        NSMutableString *zeroString = [NSMutableString stringWithString:keyDecimalPoint];
        for (NSInteger i = 0; i < length; i++)
        {
            [zeroString appendString:@"0"];
        }
        NSString *resultString = [NSString stringWithFormat:@"%@%@", self, zeroString];
        
        return resultString;
    }
}

/// 金额字符串转换显示样式（每三位以空格，或,进行分割显示）
- (NSString *)textMoneySeparatorWithSymbol:(NSString *)symbol
{
    if (![NSString isNullNSString:symbol])
    {
        NSString *textTmp = self;
        
        // 整数位
        NSString *textMoney = textTmp;
        // 小数位
        NSString *textZero = @"";
        // 正负数位
        NSString *textMinus = @"";
        
        // 判断是否含有负数
        NSRange rangeMinus = [textTmp rangeOfString:@"-"];
        if (rangeMinus.location != NSNotFound)
        {
            textMinus = @"-";
            textTmp = [textTmp substringFromIndex:(rangeMinus.location + rangeMinus.length)];
        }
        
        // 判断是否含有正数
        NSRange rangePositive = [textTmp rangeOfString:@"+"];
        if (rangePositive.location != NSNotFound)
        {
            textMinus = @"+";
            textTmp = [textTmp substringFromIndex:(rangePositive.location + rangePositive.length)];
        }
        
        // 判断是否含有小数，小数位不纳入处理
        NSRange rangeZero = [textTmp rangeOfString:keyDecimalPoint];
        if (rangeZero.location != NSNotFound)
        {
            textMoney = [textTmp substringToIndex:rangeZero.location];
            textZero = [textTmp substringFromIndex:rangeZero.location];
        }
        
        // 3位以下才进行分割处理
        NSInteger countLength = textMoney.length;
        NSInteger countSpace = 3;
        if (countLength > countSpace)
        {
            NSInteger countSymbol = countLength / countSpace;
            if (countLength % countSpace == 0)
            {
                // 刚好整除时，减1（如：6、9、12...3n）
                countSymbol -= 1;
            }
            
            NSInteger indexSymbol = 0;
            NSMutableString *stringSymbol = [NSMutableString stringWithString:textMoney];
            for (NSInteger i = 0; i < countSymbol; i++)
            {
                countLength = stringSymbol.length;
                indexSymbol = countLength - countSpace * (1 + i) - i;
                
                [stringSymbol insertString:symbol atIndex:indexSymbol];
            }
            
            [stringSymbol appendString:textZero];
            [stringSymbol insertString:textMinus atIndex:0];
            
            return stringSymbol;
        }
        
        return self;
    }
    
    return self;
    
}

#pragma mark - 字符异常判断方法

/// 有效字符（非空，且非空格）
+ (BOOL)isValidNSString:(NSString *)string;
{
    BOOL isResult = [self isNullBlankNSString:string];
    return !isResult;
}

/// 字符非空判断（可以是空格字符串）
+ (BOOL)isNullNSString:(NSString *)string;
{
    if (string == Nil || [string isEqualToString:@""] || 0 == string.length || [string isEqual:[NSNull class]])
    {
        return YES;
    }
    
    return NO;
}

/// 字符非空判断（不能是空格字符串）
+ (BOOL)isNullBlankNSString:(NSString *)string;
{
    NSString *stringTmp = [string textFilterBlankSpace];
    BOOL isResult = [self isNullNSString:stringTmp];
    return isResult;
}

/// 过滤字符串中的空格符
- (NSString *)textFilterBlankSpace
{
//    NSCharacterSet *characterSet = [NSCharacterSet whitespaceAndNewlineCharacterSet];
//    NSString *resultString = [self stringByTrimmingCharactersInSet:characterSet];
    NSString *resultString = [self stringByReplacingOccurrencesOfString:@" " withString:@""];
    return resultString;
}

/// 判断输入的字符长度 一个汉字算2个字符，是否区分中英文
- (NSUInteger)textLength:(BOOL)isCN
{
    NSUInteger asciiLength = 0;
    NSInteger length = self.length;
    for (NSUInteger i = 0; i < length; i++)
    {
        unichar uc = [self characterAtIndex:i];
        asciiLength += (isascii(uc) ? 1 : (isCN ? 2 : 1));
    }
    return asciiLength;
}

#pragma mark - 字符等级强弱度识别

- (NSInteger)textStrengthGrade
{
    NSInteger grade = 0;
    if ([NSString isValidNSString:self])
    {
        // 弱、中、高判定规则：将长度大于10、含大写字母、含小写字母、含数字、含特殊符号作为五个判定标准，基础密码必须满足两个标准安全等级为弱；满足三个条件安全等级为中；满足四个及以上安全等级为强。根据不同密码安全等级显示对应提示
        BOOL isLength = (self.length > 10);
        BOOL isUpper = [self isContantSomeCharacters:@"ABCDEFGHIJKLMNOPQRSTUVWXYZ"];
        BOOL isLower = [self isContantSomeCharacters:@"abcdefghijklmnopqrstuvwxyz"];
        BOOL isNumber = [self isContantSomeCharacters:@"0123456789"];
        BOOL isSpecial = [self isContantSomeCharacters:@"~!@#$%^&*()_+-=\\|{}[];':,./<>?\""];
        
        NSArray *array = @[@(isLength), @(isUpper), @(isLower), @(isNumber), @(isSpecial)];
        for (NSNumber *number in array)
        {
            BOOL isTrue = number.boolValue;
            if (isTrue)
            {
                grade++;
            }
        }
        if (grade >= 4)
        {
            grade = 3;
        }
        else if (grade >= 3)
        {
            grade = 2;
        }
        else if (grade >= 2)
        {
            grade = 1;
        }
    }
    return grade;
}

@end
