//
//  SYViewController.m
//  DemoCategory
//
//  Created by herman on 2016/12/18.
//  Copyright © 2016年 zhangshaoyu. All rights reserved.
//

#import "SYViewController.h"

@interface SYViewController ()

@end

@implementation SYViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc
{
    NSLog(@"%@ 被释放了", self);
}

- (void)loadView
{
    [super loadView];
    self.view.backgroundColor = [UIColor whiteColor];
    if ([self respondsToSelector:@selector(setEdgesForExtendedLayout:)])
    {
        [self setEdgesForExtendedLayout:UIRectEdgeNone];
    }
}

#pragma mark - 点击事件

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    if (self.isHieddenKeyboard)
    {
        [self.view endEditing:YES];
    }
}

@end
