//
//  CustomCell.m
//  TableViewSample
//
//  Created by Duger on 13-9-24.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#import "CustomCell.h"

@implementation CustomCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        CGRect rect = self.contentView.bounds;
        rect.size.width -= 40;
        NSLog(@"%@",NSStringFromCGRect(rect));
        
        self.customImageView = [[[UIImageView alloc]initWithFrame:CGRectMake(CGRectGetWidth(rect) - CGRectGetHeight(rect), 0, CGRectGetHeight(rect), CGRectGetHeight(rect))] autorelease];
        self.customLabel = [[[UILabel alloc]initWithFrame:CGRectMake(0, 0, CGRectGetWidth(rect) - CGRectGetHeight(rect), CGRectGetHeight(rect))] autorelease];
        self.customLabel.backgroundColor = [UIColor clearColor];
        [self.contentView addSubview:self.customLabel];
        [self.contentView addSubview:self.customImageView];
        
        
        
    }
    return self;
}



- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}



@end
