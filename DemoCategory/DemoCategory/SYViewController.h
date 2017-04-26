//
//  SYViewController.h
//  DemoCategory
//
//  Created by herman on 2016/12/18.
//  Copyright © 2016年 zhangshaoyu. All rights reserved.
//

#import <UIKit/UIKit.h>

#define kSelfWeak __weak typeof(self) weakSelf = self
/// 设置随机颜色
#define UIColorRandom [UIColor colorWithRed:(arc4random_uniform(256) / 255.0) green:(arc4random_uniform(256) / 255.0) blue:(arc4random_uniform(256) / 255.0) alpha:1.0]

@interface SYViewController : UIViewController

/**
 *  是否通过点击视图控制器隐藏键盘（默认NO）
 */
@property (nonatomic, assign) BOOL isHieddenKeyboard;

@end
