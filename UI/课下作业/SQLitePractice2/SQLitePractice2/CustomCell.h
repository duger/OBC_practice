//
//  CustomCell.h
//  SQLitePractice2
//
//  Created by Duger on 13-10-10.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol CustomCellDelegate <NSObject>
-(void)goToUpdate:(NSString *)pIDText;
@end

@interface CustomCell : UITableViewCell
@property(nonatomic,assign)id<CustomCellDelegate> delegate;
@end
