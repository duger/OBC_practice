//
//  CustomCell.h
//  SqliteSample
//
//  Created by Duger on 13-10-9.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol CustomCellDelegate <NSObject>
-(void)gotoUpdate:(NSString *)text;
@end


@interface CustomCell : UITableViewCell
@property(nonatomic,assign) id<CustomCellDelegate> delegate;
@end
