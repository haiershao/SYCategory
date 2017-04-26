//
//  TextFieldViewController.m
//  DemoCategory
//
//  Created by zhangshaoyu on 16/11/29.
//  Copyright © 2016年 zhangshaoyu. All rights reserved.
//

#import "TextFieldViewController.h"

@interface TextFieldViewController () <UITextFieldDelegate, UITextViewDelegate>

@end

@implementation TextFieldViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItemTitle = @"UITextField/UITextView";

    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"done" style:UIBarButtonItemStyleDone target:self action:@selector(endClick)];
    [self setUI];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setUI
{
    UIScrollView *backScrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:backScrollView];
    backScrollView.tag = 10000;
    backScrollView.backgroundColor = [UIColor colorRandom];
    backScrollView.autoresizingMask = UIViewAutoresizingFlexibleHeight;
    
    
    UITextField *textfield = [[UITextField alloc] initWithFrame:CGRectMake(10.0, 10.0, (backScrollView.width - 10.0 * 2), 40.0)];
    [backScrollView addSubview:textfield];
    [textfield layerWithRadius:5.0 borderColor:[UIColor colorRandom] borderWidth:0.5];
    [textfield viewModeType:TextFieldViewModeTypeLeft space:10.0];
    textfield.clearButtonMode = UITextFieldViewModeWhileEditing;
    textfield.tag = 1001;
    textfield.delegate = self;
    // 限制输入长度 方法1-属性
//    textfield.limitMaxLength = @(10);
    // 限制输入长度 方法2-通知
//    [NSNotificationCenter receiveNotificationWithName:UITextFieldTextDidChangeNotification target:self sel:@selector(textEditChange:)];
    // 限制输入长度 方法3-代理方法中
    textfield.placeholder = @"限制输入：长度";
    
    UIView *currentView = textfield;
    
    UITextField *textfield2 = [[UITextField alloc] initWithFrame:CGRectMake(10.0, (currentView.bottom + 10.0), currentView.width, currentView.height)];
    [backScrollView addSubview:textfield2];
    [textfield2 layerWithRadius:5.0 borderColor:[UIColor colorRandom] borderWidth:0.5];
    [textfield2 viewModeType:TextFieldViewModeTypeLeft space:10.0];
    textfield2.clearButtonMode = UITextFieldViewModeWhileEditing;
    textfield2.tag = 1002;
    textfield2.delegate = self;
    textfield2.placeholder = @"限制输入：只能输入手机号码";
    
    currentView = textfield2;
    
    UITextField *textfield3 = [[UITextField alloc] initWithFrame:CGRectMake(10.0, (currentView.bottom + 10.0), currentView.width, currentView.height)];
    [backScrollView addSubview:textfield3];
    [textfield3 layerWithRadius:5.0 borderColor:[UIColor colorRandom] borderWidth:0.5];
    [textfield3 viewModeType:TextFieldViewModeTypeLeft space:10.0];
    textfield3.clearButtonMode = UITextFieldViewModeWhileEditing;
    textfield3.tag = 1003;
    textfield3.delegate = self;
    textfield3.placeholder = @"限制输入：输入数字";
    
    currentView = textfield3;
    
    UITextField *textfield4 = [[UITextField alloc] initWithFrame:CGRectMake(10.0, (currentView.bottom + 10.0), currentView.width, currentView.height)];
    [backScrollView addSubview:textfield4];
    [textfield4 layerWithRadius:5.0 borderColor:[UIColor colorRandom] borderWidth:0.5];
    [textfield4 viewModeType:TextFieldViewModeTypeLeft space:10.0];
    textfield4.clearButtonMode = UITextFieldViewModeWhileEditing;
    textfield4.tag = 1004;
    textfield4.delegate = self;
    textfield4.placeholder = @"限制输入：第N位限制指定字符";
    
    currentView = textfield4;
    
    UITextField *textfield5 = [[UITextField alloc] initWithFrame:CGRectMake(10.0, (currentView.bottom + 10.0), currentView.width, currentView.height)];
    [backScrollView addSubview:textfield5];
    [textfield5 layerWithRadius:5.0 borderColor:[UIColor colorRandom] borderWidth:0.5];
    [textfield5 viewModeType:TextFieldViewModeTypeLeft space:10.0];
    textfield5.clearButtonMode = UITextFieldViewModeWhileEditing;
    textfield5.tag = 1005;
    textfield5.delegate = self;
    textfield5.placeholder = @"限制输入：指定字符";
    // 限制输入指定字符 方法1-属性
    textfield5.limitText = @"1234567890";
    // 限制输入指定字符 方法2-代理方法中
    
    
    currentView = textfield5;
    
    UITextView *textview = [[UITextView alloc] initWithFrame:CGRectMake(10.0, (currentView.bottom + 10.0), currentView.width, 80.0)];
    [backScrollView addSubview:textview];
    [textview layerWithRadius:5.0 borderColor:[UIColor colorRandom] borderWidth:0.5];
    textview.tag = 2001;
    textview.delegate = self;
    // 限制输入指定字符
    textview.limitText = @"1234567890";
    // 占位符属性
    textview.placeHolderTextColor = [UIColor brownColor];
    textview.placeHolderTextFont = [UIFont systemFontOfSize:12.0];
    textview.placeHolderText = @"限制输入：指定字符0123456789";
 
    currentView = textview;
    
    UITextView *textview2 = [[UITextView alloc] initWithFrame:CGRectMake(10.0, (currentView.bottom + 10.0), currentView.width, 60.0)];
    [backScrollView addSubview:textview2];
    [textview2 layerWithRadius:5.0 borderColor:[UIColor colorRandom] borderWidth:0.5];
    textview2.tag = 2002;
    textview2.delegate = self;
    // 限制输入字符长度-方法1 属性
