//
//  WFViewController.m
//  GifSample
//
//  Created by Duger on 13-9-16.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#import "WFViewController.h"

@interface WFViewController ()

@end

@implementation WFViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    //2250_3650903_179fb89ae279fae－10（被拖移）.tiff
    NSMutableArray *imagesArray = [[NSMutableArray alloc]init];
    for (int i = 1; i <= 40 ; i++) {
        NSString *fileName = [[NSString alloc]initWithFormat:@"2250_3650903_179fb89ae279fae－%d（被拖移）.tiff",i ];
        [imagesArray addObject:[UIImage imageNamed:fileName]];
    }
    
    
    //实例化图像视图
    UIImageView *imageView = [[UIImageView alloc]init];
    imageView.frame = CGRectMake(0, 0,100 , 100);
    imageView.center = CGPointMake(160, 160);
    imageView.tag = 88;
    //设置动画图片数组
    imageView.animationImages = imagesArray;
    //40张图片的循环时间
    imageView.animationDuration = 3;
    
    [self.view addSubview:imageView];
    
   
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.frame = CGRectMake(0,300, 320, 40);
    [button setTitle:@"Start" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(_didClickButton:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
//    [imageView startAnimating];
    
    [imageView release];
    [imagesArray release];
    
    UISlider *slider = [[UISlider alloc]initWithFrame:CGRectMake(0, 340, 320, 30)];
    slider.minimumValue = 1.0f;
    slider.maximumValue = 10.0f;
    slider.minimumTrackTintColor = [UIColor blueColor];
    slider.maximumTrackTintColor = [UIColor redColor];
    slider.thumbTintColor = [UIColor orangeColor];
    [slider addTarget:self action:@selector(_didClickSlider:) forControlEvents:UIControlEventValueChanged];
    
    
    [self.view addSubview:slider];
    
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)_didClickSlider:(UISlider *)sender
{
    UIImageView *imageView =(UIImageView *)[self.view viewWithTag:88];
    imageView.animationDuration = sender.value;
    
    [imageView startAnimating];
}

-(void)_didClickButton:(UIButton *)sender
{
    UIImageView *imageView =(UIImageView *)[self.view viewWithTag:88];
    
    if ([sender.titleLabel.text isEqualToString:@"Start"]) {
        [sender setTitle:@"Stop" forState:UIControlStateNormal];
        [imageView startAnimating];
        return;
    }
    [sender setTitle:@"Start" forState:UIControlStateNormal];
    [imageView stopAnimating];
    NSInteger randomInteger = arc4random()%40 + 1;
    NSString *fileName = [NSString stringWithFormat:@"2250_3650903_179fb89ae279fae－%d（被拖移）.tiff",randomInteger];
    UIImage *image = [UIImage imageNamed:fileName];
    NSLog(@"图像的大小： %@",NSStringFromCGSize(image.size));
    imageView.image = image;
}


@end
