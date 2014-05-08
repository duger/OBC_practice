//
//  ViewController.m
//  FirstApp
//
//  Created by Duger on 13-7-2.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    _lblInfo.text = @"Nothing";
    _lblInfo.textColor = [UIColor redColor];
//    _imageView.image = [UIImage imageNamed:@"2.png"];
   
    UIImage *img1 = [UIImage imageNamed:@"1.png"];
    UIImage *img2 = [UIImage imageNamed:@"2.png"];
    UIImage *img3 = [UIImage imageNamed:@"3.png"];
    _imageView.animationImages = [NSArray arrayWithObjects:img1,img2,img3,nil];
//    _imageView.animationDuration = 2;
//    [_imageView startAnimating];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    
    [_lblInfo release];
    [_imageView release];
    [super dealloc];
}
- (IBAction)pressButton:(UIButton *)sender {
    NSString *title = [sender titleForState:UIControlStateNormal];
//    if ([title isEqualToString:@"左"]) {
//        _lblInfo.text =@"你按了左按钮";
//        
//    }else {
//        _lblInfo.text =@"你按了右按钮";
//    }
//    

    NSString *s= [[[NSString alloc] initWithFormat:@"你按下了%@",title]autorelease];
    _lblInfo.text=s;
   // [s release];


}


//速度控制
- (IBAction)pressSpeed:(UISegmentedControl *)sender {
    
    switch (sender.selectedSegmentIndex) {
        case 0:
            _imageView.animationDuration=1;
            break;
        case 2:
            _imageView.animationDuration=3;
        default:
            _imageView.animationDuration = 2;
            break;
    }
    //    [_imageView startAnimating];
    
}
//开关控制
- (IBAction)playOrStop:(UISwitch *)sender {
    if (sender.on) {
        [_imageView startAnimating];
        
    }else{
        [_imageView stopAnimating];
    }
    
}


@end
