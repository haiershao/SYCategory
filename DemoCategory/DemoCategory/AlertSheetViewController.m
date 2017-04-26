//
//  AlertSheetViewController.m
//  DemoCategory
//
//  Created by zhangshaoyu on 16/11/29.
//  Copyright © 2016年 zhangshaoyu. All rights reserved.
//

#import "AlertSheetViewController.h"

@interface AlertSheetViewController ()

@end

@implementation AlertSheetViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItemTitle = @"UIAlertView/UIActionSheet";
    
    [self setUI];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setUI
{
    UIButton *button = [UIButton buttonWithType: UIButtonTypeCustom];
    [self.view addSubview:button];
    button.frame = CGRectMake(10.0, 10.0, (self.view.width - 10.0 * 2), 40.0);
    button.backgroundColor = [UIColor colorRandom];
    [button setTitle:@"UIAlertView弹窗提示" forState:UIControlStateNormal];
    
    kSelfWeak;
    button.buttonClick = ^(UIButton *button){
        [UIAlertView alertWithTitle:@"温馨提示" message:@"UIAlertView弹窗提示" cancelButtonTitle:@"取消" otherButtonTitles:@[@"知道了", @"拒绝了", @"警告了"] controller:weakSelf onDismiss:^(int buttonIndex, NSString *buttonTitle) {
            if ([buttonTitle isEqualToString:@"知道了"])
            {
                NSLog(@"知道了");
            }
            else if ([buttonTitle isEqualToString:@"拒绝了"])
            {
                NSLog(@"拒绝了");
            }
            else if ([buttonTitle isEqualToString:@"警告了"])
            {
                NSLog(@"警告了");
            }
            
        } onCancel:^{
            NSLog(@"取消");
        }];
    };
    
    UIView *currentView = button;
    
    UIButton *button2 = [UIButton buttonWithType: UIButtonTypeCustom];
    [self.view addSubview:button2];
    button2.frame = CGRectMake(10.0, (currentView.bottom + 10.0), currentView.width, 40.0);
    button2.backgroundColor = [UIColor colorRandom];
    [button2 setTitle:@"UIAlertController弹窗提示" forState:UIControlStateNormal];
    button2.buttonClick = ^(UIButton *button){
        [UIAlertController alertWithViewType:AlertControllerTypeAlert title:@"温馨提示" message:@"UIAlertController弹窗提示" cancelButtonTitle:@"取消" otherButtonTitles:@[@"知道了", @"拒绝了", @"警告了"] controller:weakSelf showInView:weakSelf.view onDismiss:^(int buttonIndex, NSString *buttonTitle) {
            if ([buttonTitle isEqualToString:@"知道了"])
            {
                NSLog(@"知道了");
            }
            else if ([buttonTitle isEqualToString:@"拒绝了"])
            {
                NSLog(@"拒绝了");
            }
            else if ([buttonTitle isEqualToString:@"警告了"])
            {
                NSLog(@"警告了");
            }
        } onCancel:^{
            NSLog(@"取消");
        }];
    };

    currentView = button2;
    
    UIButton *button3 = [UIButton buttonWithType: UIButtonTypeCustom];
    [self.view addSubview:button3];
    button3.frame = CGRectMake(10.0, (currentView.bottom + 10.0), currentView.width, 40.0);
    button3.backgroundColor = [UIColor colorRandom];
    [button3 setTitle:@"UIActionSheet表单提示" forState:UIControlStateNormal];
    button3.buttonClick = ^(UIButton *button){
        [UIActionSheet actionSheetWithTitle:@"温馨提示" message:@"UIActionSheet表单提示" cancelButtonTitle:@"取消" otherButtonTitles:@[@"知道了", @"拒绝了", @"警告了"] controller:weakSelf showInView:weakSelf.view onDismiss:^(int buttonIndex, NSString *buttonTitle) {
            if ([buttonTitle isEqualToString:@"知道了"])
            {
                NSLog(@"知道了");
            }
            else if ([buttonTitle isEqualToString:@"拒绝了"])
            {
                NSLog(@"拒绝了");
            }
            else if ([buttonTitle isEqualToString:@"警告了"])
            {
                NSLog(@"警告了");
            }
        } onCancel:^{
            NSLog(@"取消");
        }];
    };

    currentView = button3;
    
    UIButton *button4 = [UIButton buttonWithType: UIButtonTypeCustom];
    [self.view addSubview:button4];
    button4.frame = CGRectMake(10.0, (currentView.bottom + 10.0), currentView.width, 40.0);
    button4.backgroundColor = [UIColor colorRandom];
    [button4 setTitle:@"UIAlertController表单提示" forState:UIControlStateNormal];
    button4.buttonClick = ^(UIButton *button){
        [UIAlertController alertWithViewType:AlertControllerTypeActionSheet title:@"温馨提示" message:@"UIAlertController表单提示" cancelButtonTitle:@"取消" otherButtonTitles:@[@"知道了", @"拒绝了", @"警告了"] controller:weakSelf showInView:weakSelf.view onDismiss:^(int buttonIndex, NSString *buttonTitle) {
            if ([buttonTitle isEqualToString:@"知道了"])
            {
                NSLog(@"知道了");
            }
            else if ([buttonTitle isEqualToString:@"拒绝了"])
            {
                NSLog(@"拒绝了");
            }
            else if ([buttonTitle isEqualToString:@"警告了"])
            {
                NSLog(@"警告了");
            }
        } onCancel:^{
            NSLog(@"取消");
        }];
    };

}

@end
