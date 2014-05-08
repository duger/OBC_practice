//
//  AddNewBuddyViewController.h
//  InstantMessager
//
//  Created by Duger on 13-12-20.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddNewBuddyViewController : UIViewController
@property (strong, nonatomic) IBOutlet UITextField *userName;
- (IBAction)didClickAddButton:(UIButton *)sender;

@end
