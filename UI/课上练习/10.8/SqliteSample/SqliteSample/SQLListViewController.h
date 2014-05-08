//
//  SQLListViewController.h
//  SqliteSample
//
//  Created by Duger on 13-10-8.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CustomCell.h"

@interface SQLListViewController : UITableViewController<CustomCellDelegate>
- (IBAction)didClickAdd:(UIBarButtonItem *)sender;

@end
