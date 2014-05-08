//
//  EditManager.h
//  ToDoListManger
//
//  Created by Duger on 13-10-3.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol EditManagerDelegate <NSObject>

-(void)didClickContentType;

@end

@interface EditManager : UIView<UIActionSheetDelegate>



@property(nonatomic,retain) UITextField *title;
@property(nonatomic,assign) id<EditManagerDelegate> delegate;

@end
