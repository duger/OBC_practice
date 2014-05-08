//
//  UpdateViewController.h
//  SQLitePractice
//
//  Created by Duger on 13-10-10.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UpdateViewController : UIViewController<UITextFieldDelegate>
@property(retain,nonatomic) Person *person;

@property (retain, nonatomic) IBOutlet UITextField *pId;
@property (retain, nonatomic) IBOutlet UITextField *pName;
@property (retain, nonatomic) IBOutlet UITextField *pAge;
- (IBAction)didClickUpdate:(UIButton *)sender;

@end
