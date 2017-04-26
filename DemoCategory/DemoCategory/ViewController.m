//
//  ViewController.m
//  DemoCategory
//
//  Created by herman on 16/6/25.
//  Copyright © 2016年 zhangshaoyu. All rights reserved.
//

#import "ViewController.h"

#import "LabelViewController.h"
#import "ButtonViewController.h"
#import "ImageViewController.h"
#import "ColorViewController.h"
#import "GestureViewController.h"
#import "AlertSheetViewController.h"
#import "TextFieldViewController.h"
#import "ImagePickerViewController.h"

#import "NSStringViewController.h"
#import "NSObjectViewController.h"
#import "NSDataViewController.h"
#import "NSFileManagerViewController.h"
#import "NSNumberViewController.h"
#import "NSArrayViewController.h"
#import "NSDictionaryViewController.h"
#import "NSTimerViewController.h"
#import "NSURLConnectionViewController.h"
#import "NSDateViewController.h"
#import "NSNotificationViewController.h"
#import "NSUserDefaultViewController.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *mainTableView;
@property (nonatomic, strong) NSArray *mainArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.title = @"category";
    
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
    NSArray *uiArray = @[@"UILabel", @"UIButton/UISlider/UISwitch/UISegmentControl", @"UIImage", @"UIColor", @"UIGestureRecognizer", @"UIAlertView/UIActionSheet", @"UITextField/UITextView", @"UIImagePickerViewController"];
    NSArray *foundationArray = @[@"NSString/AttributedString", @"NSObject", @"NSData", @"NSFileManager", @"NSNumber", @"NSArray", @"NSDictionary", @"NSTimer", @"NSURLConnection", @"NSDate", @"NSNotificationCenter", @"NSUserDefaults"];
    self.mainArray = @[uiArray, foundationArray];
    
    self.mainTableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    [self.view addSubview:self.mainTableView];
    self.mainTableView.autoresizingMask = UIViewAutoresizingFlexibleHeight;
    self.mainTableView.delegate = self;
    self.mainTableView.dataSource = self;
}

#pragma mark - UITableViewDataSource, UITableViewDelegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.mainArray.count;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    NSString *title = (0 == section ? @"UIKit" : @"UIFoundation");
    return title;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSArray *array = self.mainArray[section];
    return array.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"UITableViewCell"];
    }
    
    NSArray *array = self.mainArray[indexPath.section];
    NSString *text = array[indexPath.row];
    cell.textLabel.text = text;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    UIViewController *nextVC = [[UIViewController alloc] init];
    if (0 == indexPath.section)
    {
        switch (indexPath.row)
        {
            case 0: nextVC = [[LabelViewController alloc] init]; break;
            case 1: nextVC = [[ButtonViewController alloc] init]; break;
            case 2: nextVC = [[ImageViewController alloc] init]; break;
            case 3: nextVC = [[ColorViewController alloc] init]; break;
            case 4: nextVC = [[GestureViewController alloc] init]; break;
            case 5: nextVC = [[AlertSheetViewController alloc] init]; break;
            case 6: nextVC = [[TextFieldViewController alloc] init]; break;
            case 7: nextVC = [[ImagePickerViewController alloc] init]; break;
            default: break;
        }
    }
    else if (1 == indexPath.section)
    {
        switch (indexPath.row)
        {
            case 0: nextVC = [[NSStringViewController alloc] init]; break;
            case 1: nextVC = [[NSObjectViewController alloc] init]; break;
            case 2: nextVC = [[NSDataViewController alloc] init]; break;
            case 3: nextVC = [[NSFileManagerViewController alloc] init]; break;
            case 4: nextVC = [[NSNumberViewController alloc] init]; break;
            case 5: nextVC = [[NSArrayViewController alloc] init]; break;
            case 6: nextVC = [[NSDictionaryViewController alloc] init]; break;
            case 7: nextVC = [[NSTimerViewController alloc] init]; break;
            case 8: nextVC = [[NSURLConnectionViewController alloc] init]; break;
            case 9: nextVC = [[NSDateViewController alloc] init]; break;
            case 10: nextVC = [[NSNotificationViewController alloc] init]; break;
            case 11: nextVC = [[NSUserDefaultViewController alloc] init]; break;
            default: break;
        }
    }
    
    [self.navigationController pushViewController:nextVC animated:YES];
}

@end
