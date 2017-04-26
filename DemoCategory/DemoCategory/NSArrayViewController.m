//
//  NSArrayViewController.m
//  DemoCategory
//
//  Created by zhangshaoyu on 16/12/20.
//  Copyright © 2016年 zhangshaoyu. All rights reserved.
//

#import "NSArrayViewController.h"

@interface NSArrayViewController ()

@end

@implementation NSArrayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"NSArray";
    
    [self setUI];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setUI
{
    int rowButton = 3;
    CGFloat origin = 10.0;
    CGFloat widthButton = (self.view.width - (rowButton + 1) * origin) / rowButton;
    CGFloat heightButton = 40.0;
    
    NSArray *array = @[];
    for (int i = 0; i < array.count; i++)
    {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.view addSubview:button];
        button.frame = CGRectMake((i % rowButton * (widthButton + origin) + origin), (i / rowButton * (heightButton + origin) + origin), widthButton, heightButton);
        button.backgroundColor = [UIColor colorRandom];
        button.titleLabel.adjustsFontSizeToFitWidth = YES;
        [button setTitle:array[i] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
        button.tag = i + 1000;
        [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    }
}

- (void)buttonClick:(UIButton *)button
{
    NSInteger index = button.tag - 1000;
    if (0 == index)
    {
        
    }
    else if (1 == index)
    {
        
    }
}

@end
