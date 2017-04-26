//
//  NSStringViewController.m
//  DemoCategory
//
//  Created by zhangshaoyu on 16/12/20.
//  Copyright © 2016年 zhangshaoyu. All rights reserved.
//

#import "NSStringViewController.h"

@interface NSStringViewController ()

@end

@implementation NSStringViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"字符串";
    
    kSelfWeak;
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem rightBarButtonItemWithTitle:@"clear" action:^(UIButton *item) {
        
        UITextField *textField = (UITextField *)[weakSelf.view viewWithTag:2001];
        textField.text = nil;
        
        UITextView *textView = (UITextView *)[weakSelf.view viewWithTag:2002];
        textView.text = nil;
    }];
    
    [self setUI];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setUI
{
    self.isHieddenKeyboard = YES;
    
    UITextField *textField = [[UITextField alloc] initWithFrame:CGRectMake(10.0, 10.0, (self.view.width - 10.0 * 2), 40.0)];
    [self.view addSubview:textField];
    [textField layerWithRadius:5.0 borderColor:UIColorRandom borderWidth:1.0];
    textField.textColor = [UIColor blackColor];
    textField.clearButtonMode = UITextFieldViewModeWhileEditing;
    textField.tag = 2001;
    
    UIView *currentView = textField;
    
    UITextView *textView = [[UITextView alloc] initWithFrame:CGRectMake(currentView.left, (currentView.bottom + 10.0), currentView.width, 60.0)];
    [self.view addSubview:textView];
    [textView layerWithRadius:5.0 borderColor:UIColorRandom borderWidth:1.0];
    textView.textColor = [UIColor blackColor];
    textView.tag = 2002;
    
    currentView = textView;
    
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0.0, (currentView.bottom + 10.0), self.view.width, (self.view.height - currentView.bottom - 10.0))];
    [self.view addSubview:scrollView];
    scrollView.autoresizingMask = UIViewAutoresizingFlexibleHeight;
    
    int rowButton = 3;
    CGFloat origin = 10.0;
    CGFloat widthButton = (self.view.width - (rowButton + 1) * origin) / rowButton;
    CGFloat heightButton = 40.0;
    
    
    NSArray *array = @[@"IP", @"number16转string", @"首字符", @"用*号隐藏指定位", @"保留任意位小数", @"金额转换显示", @"有效字符", @"非空字符", @"过滤空格字符", @"汉字字符", @"字符长度", @"手机号码", @"移动手机号码", @"联通手机号码", @"电信手机号码", @"邮箱", @"空格字符串", @"包含某个子字符串", @"包含中文", @"纯数字字符串", @"数字大小写字母_@的字符串", @"指定金额（2位小数）", @"有效银行卡", @"有效身份证"];
    for (int i = 0; i < array.count; i++)
    {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [scrollView addSubview:button];
        button.frame = CGRectMake((i % rowButton * (widthButton + origin) + origin), (i / rowButton * (heightButton + origin)), widthButton, heightButton);
        button.backgroundColor = [UIColor colorRandom];
        button.titleLabel.adjustsFontSizeToFitWidth = YES;
        [button setTitle:[NSString stringWithFormat:@"%@--%@", @(i), array[i]] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
        button.tag = i + 1000;
        [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        
        currentView = button;
    }
    
    scrollView.contentSize = CGSizeMake(scrollView.width, currentView.bottom + 10.0);
}

- (void)buttonClick:(UIButton *)button
{
    [self editingDone];
    
    UITextField *textField = (UITextField *)[self.view viewWithTag:2001];
    UITextView *textView = (UITextView *)[self.view viewWithTag:2002];
    NSString *message = nil;
    
    NSInteger index = button.tag - 1000;
    if (0 == index)
    {
        message = [NSString IPAddress];
    }
    else if (1 == index)
    {
        message = [NSString stringWithNumber:@(16)];
    }
    else if (2 == index)
    {
        NSString *text = textField.text;
        message = [text firstCharacter];
    }
    else if (3 == index)
    {
        NSString *text = textField.text;
        message = [text textHiddenWithSymbol:@"+" showBegin:2 showEnd:2];
    }
    else if (4 == index)
    {
        NSString *text = textField.text;
        message = [text textKeepDecimalPointWithNumber:10];
    }
    else if (5 == index)
    {
        NSString *text = textField.text;
        message = [text textMoneySeparatorWithSymbol:@","];
    }
    else if (6 == index)
    {
        NSString *text = textField.text;
        message = [NSString stringWithFormat:@"%@：%@", text, ([NSString isValidNSString:text] ? @"有效" : @"无效")];
    }
    else if (7 == index)
    {
        NSString *text = textField.text;
        message = [NSString stringWithFormat:@"%@：%@", text, ([NSString isNullNSString:text] ? @"非空有效" : @"非空无效")];
    }
    else if (8 == index)
    {
        NSString *text = textField.text;
        message = [NSString stringWithFormat:@"%@：%@", text, [text textFilterBlankSpace]];
    }
    else if (9 == index)
    {
        NSString *text = textField.text;
        message = [NSString stringWithFormat:@"%@：%@", text, ([text isCNNSString] ? @"汉字字符" : @"非汉字字符")];
    }
    else if (10 == index)
    {
        NSString *text = textField.text;
        message = [NSString stringWithFormat:@"%@（长度）：%@", text, @([text textLength:NO])];
    }
    else if (11 == index)
    {
        NSString *text = textField.text;
        message = [NSString stringWithFormat:@"%@（手机）：%@", text, ([text isValidMobile] ? @"是" : @"否")];
    }
    else if (12 == index)
    {
        NSString *text = textField.text;
        message = [NSString stringWithFormat:@"%@（移动手机）：%@", text, ([text isValidMobileCM] ? @"是" : @"否")];
    }
    else if (13 == index)
    {
        NSString *text = textField.text;
        message = [NSString stringWithFormat:@"%@（联通手机）：%@", text, ([text isValidMobileCU] ? @"是" : @"否")];
    }
    else if (14 == index)
    {
        NSString *text = textField.text;
        message = [NSString stringWithFormat:@"%@（电信手机）：%@", text, ([text isValidMobileCT] ? @"是" : @"否")];
    }
    else if (15 == index)
    {
        NSString *text = textField.text;
        message = [NSString stringWithFormat:@"%@（邮箱）：%@", text, ([text isValidEmail] ? @"是" : @"否")];
    }
    else if (16 == index)
    {
        NSString *text = textField.text;
        message = [NSString stringWithFormat:@"%@（包含空格）：%@", text, ([text isSpaceString] ? @"是" : @"否")];
    }
    else if (17 == index)
    {
        NSString *text = textField.text;
        message = [NSString stringWithFormat:@"%@（包含子字符串 devZhang）：%@", text, ([text isContantSubtext:@"devZhang"] ? @"是" : @"否")];
    }
    else if (18 == index)
    {
        NSString *text = textField.text;
        message = [NSString stringWithFormat:@"%@（包含中文）：%@", text, ([text isENCharacter] ? @"是" : @"否")];
    }
    else if (19 == index)
    {
        NSString *text = textField.text;
        message = [NSString stringWithFormat:@"%@（纯数字字符串）：%@", text, ([text isNumberNSString] ? @"是" : @"否")];
    }
    else if (20 == index)
    {
        NSString *text = textField.text;
//        message = [NSString stringWithFormat:@"%@（数字大小写字母_@）：%@", text, ([text isValidAccount] ? @"有效" : @"无效")];
        message = [NSString stringWithFormat:@"%@（数字大小写字母4~12位）：%@", text, ([text isValidLimitAccount] ? @"有效" : @"无效")];
//        message = [NSString stringWithFormat:@"%@（数字字母8~12位）：%@", text, ([text isValidPassword] ? @"有效" : @"无效")];
    }
    else if (21 == index)
    {
        NSString *text = textField.text;
        message = [NSString stringWithFormat:@"%@（指定金额）：%@", text, ([text isValidMoney] ? @"有效" : @"无效")];
    }
    else if (22 == index)
    {
        NSString *text = textField.text;
        message = [NSString stringWithFormat:@"%@：%@ 银行卡", text, ([text isValidBankCardNumber] ? @"有效" : @"无效")];
    }
    else if (23 == index)
    {
        NSString *text = textField.text;
        message = [NSString stringWithFormat:@"%@：%@ 身份证", text, ([text isValidIdentityCard] ? @"有效" : @"无效")];
    }
    
    textView.text = message;
}


@end
