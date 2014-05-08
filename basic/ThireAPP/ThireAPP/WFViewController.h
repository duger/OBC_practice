//
//  WFViewController.h
//  ThireAPP
//
//  Created by Duger on 13-7-3.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WFViewController : UIViewController{
    
    
    IBOutlet UILabel *_lblResult;
    IBOutlet UITextField *_textField;
}
- (IBAction)pressFind:(UIButton *)sender;

@end
