//
//  ColorViewController.m
//  DemoCategory
//
//  Created by zhangshaoyu on 16/11/29.
//  Copyright © 2016年 zhangshaoyu. All rights reserved.
//

#import "ColorViewController.h"

@interface ColorViewController ()

@end

@implementation ColorViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItemTitle = @"UIColor";
    
    [self setUI];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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

- (void)setUI
{
    UIView *view01 = [[UIView alloc] initWithFrame:CGRectMake(10.0, 10.0, (self.view.width - 10.0 * 2), 30.0)];
    [self.view addSubview:view01];
    view01.viewText = @"随机颜色";
    view01.backgroundColor = [UIColor colorRandom];
    
    UIView *currentView = view01;
    
    UIView *view02 = [[UIView alloc] initWithFrame:CGRectMake(currentView.left, (currentView.bottom + 10.0), currentView.width, currentView.height)];
    [self.view addSubview:view02];
    view02.viewText = @"十六进制颜色";
    view02.backgroundColor = [UIColor colorWithHexString:@"oXe84515"];
    
    currentView = view02;
    
    UIView *view03 = [[UIView alloc] initWithFrame:CGRectMake(currentView.left, (currentView.bottom + 10.0), currentView.width, currentView.height)];
    [self.view addSubview:view03];
    view03.viewText = @"RGB颜色";
    view03.backgroundColor = [UIColor colorRed:60.0 green:68.0 blue:55.0];
    
    currentView = view03;
    
    UIView *view04 = [[UIView alloc] initWithFrame:CGRectMake(currentView.left, (currentView.bottom + 10.0), currentView.width, currentView.height)];
    [self.view addSubview:view04];
    view04.viewText = @"RGB颜色带透明度";
    view04.backgroundColor = [UIColor colorRed:100.0 green:80.0 blue:90.0 alpha:0.6];
    
    currentView = view04;
}

@end
