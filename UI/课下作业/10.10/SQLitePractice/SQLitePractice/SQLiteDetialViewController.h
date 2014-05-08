//
//  SQLiteDetialViewController.h
//  SQLitePractice
//
//  Created by Duger on 13-10-10.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SQLiteDetialViewController : UITableViewController

@property(nonatomic,retain) NSString *tableName;
- (IBAction)didClickAdd:(UIBarButtonItem *)sender;

@end
