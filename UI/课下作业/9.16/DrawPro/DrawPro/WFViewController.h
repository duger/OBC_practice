//
//  WFViewController.h
//  DrawPro
//
//  Created by Duger on 13-9-16.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WFViewController : UIViewController
- (IBAction)Redo:(UIButton *)sender;
- (IBAction)saveImage:(UIButton *)sender;
- (IBAction)lineSize:(UISlider *)sender;
@property (retain, nonatomic) IBOutlet UIView *drawView;
- (IBAction)changeColor:(UISlider *)sender;
@property (retain, nonatomic) IBOutlet UIImageView *image1;
@property (retain, nonatomic) IBOutlet UIImageView *image2;
@property (retain, nonatomic) IBOutlet UIImageView *image3;
@property (retain, nonatomic) IBOutlet UIImageView *image4;
@property (retain, nonatomic) IBOutlet UIImageView *image5;
@property (retain, nonatomic) IBOutlet UIImageView *image6;

//@property(nonatomic,retain) UIImage *myImage;

@end
