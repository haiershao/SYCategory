//
//  GestureViewController.m
//  DemoCategory
//
//  Created by zhangshaoyu on 16/11/29.
//  Copyright © 2016年 zhangshaoyu. All rights reserved.
//

#import "GestureViewController.h"

@interface GestureViewController ()

@end

@implementation GestureViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItemTitle = @"UIGestureRecognizer";
    
    [self setUI];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setUI
{
    UIScrollView *scrollerview = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:scrollerview];
    scrollerview.autoresizingMask = UIViewAutoresizingFlexibleHeight;
    
    
    UIView *view01 = [[UIView alloc] initWithFrame:CGRectMake(10.0, 10.0, (scrollerview.width - 10.0 * 2), 40.0)];
    [scrollerview addSubview:view01];
    view01.backgroundColor = [UIColor colorRandom];
    view01.viewText = @"单击手势";
    
    kSelfWeak;
    [view01 tapRecognizer:1 action:^(UITapGestureRecognizer *recognizer) {
        [UIAlertView alertWithTitle:nil message:@"单击手势" cancelButtonTitle:@"知道了" otherButtonTitles:nil controller:weakSelf onDismiss:^(int buttonIndex, NSString *buttonTitle) {
            
        } onCancel:^{
            
        }];
    }];
    
    UIView *currentView = view01;
    
    UIView *view02 = [[UIView alloc] initWithFrame:CGRectMake(currentView.left, (currentView.bottom + 10.0), currentView.width, currentView.height)];
    [scrollerview addSubview:view02];
    view02.backgroundColor = [UIColor colorRandom];
    view02.viewText = @"双击手势";
    [view02 tapRecognizer:2 action:^(UITapGestureRecognizer *recognizer) {
        [UIAlertView alertWithTitle:nil message:@"双击手势" cancelButtonTitle:@"知道了" otherButtonTitles:nil controller:weakSelf onDismiss:^(int buttonIndex, NSString *buttonTitle) {
            
        } onCancel:^{
            
        }];
    }];
    
    currentView = view02;
    
    UIView *view03 = [[UIView alloc] initWithFrame:CGRectMake(currentView.left, (currentView.bottom + 10.0), currentView.width, currentView.height)];
    [scrollerview addSubview:view03];
    view03.backgroundColor = [UIColor colorRandom];
    view03.viewText = @"长按手势-2秒";
    [view03 longPressRecognizer:2.0 action:^(UILongPressGestureRecognizer *recognizer) {
        [UIAlertView alertWithTitle:nil message:@"长按手势-2秒" cancelButtonTitle:@"知道了" otherButtonTitles:nil controller:weakSelf onDismiss:^(int buttonIndex, NSString *buttonTitle) {
            
        } onCancel:^{
            
        }];
    }];
    
    currentView = view03;
    
    UIView *view04 = [[UIView alloc] initWithFrame:CGRectMake(currentView.left, (currentView.bottom + 10.0), currentView.width, currentView.height)];
    [scrollerview addSubview:view04];
    view04.backgroundColor = [UIColor colorRandom];
    view04.viewText = @"拖动手势";
    [view04 panRecognizer:^(UIPanGestureRecognizer *recognizer) {
        [UIAlertView alertWithTitle:nil message:@"拖动手势" cancelButtonTitle:@"知道了" otherButtonTitles:nil controller:weakSelf onDismiss:^(int buttonIndex, NSString *buttonTitle) {
            
        } onCancel:^{
            
        }];
    }];
    
    currentView = view04;
    
    UIView *view05 = [[UIView alloc] initWithFrame:CGRectMake(currentView.left, (currentView.bottom + 10.0), currentView.width, currentView.height)];
    [scrollerview addSubview:view05];
    view05.backgroundColor = [UIColor colorRandom];
    view05.viewText = @"滑动手势-向右";
    [view05 swipeRecognizer:UISwipeGestureRecognizerDirectionRight action:^(UISwipeGestureRecognizer *recognizer) {
        [UIAlertView alertWithTitle:nil message:@"滑动手势-向右" cancelButtonTitle:@"知道了" otherButtonTitles:nil controller:weakSelf onDismiss:^(int buttonIndex, NSString *buttonTitle) {
            
        } onCancel:^{
            
        }];
    }];
    
    currentView = view05;
    
    UIView *view06 = [[UIView alloc] initWithFrame:CGRectMake(currentView.left, (currentView.bottom + 10.0), currentView.width, currentView.width)];
    [scrollerview addSubview:view06];
    view06.backgroundColor = [UIColor colorRandom];
    view06.viewText = @"拿捏手势";
    [view06 pinchRecognizer:^(UIPinchGestureRecognizer *recognizer) {
        [UIAlertView alertWithTitle:nil message:@"拿捏手势" cancelButtonTitle:@"知道了" otherButtonTitles:nil controller:weakSelf onDismiss:^(int buttonIndex, NSString *buttonTitle) {
            
        } onCancel:^{
            
        }];
    }];
    
    currentView = view06;
    
    UIView *view07 = [[UIView alloc] initWithFrame:CGRectMake(currentView.left, (currentView.bottom + 10.0), currentView.width, currentView.width)];
    [scrollerview addSubview:view07];
    view07.backgroundColor = [UIColor colorRandom];
    view07.viewText = @"旋转手势";
    [view07 rotationRecognizer:^(UIRotationGestureRecognizer *recognizer) {
        [UIAlertView alertWithTitle:nil message:@"旋转手势" cancelButtonTitle:@"知道了" otherButtonTitles:nil controller:weakSelf onDismiss:^(int buttonIndex, NSString *buttonTitle) {
            
        } onCancel:^{
            
        }];
    }];
    
    currentView = view07;
    
    scrollerview.contentSize = CGSizeMake(scrollerview.width, currentView.bottom + 10.0);
}

@end
