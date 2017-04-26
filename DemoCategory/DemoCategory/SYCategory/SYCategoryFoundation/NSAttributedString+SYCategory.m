//
//  NSAttributedString+SYCategory.m
//  zhangshaoyu
//
//  Created by zhangshaoyu on 16/11/28.
//  Copyright © 2016年 zhangshaoyu. All rights reserved.
//

#import "NSAttributedString+SYCategory.h"

@implementation NSAttributedString (SYCategory)

/**
 *  修改NSAttributedString信息（文字大小颜色）
 *
 *  @param text    需要修改的text
 *  @param aFont   字体大小
 *  @param aColor  字体颜色
 */
- (void)attributedText:(NSString *)text font:(UIFont *)aFont color:(UIColor *)aColor
{
    [self attributedText:text font:aFont color:aColor bgColor:nil];
}

/**
 *  修改NSAttributedString信息（文字大小颜色、字体背景颜色）
 *
 *  @param text    需要修改的text
 *  @param font    字体大小
 *  @param color   字体颜色
 *  @param bgColor 字体背景颜色
 */
- (void)attributedText:(NSString *)text font:(UIFont *)font color:(UIColor *)color bgColor:(UIColor *)bgColor
{
    [self attributedText:text color:color font:font space:0.0 rowSpace:0.0 bgColor:bgColor];
}

/**
 *  修改NSAttributedString信息（字符间距，行间距，文字大小颜色、字体背景颜色）
 *
 *  @param text           要修改的文字
 *  @param textColor      要修改的文字颜色
 *  @param textFont       要修改的文字大小
 *  @param characterSpace 字体间距
 *  @param rowSpace       行间距
 *  @param bgColor        字体背景颜色
 */
- (void)attributedText:(NSString *)text color:(UIColor *)textColor font:(UIFont *)textFont space:(CGFloat)characterSpace rowSpace:(CGFloat)rowSpace bgColor:(UIColor *)bgColor
{
    NSMutableAttributedString *attributed = [[NSMutableAttributedString alloc] initWithAttributedString:self];
    NSString *textTmp = attributed.string;
    // 设置某写字体的颜色 NSForegroundColorAttributeName
    NSRange range = [textTmp rangeOfString:text];
    if (range.location != NSNotFound)
    {
        // 颜色
        if (textColor)
        {
            [attributed addAttribute:NSForegroundColorAttributeName value:textColor range:range];
        }
        // 字体
        if (textFont)
        {
            [attributed addAttribute:NSFontAttributeName value:textFont range:range];
        }
        // 字符间距
        if (0.0 < characterSpace)
        {
            // 设置每个字体之间的间距 NSKernAttributeName 这个对象所对应的值是一个NSNumber对象(包含小数),作用是修改默认字体之间的距离调整,值为0的话表示字距调整是禁用的
            [attributed addAttribute:NSKernAttributeName value:@(characterSpace) range:range];
        }
        // 行间距
        if (0.0 < rowSpace)
        {
            // 设置每行之间的间距 NSParagraphStyleAttributeName 设置段落的样式
            NSMutableParagraphStyle *par = [[NSMutableParagraphStyle alloc] init];
            [par setLineSpacing:rowSpace];
            [attributed addAttribute:NSParagraphStyleAttributeName value:par range:range];
        }
        // 字体背景颜色
        if (bgColor)
        {
            [attributed addAttribute:NSBackgroundColorAttributeName value:bgColor range:range];
        }
    }
}

/// 设置字体的下划线，或删除线，及其线条大小、颜色与类型（如下划线单线类型NSUnderlineStyleSingle）
- (void)attributedText:(NSString *)text color:(UIColor *)textColor font:(UIFont *)textFont lineStyle:(BOOL)delete lineType:(NSInteger)type lineWidth:(CGFloat)width lineColor:(UIColor *)color
{
    NSMutableAttributedString *attributed = [[NSMutableAttributedString alloc] initWithAttributedString:self];
    NSString *textTmp = attributed.string;
    // 字体设置范围
    NSRange range = [textTmp rangeOfString:text];
    if (range.location != NSNotFound)
    {
        // 设置字体颜色
        if (textColor)
        {
            [attributed addAttribute:NSForegroundColorAttributeName value:textColor range:range];
        }
        
        // 线条大小
        if (0.0 < width)
        {
            [attributed addAttribute:NSStrokeWidthAttributeName value:[NSNumber numberWithFloat:width] range:range];
        }
        
        // 线条颜色
        if (color)
        {
            [attributed addAttribute:NSForegroundColorAttributeName value:color range:range];
        }
        
        // 线条样式，删除线，或下划线
        [attributed addAttribute:(delete ? NSStrikethroughStyleAttributeName : NSUnderlineStyleAttributeName)
                           value:[NSNumber numberWithInteger:type]
                           range:range];

    }
}

@end
