//
//  UpdateViewController.h
//  SqliteSample
//
//  Created by Duger on 13-10-10.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UpdateViewController : UIViewController<UITextFieldDelegate>

@property(nonatomic,retain) NSString *pId;
- (IBAction)didClickUpdate:(UIButton *)sender;

@end
