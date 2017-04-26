//
//  ButtonViewController.m
//  DemoCategory
//
//  Created by zhangshaoyu on 16/11/29.
//  Copyright © 2016年 zhangshaoyu. All rights reserved.
//

#import "ButtonViewController.h"

@interface ButtonViewController ()

@end

@implementation ButtonViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItemTitle = @"UIButton";
    
    [self setUI];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    UIButton *button01 = (UIButton *)[self.view viewWithTag:1002];
    [button01 setButtonCountdownType:SYCountdownTypeStop];
    
    UIButton *button02 = (UIButton *)[self.view viewWithTag:1005];
    [button02 setButtonCountdownType:SYCountdownTypeStop];
    
    UIButton *button03 = (UIButton *)[self.view viewWithTag:1004];
    [button03 setButtonCountdownType:SYCountdownTypeStop];
}

- (void)setUI
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:button];
    button.frame = CGRectMake(10.0, 10.0, (self.view.width - 10.0 * 2), 40.0);
    button.backgroundColor = [UIColor colorRandom];
    [button setTitle:@"edit" forState:UIControlStateNormal];
    [button setTitle:@"done" forState:UIControlStateSelected];
    
    kSelfWeak;
    button.buttonClick = ^(UIButton *button){
        button.selected = !button.selected;
        if (button.selected)
        {
            [UIAlertView alertWithTitle:@"温馨提示" message:@"开始编辑" cancelButtonTitle:@"取消" otherButtonTitles:@[@"确认"] controller:weakSelf onDismiss:^(int buttonIndex, NSString *buttonTitle) {
                if ([buttonTitle isEqualToString:@"确认"])
                {
                    NSLog(@"点击了确认");
                }
            } onCancel:^{
                NSLog(@"点击了取消");
            }];
        }
    };
    
    UIView *currentView = button;
    
    UIButton *button2 = [[UIButton alloc] initWithFrame:CGRectMake(10.0, (currentView.bottom + 10.0), currentView.width, currentView.height)];
    [self.view addSubview:button2];
    button2.tag = 1002;
    button2.backgroundColor = [UIColor colorRandom];
    button2.titleNormal = @"获取验证码（20秒倒计时，且获取成功，且使用响应回调）";
    [button2 setButtonCountdownType];
    [button2 setButtonCountdownTime:20.0];
    [button2 setButtonCountedownStartType:SYCountdownStartTypeText];
    button2.buttonClick = ^(UIButton *button){
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 10.0 * NSEC_PER_SEC), dispatch_get_main_queue(), ^(void){
            // code to be executed on the main queue after delay
             [button setButtonCountdownType:SYCountdownTypeSuccess];
        });
    };
    
    currentView = button2;
    
    UIButton *button3 = [[UIButton alloc] initWithFrame:CGRectMake(10.0, (currentView.bottom + 10.0), currentView.width, currentView.height)];
    [self.view addSubview:button3];
    button3.tag = 1003;
    button3.backgroundColor = [UIColor colorRandom];
    button3.titleNormal = @"获取验证码（30秒倒计时，且获取失败，且使用响应回调）";
    [button3 setButtonCountdownTime:30.0];
    [button3 setButtonCountdownType];    
    [button3 setButtonCountedownStartType:SYCountdownStartTypeActivity];
    button3.buttonClick = ^(UIButton *button){
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 10.0 * NSEC_PER_SEC), dispatch_get_main_queue(), ^(void){
            // code to be executed on the main queue after delay
            [button setButtonCountdownType:SYCountdownTypeStop];
        });
    };
    
    
    currentView = button3;
    
    UIButton *button4 = [[UIButton alloc] initWithFrame:CGRectMake(10.0, (currentView.bottom + 10.0), currentView.width, currentView.height)];
    [self.view addSubview:button4];
    button4.tag = 1004;
    button4.backgroundColor = [UIColor colorRandom];
    button4.titleNormal = @"获取验证码（10秒倒计时，且获取成功，且使用target）";
    [button4 setButtonCountdownType];
    [button4 setButtonCountdownTime:10.0];
    [button4 setButtonCountedownStartType:SYCountdownStartTypeActivity];
    [button4 addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    
    currentView = button4;
    
    UISlider *slider = [[UISlider alloc] initWithFrame:CGRectMake(10.0, (currentView.bottom + 10.0), (self.view.width - 10.0 * 2), 10.0)];
    [self.view addSubview:slider];
    slider.value = 0.5;
    slider.sliderClick = ^(UISlider *slider){
        NSLog(@"1 当前进度是：%@", @(slider.value));
    };
    
    currentView = slider;
    
    currentView = [UISlider sliderWithFrame:CGRectMake(10.0, (currentView.bottom + 10.0), currentView.width, 10.0) view:self.view value:10.0 action:^(UISlider *slider) {
        float value = slider.value;
        NSLog(@"2 当前进度是：%@", @(value));
    }];
    
    UISwitch *switchView = [[UISwitch alloc] initWithFrame:CGRectMake(10.0, (currentView.bottom + 10.0), 60.0, 40.0)];
    [self.view addSubview:switchView];
    switchView.switchClick = ^(UISwitch *sender){
        NSLog(@"1 当前状态：%@", @(sender.on));
    };
    
    currentView = switchView;
    
    currentView = [UISwitch switchWithFrame:CGRectMake((currentView.right + 10.0), currentView.top, currentView.width, currentView.height) view:self.view status:NO action:^(UISwitch *sender) {
        NSLog(@"2 当前状态：%@", @(sender.on));
    }];
    
    UISegmentedControl *segmentControl = [[UISegmentedControl alloc] initWithItems:@[@"start", @"stop"]];
    [self.view addSubview:segmentControl];
    segmentControl.frame = CGRectMake(10.0, (currentView.bottom + 10.0), 100.0, 40.0);
    segmentControl.segmentClick = ^(UISegmentedControl *segmentControl){
        NSLog(@"1 你点击了第 %@ 个按钮", @(segmentControl.selectedSegmentIndex));
    };
    
    currentView = segmentControl;
    
    [UISegmentedControl segmentControlWithItems:@[@"play", @"pause", @"stop"] frame:CGRectMake((currentView.right + 10.0), currentView.top, 200.0, currentView.height) view:self.view action:^(UISegmentedControl *sender) {
        NSLog(@"2 你点击了第 %@ 个按钮", @(sender.selectedSegmentIndex));
    }];
}

- (void)buttonClick:(UIButton *)button
{
    [button setButtonCountdownType:SYCountdownTypeBegin];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 5.0 * NSEC_PER_SEC), dispatch_get_main_queue(), ^(void){
        // code to be executed on the main queue after delay
        [button setButtonCountdownType:SYCountdownTypeSuccess];
    });
}

@end
