//
//  NSUserDefaultViewController.m
//  DemoCategory
//
//  Created by zhangshaoyu on 16/12/20.
//  Copyright © 2016年 zhangshaoyu. All rights reserved.
//

#import "NSUserDefaultViewController.h"

@interface NSUserDefaultViewController ()

@end

@implementation NSUserDefaultViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"NSUserDefaults";
    
    self.isHieddenKeyboard = YES;
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
    
    UIView *currentView = nil;
    
    NSArray *array = @[@"读取信息", @"保存信息", @"删除信息", @"修改信息"];
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
        
        currentView = button;
    }
    
    UITextField *textField = [[UITextField alloc] initWithFrame:CGRectMake(10.0, currentView.bottom + 10.0, self.view.width - 10.0 * 2, 40.0)];
    [self.view addSubview:textField];
    [textField layerWithRadius:5.0 borderColor:[UIColor greenColor] borderWidth:1.0];
    textField.textColor = [UIColor blackColor];
    textField.placeholder = @"NSUserDefaults";
    textField.tag = 2000;
}

- (void)buttonClick:(UIButton *)button
{
    [self.view endEditing:YES];
    
    NSString *title = button.titleLabel.text;
    if ([title isEqualToString:@"读取信息"])
    {
        NSString *name = NSUserDefaultsRead(@"name");
        NSLog(@"name = %@", name);
    }
    if ([title isEqualToString:@"保存信息"])
    {
        NSUserDefaultsSave(@"devZhang", @"name");
    }
    if ([title isEqualToString:@"删除信息"])
    {
        NSUserDefaultsRemove(@"name");
    }
    if ([title isEqualToString:@"修改信息"])
    {
        UITextField *textfield = [(UITextField *)self.view viewWithTag:2000];
        NSString *text = textfield.text;
        NSUserDefaultsSave(text, @"name");
    }
}

@end
