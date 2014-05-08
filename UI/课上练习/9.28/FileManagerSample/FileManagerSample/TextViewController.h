//
//  TextViewController.h
//  FileManagerSample
//
//  Created by Duger on 13-9-27.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TextViewController : UIViewController<UITextFieldDelegate,UITextViewDelegate>


- (IBAction)didClickDone:(UIBarButtonItem *)sender;
@property (retain, nonatomic) IBOutlet UITextField *txtField;
@property (retain, nonatomic) IBOutlet UITextView *txtView;
- (IBAction)didClickSave:(UIBarButtonItem *)sender;
@property (retain, nonatomic) IBOutlet UIBarButtonItem *doneItem;
@property (retain, nonatomic) IBOutlet UIBarButtonItem *saveItem;

@end
