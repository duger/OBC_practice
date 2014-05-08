//
//  XMLViewController.h
//  XMLandJsonPractise
//
//  Created by Duger on 13-10-16.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XMLViewController : UITableViewController<NSURLConnectionDataDelegate>
@property(nonatomic,retain) NSMutableArray *citys;
- (IBAction)didClickButton:(UIBarButtonItem *)sender;

@end
