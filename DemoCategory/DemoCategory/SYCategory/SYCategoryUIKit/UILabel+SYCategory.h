//
//  UILabel+SYCategory.h
//  zhangshaoyu
//
//  Created by herman on 16/6/25.
//  Copyright © 2016年 zhangshaoyu. All rights reserved.
//

#import <UIKit/UIKit.h>

/// 自适应大小类型（宽高，或宽）
typedef NS_ENUM(NSInteger, SYLabelAutoSizeType)
{
    /// 自适应宽
    SYLabelAutoSizeTypeHorizontal = 1,
    
    /// 自适应宽高
    SYLabelAutoSizeTypeAll
};

@interface UILabel (SYCategory)

/**
 *  修改标签信息（文字大小颜色）
 *
 *  @param string         要修改的文字
 *  @param textColor      要修改的文字颜色
 *  @param textFont       要修改的文字大小
 */
- (void)labelAttributedText:(NSString *)string color:(UIColor *)textColor font:(UIFont *)textFont;

/**
 *  修改标签信息（字符间距，行间距，文字大小颜色）
 *
 *  @param string         要修改的文字
 *  @param textColor      要修改的文字颜色
 *  @param textFont       要修改的文字大小
 *  @param characterSpace 字体间距
 *  @param rowSpace       行间距
 */
- (void)labelAttributedText:(NSString *)string color:(UIColor *)textColor font:(UIFont *)textFont space:(CGFloat)characterSpace rowSpace:(CGFloat)rowSpace;

/// 设置自适应标签宽高
- (void)labelAutoSize:(SYLabelAutoSizeType)type;

// 字体发光

// 字体阴影

@end
