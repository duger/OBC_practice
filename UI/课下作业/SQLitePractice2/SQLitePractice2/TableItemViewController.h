//
//  TableItemViewController.h
//  SQLitePractice2
//
//  Created by Duger on 13-10-10.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CustomCell.h"
@interface TableItemViewController : UITableViewController<CustomCellDelegate>

@property(nonatomic,retain) NSString *tableName;
- (IBAction)didClickAdd:(UIBarButtonItem *)sender;

@end
