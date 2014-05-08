//
//  WFViewController.m
//  ImageViewSample
//
//  Created by Duger on 13-9-16.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#import "WFViewController.h"

@interface WFViewController ()
-(void)_tapMethods:(UIGestureRecognizer *)sender;
-(void)_longPressMethods:(UIGestureRecognizer *)sender;
-(void)_swipeMethods:(UIGestureRecognizer*)sender;
-(void)_panMethods:(UIGestureRecognizer *)sender;
-(void)_pinchMethods:(UIGestureRecognizer *)sender;
-(void)_rotationMethods:(UIGestureRecognizer *)sender;
@end

@implementation WFViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    //1.实例化图像视图
    UIImageView *imageView = [[UIImageView alloc]init];
    imageView.frame = CGRectZero;
    
    //改变图像视图的用户响应属性
    imageView.userInteractionEnabled = YES;
 /*
  //
  //图像文件的路径
    NSString *filePath = [[NSBundle mainBundle] resourcePath];
    filePath = [filePath stringByAppendingString:@"/Resource/h1.jpeg"];
    NSLog(@"%@",filePath);
    UIImage *image = [[UIImage alloc]initWithContentsOfFile:filePath];
  */
  
    //2.实例化图像
    UIImage *image = [UIImage imageNamed:@"h1.jpeg"];
    NSLog(@"图像的大小： %@",NSStringFromCGSize(image.size));

    
    
    //3.设置图像视图的大小
    imageView.frame = CGRectMake(0, 0, 320, (320 / image.size.width) *image.size.height);
    
    //4.设置要显示的图片
    imageView.image = image;
    
    //5.将图像试图添加到视图树上
    [self.view addSubview:imageView];
    [imageView release];
/*
    UITapGestureRecognizer;                 点击
    UISwipeGestureRecognizer;               轻扫
    UILongPressGestureRecognizer;           长按
    UIPanGestureRecognizer;                 拖拽
    UIPinchGestureRecognizer;               捏合
    UIRotationGestureRecognizer;            翻转
    他们的父类是 UIGestureRecognizer！！
  */  
    
    //实例化点击手势
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc]init];
    //点击需要的手指个数
    [tapGesture setNumberOfTapsRequired:1];
    [tapGesture setNumberOfTouchesRequired:1];
    
    //添加手势成功识别后的动作 及发送对象和目标（）
    [tapGesture addTarget:self action:@selector(_tapMethods:)];
    
    [imageView addGestureRecognizer:tapGesture];
    
    
    //实例化长按手势
    UILongPressGestureRecognizer *longPressGesture = [[UILongPressGestureRecognizer alloc]init];
    //设置点击需要的手指个数
    [longPressGesture setNumberOfTouchesRequired:1];
    [longPressGesture setNumberOfTapsRequired:1];
    //最小识别时常
    [longPressGesture setMinimumPressDuration:1];
    //允许移动误差
    [longPressGesture setAllowableMovement:4];
    //添加目标动作
    [longPressGesture addTarget:self action:@selector(_longPressMethods:)];
    
    [imageView addGestureRecognizer:longPressGesture];
    [longPressGesture release];
    
        
    
    UISwipeGestureRecognizer *swipeGesture = [[UISwipeGestureRecognizer alloc]init];
    //设置识别器方向
    swipeGesture.direction = UISwipeGestureRecognizerDirectionRight;
    
    [swipeGesture addTarget:self action:@selector(_swipeMethods:)];
    [imageView addGestureRecognizer:swipeGesture];
    [swipeGesture release];
    
    //捏合手势
    UIPinchGestureRecognizer *pinchGesture = [[UIPinchGestureRecognizer alloc]init];
    
    [pinchGesture addTarget:self action:@selector(_pinchMethods:)];
    [imageView addGestureRecognizer:pinchGesture];
    [pinchGesture release];
    
    
    UIPanGestureRecognizer *panGesture = [[UIPanGestureRecognizer alloc]init];
    [panGesture setMaximumNumberOfTouches:1];
    [panGesture addTarget:self action:@selector(_panMethods:)];
    [imageView addGestureRecognizer:panGesture];
    [panGesture release];
    
    UIRotationGestureRecognizer *rotationGesture = [[UIRotationGestureRecognizer alloc]init];
    [rotationGesture addTarget:self action:@selector(_rotationMethods:)];
    [imageView addGestureRecognizer:rotationGesture];
    [rotationGesture release];
    
    [tapGesture requireGestureRecognizerToFail:longPressGesture];
    [panGesture requireGestureRecognizerToFail:swipeGesture];
    

    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Gesture methods
-(void)_tapMethods:(UIGestureRecognizer *)sender
{
    UIActionSheet *actioSheet = [[UIActionSheet alloc]initWithTitle:@"温馨提示" delegate:nil cancelButtonTitle:@"Cancel" destructiveButtonTitle:@"点我!!" otherButtonTitles:@"OK", nil];
    [actioSheet showInView:self.view];
    [actioSheet release];
}
-(void)_longPressMethods:(UIGestureRecognizer *)sender{
    UIImageView *imageView = (UIImageView *)sender.view;
    //获取随机数
    NSInteger randomInteger = arc4random()%8 + 1;
    //实例化文件名字符串
    NSString *fileName = [NSString stringWithFormat:@"h%d.jpeg",randomInteger];
    UIImage *image = [UIImage imageNamed:fileName];
    NSLog(@"图像的大小： %@",NSStringFromCGSize(image.size));
    //3.设置图像视图的大小
//    imageView.frame = CGRectMake(0, 0, 320, (320 / image.size.width) *image.size.height);
    //4.设置要显示的图片
    imageView.image = image;
    //5.将图像试图添加到视图树上
   }
-(void)_swipeMethods:(UIGestureRecognizer*)sender{
    [self _longPressMethods:sender];
}
-(void)_panMethods:(UIGestureRecognizer *)sender{
    UIPanGestureRecognizer *panGesture = (UIPanGestureRecognizer *)sender;
    UIImageView *imageView = (UIImageView *)panGesture.view;
    CGPoint translationPoint = [panGesture translationInView:imageView];
    imageView.transform = CGAffineTransformMakeTranslation(translationPoint.x , translationPoint.y);
}
-(void)_pinchMethods:(UIGestureRecognizer *)sender{
    UIPinchGestureRecognizer *pinchGesture = (UIPinchGestureRecognizer *)sender;
    UIImageView *imageView = (UIImageView *)pinchGesture.view;
    imageView.transform = CGAffineTransformMakeScale(pinchGesture.scale, pinchGesture.scale);
}
-(void)_rotationMethods:(UIGestureRecognizer *)sender{
    UIRotationGestureRecognizer *rotationGesture = (UIRotationGestureRecognizer *)sender;
    UIImageView *imageView = (UIImageView *)rotationGesture.view;
    imageView.transform  = CGAffineTransformMakeRotation(rotationGesture.state);
    
}

@end
