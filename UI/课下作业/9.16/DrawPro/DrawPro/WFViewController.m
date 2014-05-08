//
//  WFViewController.m
//  DrawPro
//
//  Created by Duger on 13-9-16.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#import "WFViewController.h"
#import "PaintView.h"
#import <QuartzCore/QuartzCore.h>

@interface WFViewController ()

@end

@implementation WFViewController
{
    CGFloat lineSize;
    NSMutableArray *savedImages;
    NSInteger imageCount;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    imageCount = 0;
    savedImages = [[NSMutableArray alloc]init];
    [savedImages addObject:@"$"];
    //图像存数数组

    
    //绘图区实现
    PaintView *paintview = [[PaintView alloc]initWithFrame:self.drawView.bounds];
    paintview.backgroundColor = [UIColor purpleColor];
    paintview.tag = 88;
//    paintview.myImage = [[UIImage alloc]init];
//    self.image1 = [[UIImageView alloc]init];
    paintview.imageArray = [[NSMutableArray alloc]init];
    
    [self.drawView addSubview:paintview];
    [paintview release];
    
    
    
   
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    [savedImages release];
}

- (IBAction)Redo:(UIButton *)sender {
    PaintView *paintview = (PaintView *)[self.view viewWithTag:88];

//    NSInteger count = paintview.imageList.count;
//    NSLog(@"nnnn%d",count);
    [paintview reDo];
//    paintview.myImage = [paintview.imageList objectAtIndex:(count - 1)];
//    [paintview.imageList removeLastObject];
    
}

- (IBAction)saveImage:(UIButton *)sender {
    
    PaintView *paintview = (PaintView *)[self.view viewWithTag:88];
    
    if ([[savedImages objectAtIndex:0] isEqual:paintview.myImage]) {
        return;
    }

    [savedImages insertObject:paintview.myImage atIndex:0];
    if ([[savedImages objectAtIndex:0] isEqual:@"$"]) {
        return;
    }
    NSInteger count = savedImages.count;
    NSLog(@"savedImage%d",count);
    if (count > 6) {
        for (NSInteger j = 0; j < 6; j++) {
            UIImageView *imageView = (UIImageView *)[self.view viewWithTag:j + 1];
            imageView.image = [savedImages objectAtIndex:j];
        }
        return;
    }
    for (NSInteger i = 0; i <= (count - 2) % 6 ; i++) {
        UIImageView *imageView = (UIImageView *)[self.view viewWithTag:(i + 1)];
        imageView.image = [savedImages objectAtIndex:i];
    }
    
    
    
//    NSLog(@"tag%d",imageView.tag);
    
}

- (IBAction)lineSize:(UISlider *)sender {
    sender.maximumValue = 20.0f;
    sender.minimumValue = 1.0f;
    
    
    lineSize = sender.value;
    PaintView *paintview = (PaintView *)[self.view viewWithTag:88];
    paintview.lineSize = lineSize;
}

- (IBAction)changeColor:(UISlider *)sender {
    ;
}


- (void)dealloc {
    
    
    self.drawView = nil;
    self.image1 = nil;
    self.image2 = nil;
    self.image3 = nil;
    self.image4 = nil;
    self.image5 = nil;
    self.image6 = nil;
    
    [super dealloc];
}

@end
