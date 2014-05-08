//
//  ListViewManager.m
//  ToDoListManger
//
//  Created by Duger on 13-10-6.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#import "ListViewManager.h"

@implementation ListViewManager

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        UITableView *listView = [[UITableView alloc]initWithFrame:self.bounds style:UITableViewStyleGrouped];
        listView.separatorColor = [UIColor purpleColor];
        listView.separatorStyle = UITableViewCellSeparatorStyleSingleLineEtched;
        listView.rowHeight = 50.0f;
        
        [self addSubview:listView];
        [listView release];
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
