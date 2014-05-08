//
//  ViewController.h
//  FirstApp
//
//  Created by Duger on 13-7-2.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController :
UIViewController{
    
    IBOutlet UILabel *_lblInfo;
    IBOutlet UIImageView *_imageView;
    
}

- (IBAction)pressButton:(UIButton *)sender;

- (IBAction)playOrStop:(UISwitch *)sender;

- (IBAction)pressSpeed:(UISegmentedControl *)sender;


@end
