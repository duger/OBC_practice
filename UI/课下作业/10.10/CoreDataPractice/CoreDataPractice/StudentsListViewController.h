//
//  StudentsListViewController.h
//  CoreDataPractice
//
//  Created by Duger on 13-10-11.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface StudentsListViewController : UITableViewController
@property(nonatomic,retain) Teacher *teacher;
@property(nonatomic,retain) NSMutableArray *studentList;
@property(nonatomic,retain) NSString *sortOnOrOff;
- (IBAction)didClickSelect:(UIBarButtonItem *)sender;

@end
