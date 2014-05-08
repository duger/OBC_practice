//
//  WFViewController.h
//  DrawWark
//
//  Created by Duger on 13-9-18.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WFsView.h"

@interface WFViewController : UIViewController
@property (assign, nonatomic) IBOutlet WFsView *drawView;
@property (retain, nonatomic) IBOutletCollection(UIImageView) NSArray *imageViewArray;

@property(retain,nonatomic) NSMutableArray *imageList;
- (IBAction)didClickReture:(UIButton *)sender;
- (IBAction)didClickSaveButton:(UIButton *)sender;

- (IBAction)didChageValue:(UISlider *)sender;

@end
