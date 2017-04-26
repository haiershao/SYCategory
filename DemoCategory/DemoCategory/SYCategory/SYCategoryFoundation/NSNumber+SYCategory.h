//
//  NSNumber+SYCategory.h
//  zhangshaoyu
//
//  Created by zhangshaoyu on 16/11/25.
//  Copyright © 2016年 zhangshaoyu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSNumber (SYCategory)

#pragma mark - 字符串转数值

/// string转double
+ (double)doubleWithString:(NSString *)string;

/// string转float
+ (float)floatWithString:(NSString *)string;

/// string转int
+ (int)intWithString:(NSString *)string;

/// 保留2位小数
+ (double)keepTwoDecimalsDoubleValue:(double)number;

/// 获取一个随机整数，范围在[from,to）
+ (int)randomNumber:(int)from to:(int)to;

@end
