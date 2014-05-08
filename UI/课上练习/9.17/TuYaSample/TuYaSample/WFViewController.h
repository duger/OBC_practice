//
//  WFViewController.h
//  TuYaSample
//
//  Created by Duger on 13-9-17.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CustomView.h"

@interface WFViewController : UIViewController
@property (retain, nonatomic) IBOutletCollection(UIImageView) NSArray *imageViewArray;
- (IBAction)didClickSaveButton:(UIButton *)sender;
@property (retain, nonatomic) IBOutlet CustomView *customView;
- (IBAction)reDoButton:(UIButton *)sender;
- (IBAction)didChangeValued:(id)sender;

//存放图片的数组
@property(retain,nonatomic) NSMutableArray *imageArray;


@end
