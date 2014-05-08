//
//  WFViewController.h
//  CoreDataSample
//
//  Created by Duger on 13-10-9.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WFViewController : UIViewController<UITextFieldDelegate>
- (IBAction)didClickInsert:(UIButton *)sender;
- (IBAction)didClickSelect:(UIButton *)sender;
- (IBAction)didClickRemove:(UIButton *)sender;
- (IBAction)didClickUpdate:(UIButton *)sender;

@end
