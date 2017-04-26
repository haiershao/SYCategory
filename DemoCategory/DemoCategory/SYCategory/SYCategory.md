# SYCategory
自定义UIKit、Foundation的类别，以适应在研发过程中常使用到的功能，提高开发效率。

[UIKit类别]
 * UILabel：自适应宽高、修改内容（指定文字颜色，大小，间距）
 * UIView：原点坐标设置、显示标签（内容，字体大小/颜色，对齐方式）、手势功能、缩放、旋转、翻转
 * UIButton：图标对齐方式、倒计时功能、block响应回调
 * UISlider：block响应回调
 * UISwitch：block响应回调
 * UIColor：十六进制颜色、随机颜色
 * UIImage：纯色图片、图片拉升、截图、压缩、裁剪、位图处理、滤镜、相册图片、保存
 * UIGestureRecognizer：block响应回调
 * UIViewController：根视图判断、导航栏标题、导航栏视图、导航栏返回按钮、导航栏右按钮
 * UINavigationController：导航栏样式
 * UIAlertView：block响应回调
 * UIActionSheet：block响应回调
 * UITextField：输入限制
 * UITextView：输入限制
 * UIImagePickerController：block响应回调

[Foundation类别]
 * NSString：其他对象的互换、数字/金额等的处理、特殊字符的限制
 * NSFileManager：文件操作、目录操作
 * NSAttributedString：副文本字符串处理
 * NSNumber：
 * NSObject：图片类型判断、文本字符宽高计算、结束编辑处理
 * NSArray：异常判断、排序、元素操作
 * NSDictionary：异常判断
 * NSTimer：
 * NSURLConnection：请求block回调处理
 * NSDate：日期处理
 * NSNotificationCenter：
 * NSUserDefaults：


# 修改完善
## 20170423
* NSObject添加响应回调方法
~~~ javascript
/// 监听响应，同时进行回调响应
- (void)observerForKeyPath:(NSString *)keyPath complete:(void (^)(NSString *key, id object, NSDictionary *change))complete;

/// 编辑控件输入响应（object为text）
- (void)observerTextEditComplete:(void (^)(id object))complete;
~~~

## 20170421
* NSTimer添加实例化方法（回调响应 & 子线程模式）
~~~ javascript
/// 实例化NSTimer（无须处理强引用 & 回调响应）
+ (NSTimer *)timerWithTimeInterval:(NSTimeInterval)time userInfo:(id)userInfo repeats:(BOOL)isRepeat handle:(void (^)(NSTimer *timer))handle;

/// 倒计时
+ (void)timerCountdownWithTimeInterval:(NSTimeInterval)time maxTimerInterval:(NSInteger)maxTime handle:(void (^)(NSInteger remainTime))handle;
~~~

## 20170420
* NSObject添加KVO类别方法（回调响应）
~~~ javascript
/// 监听响应，同时进行回调响应
- (void)observerComplete:(void (^)(id object))handle;
~~~
* NSNotificationCenter添加方法（回调响应）
~~~ javascript
/**
*  发送通知
*  add by zhangshaoyu, 2017-04-20
*  @param name 通知名称
*  @param dict 通知携带参数
*/
- (void)postNotificationWithName:(NSString *)name userInfo:(NSDictionary *)dict;

/**
*  接收通知
*  add by zhangshaoyu, 2017-04-20
*  @param name   通知名称
*  @param target 响应对象
*  @param action 响应方法
*/
- (void)receiveNotificationWithName:(NSString *)name target:(id)target selector:(SEL)action;

/**
*  接收通知并执行回调
*  add by zhangshaoyu, 2017-04-20
*  @param name   通知名称
*  @param handle 响应回调
*/
- (void)receiveNotificationWithName:(NSString *)name handle:(void (^)(NSNotification *notification))handle;

/**
*  移除通知
*  add by zhangshaoyu, 2017-04-20
*  @param name   通知名称
*  @param target 响应对象
*/
- (void)removeNotificationWithName:(NSString *)name target:(id)target;
~~~

## 20170419
* NSNotificationCenter添加方法（回调响应）
~~~ javascript
/**
*  发送通知
*  add by zhangshaoyu, 2017-04-20
*  @param name 通知名称
*  @param dict 通知携带参数
*/
- (void)postNotificationWithName:(NSString *)name userInfo:(NSDictionary *)dict;

/**
*  接收通知
*  add by zhangshaoyu, 2017-04-20
*  @param name   通知名称
*  @param target 响应对象
*  @param action 响应方法
*/
- (void)receiveNotificationWithName:(NSString *)name target:(id)target selector:(SEL)action;

/**
*  接收通知并执行回调
*  add by zhangshaoyu, 2017-04-20
*  @param name   通知名称
*  @param handle 响应回调
*/
- (void)receiveNotificationWithName:(NSString *)name handle:(void (^)(NSNotification *notification))handle;

/**
*  移除通知
*  add by zhangshaoyu, 2017-04-20
*  @param name   通知名称
*  @param target 响应对象
*/
- (void)removeNotificationWithName:(NSString *)name target:(id)target;
~~~

## 20170414
* NSString修改异常

## 20170413
* UITextField添加属性：
~~~ javascript
/// 限制输入指定字符（不需要结合通知使用）
@property (nonatomic, strong) NSString *allowedText;
~~~
* UITextView添加属性：
~~~ javascript
/// 限制输入指定字符（不需要结合通知使用）
@property (nonatomic, strong) NSString *allowedText;
~~~
* 修改输入字符限制（中文联想导致异常），只能输入指定字符，不能输入指定字符。
* NSString添加方法：
~~~ javascript
/// 是否包含子字符串
- (BOOL)isContantSubtext:(NSString *)text;
~~~

## 20170412
* UITableView添加方法：
~~~ javascript
/// 动态滚动到指定位置
- (void)scrollAtIndex:(NSInteger)section row:(NSInteger)row position:(UITableViewScrollPosition)position;
~~~ 

* NSString添加方法：
~~~ javascript
/// 是否包含指定的字符
- (BOOL)isContantSomeCharacters:(NSString *)characters;

/// 字符等级强弱度识别（1弱；2中；3强）
- (NSInteger)textStrengthGrade;

/// 是否是指定的字符类型
- (BOOL)isContantWithText:(NSString *)text;

/// 字符串是大小写英文
- (BOOL)isENNString;

/// 字符串是大写英文
- (BOOL)isUppercaseNSString;

/// 字符串是小写英文
- (BOOL)isLowercaseNSString;

/// 判断当前字符类型（NO中文字符；YES英文字符）
- (BOOL)isENCharacter;

/**
*  限制不能输入指定字符回调
*
*  @param text    限制不能输入的字符串
*  @param regular 回调
*/
- (void)regularWithText:(NSString *)text limitedHandle:(void (^)(NSInteger))regular;

/**
*  限制只能输入指定字符回调
*
*  @param text    限制只能输入的字符串
*  @param regular 回调
*/
- (void)regularWithText:(NSString *)text allowedHandle:(void (^)(NSInteger))regular;

/**
*  限制输入指定字符回调
*
*  @param text    限制指定字符串
*  @param islimit 是限制输入，还是允许输入
*  @param regular 回调
*/
- (void)regularWithText:(NSString *)text limited:(BOOL)islimit handle:(void (^)(NSInteger index))regular;
~~~