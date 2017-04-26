//
//  NSNotificationViewController.m
//  DemoCategory
//
//  Created by zhangshaoyu on 16/12/20.
//  Copyright © 2016年 zhangshaoyu. All rights reserved.
//

#import "NSNotificationViewController.h"

@interface NSNotificationViewController ()

@end

@implementation NSNotificationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"NSNotification";
    
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
    
    NSArray *array = @[@"发消息"];
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
    
    // 接收消息
    NSString *name = @"personInfo";
    SEL action = @selector(notificationAction:);
//    if ((name && 0 < name.length && [name isKindOfClass:[NSString class]])) {
//        [kNotificationCenter addObserver:self selector:action name:name object:nil];
//    }
    
//    kNotificationCenterReceive(name, self, action);
    
    // 方法1
//    NSNotificationCenterReceive(name, self, action);
    
    // 方法2
    kSelfWeak;
    [[NSNotificationCenter defaultCenter] receiveNotificationWithName:name handle:^(NSNotification *notification) {
        [weakSelf notificationAction:notification];
    }];
}

- (void)buttonClick:(UIButton *)button
{
    NSString *title = button.titleLabel.text;
    if ([title isEqualToString:@"发消息"])
    {
        // 发消息
        NSString *name = @"personInfo";
        NSDictionary *dict = @{@"name":@"devZhang", @"age":@"30", @"job":@"iOSDev"};
        
//        [kNotificationCenter postNotificationName:name object:nil userInfo:dict];
        
//        kNotificationCenterPost(name, dict);
        
        // 方法1
//        NSNotificationCenterPost(name, dict);
        
        // 方法2
        [[NSNotificationCenter defaultCenter] postNotificationWithName:name userInfo:dict];
    }
}

- (void)notificationAction:(NSNotification *)notification
{
    NSString *name = notification.name;
    NSDictionary *dict = notification.userInfo;
    NSLog(@"name = %@ \n dict = %@", name, dict);
}

@end
