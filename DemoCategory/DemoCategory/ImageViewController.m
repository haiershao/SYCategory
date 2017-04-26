//
//  ImageViewController.m
//  DemoCategory
//
//  Created by zhangshaoyu on 16/11/29.
//  Copyright © 2016年 zhangshaoyu. All rights reserved.
//

#import "ImageViewController.h"

@interface ImageViewController ()

@end

@implementation ImageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItemTitle = @"UIImage";
    
    [self setUI];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setUI
{
    UIScrollView *scrollview = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:scrollview];
    scrollview.autoresizingMask = UIViewAutoresizingFlexibleHeight;
    
    CGFloat originXY = 10.0;
    CGFloat sizeImage = 90.0;
    
    // 本地图片-模糊处理
    __block UIImageView *imageview = [[UIImageView alloc] initWithFrame:CGRectMake(originXY, originXY, sizeImage, sizeImage)];
    [scrollview addSubview:imageview];
    imageview.viewText = @"本地图片-模糊";
    imageview.viewTextColor = [UIColor redColor];
    imageview.viewTextFont = [UIFont systemFontOfSize:20.0];
    imageview.image = [UIImage imageNamed:@"image"];
    [imageview effectViewWithAlpha:0.3];
    
    UIView *currentView = imageview;

    UISlider *sliderT = [[UISlider alloc] initWithFrame:CGRectMake((currentView.right + originXY), currentView.top, (scrollview.width - currentView.right - originXY * 2), 20.0)];
    [scrollview addSubview:sliderT];
    sliderT.minimumValue = 0.0;
    sliderT.maximumValue = 100.0;
    sliderT.viewText = @"旋转";
    sliderT.viewTextFont = [UIFont systemFontOfSize:8.0];
    sliderT.sliderClick = ^(UISlider *slider){
        [imageview viewTransformWithRotation:slider.value];
    };
    
    UISlider *sliderS = [[UISlider alloc] initWithFrame:CGRectMake(sliderT.left, (sliderT.bottom + originXY), sliderT.width, 20.0)];
    [scrollview addSubview:sliderS];
    sliderS.value = 1.0;
    sliderS.minimumValue = 0.5;
    sliderS.maximumValue = 1.5;
    sliderS.viewText = @"缩放";
    sliderS.viewTextFont = [UIFont systemFontOfSize:8.0];
    sliderS.sliderClick = ^(UISlider *slider){
        NSLog(@"scale size = %@", @(slider.value));
        [imageview viewScaleWithSize:slider.value];
    };
    
    UISwitch *switchView = [[UISwitch alloc] initWithFrame:CGRectMake(sliderS.left, (sliderS.bottom + originXY), 0.0, 0.0)];
    [scrollview addSubview:switchView];
    switchView.viewText = @"翻转";
    switchView.switchClick = ^(UISwitch *sender){
        [imageview viewFlipType:ViewFlipTypeVertical];
    };
    
    
    // 本地图片
    UIImageView *imageview2 = [[UIImageView alloc] initWithFrame:CGRectMake(originXY, (currentView.bottom + originXY), currentView.width, currentView.height)];
    [scrollview addSubview:imageview2];
    imageview2.viewText = @"本地图片";
    imageview2.viewTextRect = CGRectMake(originXY, (imageview2.height - 30.0), (imageview2.width - originXY * 2), 30.0);
    imageview2.viewTextAlignment = NSTextAlignmentRight;
    imageview2.image = [UIImage imageWithBundleName:@"image.png"];
    
    currentView = imageview2;

    // 本地图片-灰色处理
    UIImageView *imageview3 = [[UIImageView alloc] initWithFrame:CGRectMake((currentView.right + originXY), currentView.top, sizeImage, sizeImage)];
    [scrollview addSubview:imageview3];
    imageview3.viewText = @"本地图片";
    imageview3.image = [UIImage imageWithBundleName:@"image" type:@"png"];
    
    // 颜色图片
    UIImageView *imageview4 = [[UIImageView alloc] initWithFrame:CGRectMake(originXY, (currentView.bottom + originXY), sizeImage, sizeImage)];
    [scrollview addSubview:imageview4];
    imageview4.viewText = @"颜色图片";
    imageview4.image = [UIImage imageWithColor:[UIColor colorRandom] size:CGSizeMake(1.0, 1.0)];
    
    currentView = imageview4;

    // 网络图片
    UIImageView *imageview5 = [[UIImageView alloc] initWithFrame:CGRectMake((currentView.right + originXY), currentView.top, sizeImage, sizeImage)];
    [scrollview addSubview:imageview5];
    imageview5.viewText = @"网络图片";
    UIImage *image = [UIImage imageWithUrl:@"https://gd4.alicdn.com/imgextra/i2/328015135/TB2AhDMtFXXXXcoXpXXXXXXXXXX_!!328015135.jpg_400x400.jpg"];
    imageview5.image = image;
    
    currentView = imageview5;
    
    // 拉升图片
    UIImageView *imageview6 = [[UIImageView alloc] initWithFrame:CGRectMake((currentView.right + originXY), currentView.top, sizeImage, sizeImage)];
    [scrollview addSubview:imageview6];
    imageview6.viewText = @"拉升图片";
    UIImage *image6 = [UIImage imageNamed:@"image"];
