//
//  WFFirstViewController.h
//  URLConnectionSample
//
//  Created by Duger on 13-10-15.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WFFirstViewController : UIViewController<NSURLConnectionDataDelegate>
@property (retain, nonatomic) IBOutlet UITextView *textView;
- (IBAction)didClickButton:(UIButton *)sender;
@property (retain, nonatomic) IBOutlet UISwitch *customSwitch;
- (IBAction)didChangeThread:(UISwitch *)sender;
@property (retain, nonatomic) IBOutlet UIProgressView *progressView;

@end