//    textview2.limitMaxLength = @(30);
    // 限制输入字符长度-方法2 通知
    NSNotificationCenterReceive(UITextViewTextDidChangeNotification, self, @selector(textViewEditChange:));
    // 占位符属性
    textview2.placeHolderTextColor = [UIColor brownColor];
    textview2.placeHolderTextFont = [UIFont systemFontOfSize:12.0];
    textview2.placeHolderText = @"限制输入：指定字符长度";

    currentView = textview2;
    
    backScrollView.contentSize = CGSizeMake(backScrollView.width, (currentView.bottom + 10.0));
    
}

- (void)endClick
{
    [self.view editingDone];
}

- (void)textEditChange:(NSNotification *)notification
{
    UITextField *textfield = (UITextField *)[self.view viewWithTag:1000];
    // 限制字符
//    [textfield limitTextFieldLength:10];
    // 限制中文
    [textfield limitTextFieldCNLength:10];
}

#pragma mark - UITextFieldDelegate

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    if (textField.tag == 1001)
    {
        // 限制输入长度
        BOOL isResult = [textField limitLength:5 shouldChangeCharactersInRange:range replacementString:string];
        return isResult;
    }
    else if (1002 == textField.tag)
    {
        // 限制只能输入手机号
        BOOL isResult = [textField limitMoblieShouldChangeCharactersInRange:range replacementString:string];
        return isResult;
    }
    else if (1003 == textField.tag)
    {
        // 限制输入数字
        BOOL isResult = [textField limitNumberShouldChangeCharactersInRange:range replacementString:string integer:10 greaterThanZero:YES decimalPoint:YES decimalDigits:2];
        return isResult;
    }
    else if (1004 == textField.tag)
    {
        // 限制第N位不能输入指定字符
        BOOL isResult = [textField limitCharacterShouldChangeCharactersInRange:range replacementString:string limitCharacters:@"1234567890" limitIndex:5];
        return isResult;
    }
    else if (1005 == textField.tag)
    {
        // 限制只能输入指定字符
//        BOOL isResult = [textField limitTextField:string limitStr:@"1234567890" edit:NO];
//        return isResult;
    }
    
    return YES;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField editingDone];
    return YES;
}

#pragma mark - UITextViewDelegate

- (void)textViewEditChange:(NSNotification *)notification
{
    UITextView *textview = (UITextView *)[self.view viewWithTag:2002];
    // 限制字符
    [textview limitTextViewLength:30];
    // 限制中文
//    [textview limitTextViewCNLength:30];
}

- (BOOL)textViewShouldBeginEditing:(UITextView *)textView
{
    NSNotificationCenterReceive(UIKeyboardWillShowNotification, self, @selector(keyboardShow:));
    
    return YES;
}

- (BOOL)textViewShouldEndEditing:(UITextView *)textView
{
    NSNotificationCenterReceive(UIKeyboardWillHideNotification, self, @selector(keyboardHidden:));
    
    return YES;
}

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    if ([text isEqualToString:@"\n"])
    {
        [textView resignFirstResponder];
    }
    
    return YES;
}

- (void)keyboardShow:(NSNotification *)notification
{
    NSDictionary *dict = notification.userInfo;
    CGSize keyboardSize = [[dict objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue].size;
    UIScrollView *scrollview = (UIScrollView *)[self.view viewWithTag:10000];
    scrollview.height = (self.view.height - keyboardSize.height);
}

- (void)keyboardHidden:(NSNotification *)notification
{
    UIScrollView *scrollview = (UIScrollView *)[self.view viewWithTag:10000];
    scrollview.height = self.view.height;
}

@end