//    [image6 resizableImage];
//    [image resizableImage:UIEdgeInsetsMake(10.0, 10.0, 10.0, 10.0)];
    [image resizableImage:UIEdgeInsetsMake(10.0, 10.0, 10.0, 10.0) mode:UIImageResizingModeTile];
    imageview6.image = image6;
    
    currentView = imageview5;
    
    // 圆角图片
    UIImageView *imageview7 = [[UIImageView alloc] initWithFrame:CGRectMake(originXY, (currentView.bottom + originXY), sizeImage, sizeImage)];
    [scrollview addSubview:imageview7];
    imageview7.viewText = @"圆角图片-致灰";
    imageview7.viewTextRect = CGRectMake(originXY, (imageview7.height - 20.0), (imageview7.width - originXY * 2), 20.0);
    UIImage *image7 = [image grayImage]; // 致灰
    image7 = [image7 roundedImageWithRadius:50.0]; // 圆角
    imageview7.image = image7;
    
    currentView = imageview7;
    
    // 方形图片
    UIImageView *imageview8 = [[UIImageView alloc] initWithFrame:CGRectMake((currentView.right + originXY), currentView.top, sizeImage, sizeImage)];
    [scrollview addSubview:imageview8];
    imageview8.viewText = @"方形图片";
    imageview8.viewTextRect = CGRectMake(10.0, 10.0, (imageview8.width - 10.0 * 2), 30.0);
    imageview8.viewTextAlignment = NSTextAlignmentLeft;
    UIImage *image8 = [image squareImageWithSize:CGSizeMake(20.0, 20.0)];
    imageview8.image = image8;
    
    
    currentView = imageview8;
    
    
    // 滤镜
    UIScrollView *filterScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0.0, (currentView.bottom + originXY), scrollview.width, (sizeImage + originXY * 2))];
    [scrollview addSubview:filterScrollView];
    filterScrollView.backgroundColor = [UIColor colorRandom];
    for (int i = 0; i < 8; i++)
    {
        __block UIImageView *subImageview = [[UIImageView alloc] initWithFrame:CGRectMake(originXY + (i * (sizeImage + originXY)), originXY, sizeImage, sizeImage)];
        [filterScrollView addSubview:subImageview];
        [subImageview layerWithRadius:5.0 borderColor:[UIColor colorRandom] borderWidth:1.0];
        UIImage *image = [UIImage imageNamed:@"header_girl"];
        switch (i)
        {
            case 0:
            {
//                subImageview.image = [image imageFilterWithFilterName:@"CIPhotoEffectInstant"];
                [image imageFilterWithFilterName:@"CIPhotoEffectInstant" image:^(UIImage *image) {
                    subImageview.image = image;
                }];
                subImageview.viewText = @"怀旧";
            }
                break;
            case 1:
            {
//                subImageview.image = [image imageFilterWithFilterName:@"CIPhotoEffectNoir"];
                [image imageFilterWithFilterName:@"CIPhotoEffectNoir" image:^(UIImage *image) {
                    subImageview.image = image;
                }];
                subImageview.viewText = @"黑白";
            }
                break;
            case 2:
            {
//                subImageview.image = [image imageFilterWithFilterName:@"CIPhotoEffectTonal"];
                [image imageFilterWithFilterName:@"CIPhotoEffectTonal" image:^(UIImage *image) {
                    subImageview.image = image;
                }];
                subImageview.viewText = @"色调";
            }
                break;
            case 3:
            {
//                subImageview.image = [image imageFilterWithFilterName:@"CIPhotoEffectTransfer"];
                [image imageFilterWithFilterName:@"CIPhotoEffectTransfer" image:^(UIImage *image) {
                    subImageview.image = image;
                }];
                subImageview.viewText = @"岁月";
            }
                break;
            case 4:
            {
//                subImageview.image = [image imageFilterWithFilterName:@"CIPhotoEffectMono"];
                [image imageFilterWithFilterName:@"CIPhotoEffectMono" image:^(UIImage *image) {
                    subImageview.image = image;
                }];
                subImageview.viewText = @"单色";
            }
                break;
            case 5:
            {
//                subImageview.image = [image imageFilterWithFilterName:@"CIPhotoEffectFade"];
                [image imageFilterWithFilterName:@"CIPhotoEffectFade" image:^(UIImage *image) {
                    subImageview.image = image;
                }];
                subImageview.viewText = @"裉色";
            }
                break;
            case 6:
            {
//                subImageview.image = [image imageFilterWithFilterName:@"CIPhotoEffectProcess"];
                [image imageFilterWithFilterName:@"CIPhotoEffectProcess" image:^(UIImage *image) {
                    subImageview.image = image;
                }];
                subImageview.viewText = @"冲印";
            }
                break;
            case 7:
            {
//                subImageview.image = [image imageFilterWithFilterName:@"CIPhotoEffectChrome"];
                [image imageFilterWithFilterName:@"CIPhotoEffectChrome" image:^(UIImage *image) {
                    subImageview.image = image;
                }];
                subImageview.viewText = @"铬黄";
            }
                break;
                
            default:
                break;
        }
        filterScrollView.contentSize = CGSizeMake((subImageview.right + originXY), filterScrollView.height);
    }

    currentView = filterScrollView;

    // 可调节的模糊处理
    __block UIImage *image100 = [UIImage imageNamed:@"girl"];
    
    __block UIImageView *imageview101 = [[UIImageView alloc] initWithFrame:CGRectMake(originXY, (currentView.bottom + originXY), sizeImage, sizeImage)];
    [scrollview addSubview:imageview101];
    imageview101.viewText = @"高期的模糊";
    imageview101.image = image100;
    
    currentView = imageview101;
    
    UISlider *slider101 = [[UISlider alloc] initWithFrame:CGRectMake((currentView.right + originXY), currentView.top, (scrollview.width - currentView.right - originXY * 2), 20.0)];
    [scrollview addSubview:slider101];
    slider101.minimumValue = 0;
    slider101.maximumValue = 100;
    slider101.sliderClick = ^(UISlider *slider){
        NSInteger radius = slider.value;
        // imageview101.image = [image100 imageBlurWithBlurName:@"CIGaussianBlur" radius:radius];
        [image100 imageBlurWithBlurName:@"CIGaussianBlur" radius:radius image:^(UIImage *image) {
            imageview101.image = image;
        }];
    };
    
    __block UIImageView *imageview102 = [[UIImageView alloc] initWithFrame:CGRectMake(originXY, (currentView.bottom + originXY), sizeImage, sizeImage)];
    [scrollview addSubview:imageview102];
    imageview102.viewText = @"均值模糊";
    imageview102.image = image100;
    
    currentView = imageview102;
    
    UISlider *slider102 = [[UISlider alloc] initWithFrame:CGRectMake((currentView.right + originXY), currentView.top, (scrollview.width - currentView.right - originXY * 2), 20.0)];
    [scrollview addSubview:slider102];
    slider102.minimumValue = 0;
    slider102.maximumValue = 100;
    slider102.sliderClick = ^(UISlider *slider){
        NSInteger radius = slider.value;
        // imageview102.image = [image100 imageBlurWithBlurName:@"CIBoxBlur" radius:radius];
        [image100 imageBlurWithBlurName:@"CIBoxBlur" radius:radius image:^(UIImage *image) {
            imageview102.image = image;
        }];
    };

    __block UIImageView *imageview103 = [[UIImageView alloc] initWithFrame:CGRectMake(originXY, (currentView.bottom + originXY), sizeImage, sizeImage)];
    [scrollview addSubview:imageview103];
    imageview103.viewText = @"环形卷积模糊";
    imageview103.image = image100;
    
    currentView = imageview103;
    
    UISlider *slider103 = [[UISlider alloc] initWithFrame:CGRectMake((currentView.right + originXY), currentView.top, (scrollview.width - currentView.right - originXY * 2), 20.0)];
    [scrollview addSubview:slider103];
    slider103.minimumValue = 0;
    slider103.maximumValue = 100;
    slider103.sliderClick = ^(UISlider *slider){
        NSInteger radius = slider.value;
        // imageview103.image = [image100 imageBlurWithBlurName:@"CIDiscBlur" radius:radius];
        [image100 imageBlurWithBlurName:@"CIDiscBlur" radius:radius image:^(UIImage *image) {
            imageview103.image = image;
        }];
    };
    
    __block UIImageView *imageview104 = [[UIImageView alloc] initWithFrame:CGRectMake(originXY, (currentView.bottom + originXY), sizeImage, sizeImage)];
    [scrollview addSubview:imageview104];
    imageview104.viewText = @"中值模糊";
    imageview104.image = image100;
    
    currentView = imageview104;
    
    UISlider *slider104 = [[UISlider alloc] initWithFrame:CGRectMake((currentView.right + originXY), currentView.top, (scrollview.width - currentView.right - originXY * 2), 20.0)];
    [scrollview addSubview:slider104];
    slider104.minimumValue = 0;
    slider104.maximumValue = 100;
    slider104.sliderClick = ^(UISlider *slider){
        NSInteger radius = slider.value;
        // imageview104.image = [image100 imageBlurWithBlurName:@"CIMedianFilter" radius:radius];
        [image100 imageBlurWithBlurName:@"CIMedianFilter" radius:radius image:^(UIImage *image) {
            imageview104.image = image;
        }];
    };
    
    __block UIImageView *imageview105 = [[UIImageView alloc] initWithFrame:CGRectMake(originXY, (currentView.bottom + originXY), sizeImage, sizeImage)];
    [scrollview addSubview:imageview105];
    imageview105.viewText = @"运动模糊";
    imageview105.image = image100;
    
    currentView = imageview105;
    
    UISlider *slider105 = [[UISlider alloc] initWithFrame:CGRectMake((currentView.right + originXY), currentView.top, (scrollview.width - currentView.right - originXY * 2), 20.0)];
    [scrollview addSubview:slider105];
    slider105.minimumValue = 0;
    slider105.maximumValue = 100;
    slider105.sliderClick = ^(UISlider *slider){
        NSInteger radius = slider.value;
        // imageview105.image = [image100 imageBlurWithBlurName:@"CIMotionBlur" radius:radius];
        [image100 imageBlurWithBlurName:@"CIMotionBlur" radius:radius image:^(UIImage *image) {
            imageview105.image = image;
        }];
    };
    
    // 饱和度、亮度、对比度
    __block CGFloat imageSaturation = 100.0;
    __block CGFloat imageBrightness = 100.0;
    __block CGFloat imageContrast = 100.0;
    __block UIImageView *imageview106 = [[UIImageView alloc] initWithFrame:CGRectMake(originXY, (currentView.bottom + originXY), sizeImage, sizeImage)];
    [scrollview addSubview:imageview106];
    imageview106.viewText = @"饱和度、亮度、对比度";
    imageview106.image = image100;
    
    currentView = imageview106;
    
    UISlider *slider106 = [[UISlider alloc] initWithFrame:CGRectMake((currentView.right + originXY), currentView.top, (scrollview.width - currentView.right - originXY * 2), 20.0)];
    [scrollview addSubview:slider106];
    slider106.minimumValue = 0.0;
    slider106.maximumValue = 100.0;
    slider106.viewText = @"饱和度";
    slider106.sliderClick = ^(UISlider *slider){
        imageSaturation = slider.value;
        // imageview106.image = [image100 imageAdjustWithSaturation:imageSaturation brightness:imageBrightness contrast:imageContrast];
        [image100 imageAdjustWithSaturation:imageSaturation brightness:imageBrightness contrast:imageContrast image:^(UIImage *image) {
            imageview106.image = image;
        }];
    };
    
    UISlider *slider1062 = [[UISlider alloc] initWithFrame:CGRectMake(slider106.left, (slider106.bottom + originXY), slider106.width, 20.0)];
    [scrollview addSubview:slider1062];
    slider1062.minimumValue = 0.0;
    slider1062.maximumValue = 100.0;
    slider1062.viewText = @"亮度";
    slider1062.sliderClick = ^(UISlider *slider){
        imageBrightness = slider.value;
        // imageview106.image = [image100 imageAdjustWithSaturation:imageSaturation brightness:imageBrightness contrast:imageContrast];
        [image100 imageAdjustWithSaturation:imageSaturation brightness:imageBrightness contrast:imageContrast image:^(UIImage *image) {
            imageview106.image = image;
        }];
    };
    
    UISlider *slider1063 = [[UISlider alloc] initWithFrame:CGRectMake(slider1062.left, (slider1062.bottom + originXY), slider1062.width, 20.0)];
    [scrollview addSubview:slider1063];
    slider1063.minimumValue = 0.0;
    slider1063.maximumValue = 100.0;
    slider1063.viewText = @"对比度";
    slider1063.sliderClick = ^(UISlider *slider){
        imageContrast = slider.value;
        // imageview106.image = [image100 imageAdjustWithSaturation:imageSaturation brightness:imageBrightness contrast:imageContrast];
        [image100 imageAdjustWithSaturation:imageSaturation brightness:imageBrightness contrast:imageContrast image:^(UIImage *image) {
            imageview106.image = image;
        }];
    };
    
    // 相册图片
    __block UIScrollView *photoScrollview = [[UIScrollView alloc] initWithFrame:CGRectMake(0.0, (currentView.bottom + originXY), scrollview.width, (sizeImage + originXY * 2))];
    [scrollview addSubview:photoScrollview];
    photoScrollview.backgroundColor = [UIColor colorRandom];
    __block UIView *photoView = [[UIView alloc] initWithFrame:CGRectMake(0.0, 0.0, photoScrollview.width, photoScrollview.height)];
    [photoScrollview addSubview:photoView];
    [UIImage imagesFromAssetsLibraryWithNum:10 latest:YES start:^{
        photoView.viewText = @"正在加载图片";
    } success:^(NSArray *images) {
        photoView.viewText = @"";
        for (int i = 0; i < images.count; i++)
        {
            UIImageView *subImageview = [[UIImageView alloc] initWithFrame:CGRectMake(originXY + (i * (sizeImage + originXY)), originXY, sizeImage, sizeImage)];
            [photoScrollview addSubview:subImageview];
            [subImageview layerWithRadius:5.0 borderColor:[UIColor colorRandom] borderWidth:1.0];
            subImageview.image = [images objectAtIndex:i];
            
            photoScrollview.contentSize = CGSizeMake((subImageview.right + originXY), filterScrollView.height);
        }
    } error:^{
        photoView.viewText = @"加载图片失败";
    }];
    
    currentView = photoScrollview;
    
    scrollview.contentSize = CGSizeMake(scrollview.width, (currentView.bottom + originXY));
}

@end
