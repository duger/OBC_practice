//
//  WFViewController.h
//  Calculator
//
//  Created by Duger on 13-9-15.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WFViewController : UIViewController
- (IBAction)num7:(UITapGestureRecognizer *)sender;
- (IBAction)num8:(UITapGestureRecognizer *)sender;
- (IBAction)num9:(UITapGestureRecognizer *)sender;
- (IBAction)num4:(UITapGestureRecognizer *)sender;
- (IBAction)num5:(UITapGestureRecognizer *)sender;
- (IBAction)num6:(UITapGestureRecognizer *)sender;
- (IBAction)num1:(UITapGestureRecognizer *)sender;
- (IBAction)num2:(UITapGestureRecognizer *)sender;
- (IBAction)num3:(UITapGestureRecognizer *)sender;
- (IBAction)num0:(UITapGestureRecognizer *)sender;
- (IBAction)numPoint:(UITapGestureRecognizer *)sender;
- (IBAction)numAC:(UITapGestureRecognizer *)sender;
- (IBAction)numPlus:(UITapGestureRecognizer *)sender;
- (IBAction)numMines:(UITapGestureRecognizer *)sender;
- (IBAction)numCheng:(UITapGestureRecognizer *)sender;
- (IBAction)numChu:(UITapGestureRecognizer *)sender;
- (IBAction)numEquire:(UITapGestureRecognizer *)sender;
@property (retain, nonatomic) IBOutlet UITextField *Result;

@end
