//
//  StudentListViewController.h
//  CoreDataSample
//
//  Created by Duger on 13-10-9.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface StudentListViewController : UITableViewController

@property(nonatomic,retain) NSMutableArray *studentsList;

@property(nonatomic,retain) Teacher *teacher;

- (IBAction)didClickSort:(UIBarButtonItem *)sender;

@end
