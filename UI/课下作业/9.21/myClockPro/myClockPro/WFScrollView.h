//
//  WFScrollView.h
//  myClockPro
//
//  Created by Duger on 13-9-22.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol customScrollViewDelegate <NSObject>

-(void)getTextDate;

@end

@interface WFScrollView : UIScrollView

@property(retain,nonatomic) UIScrollView *baseScrollView;
@property(retain,nonatomic) NSMutableArray *resigedViews;

@property(assign,nonatomic) id<customScrollViewDelegate> delegate;
//@property(retain,nonatomic) UIView *baseView;
//@property(retain,nonatomic) UIButton *deleteButton;
//@property(retain,nonatomic) UITextField *resigedTextfield;


@end
