//
//  UpdateViewController.h
//  SQLitePractice2
//
//  Created by Duger on 13-10-10.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UpdateViewController : UIViewController<UITextFieldDelegate>
@property(nonatomic,retain) Person *person;
@property (retain, nonatomic) IBOutlet UITextField *pID;
@property (retain, nonatomic) IBOutlet UITextField *pName;
@property (retain, nonatomic) IBOutlet UITextField *pAge;

- (IBAction)didClickUpdate:(UIBarButtonItem *)sender;

@end
