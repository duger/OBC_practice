//
//  WFViewController.h
//  DrawGameBAKEE
//
//  Created by Duger on 13-9-17.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WFmyView.h"

@interface WFViewController : UIViewController
@property (strong, nonatomic) IBOutletCollection(UIView) NSArray *imageViewArray;
@property(retain,nonatomic) NSMutableArray *imageList;
@property (retain, nonatomic) IBOutlet WFmyView *drawView;

- (IBAction)changeLineWith:(UISlider *)sender;
- (IBAction)reDo:(UIButton *)sender;
- (IBAction)saveImages:(UIButton *)sender;

@end
