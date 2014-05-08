//
//  WFScrollView.m
//  myClockPro
//
//  Created by Duger on 13-9-22.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#import "WFScrollView.h"

@implementation WFScrollView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.baseScrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, 300, 250)];
        [self.baseScrollView setCenter:CGPointMake(CGRectGetMidX(self.superview.bounds), 130)];
        self.baseScrollView.contentSize = CGSizeMake(300, 600);
        
        self.resigedViews = [[NSMutableArray alloc]init];
        
                               
    }
    return self;
}


-(void)resigeNewView
{
    UIView *baseView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 300, 50)];
    baseView.backgroundColor = [UIColor scrollViewTexturedBackgroundColor];
    
    UITextField *textField = [[UITextField alloc]initWithFrame:CGRectMake(4, 2, 200, 40)];
    textField.borderStyle = UIButtonTypeRoundedRect;
    textField.userInteractionEnabled = NO;
    
    UIButton *deleteButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    deleteButton.frame = CGRectMake(220, 2, 60, 40);
    [deleteButton setTitle:@"删除" forState:UIControlStateNormal];
    [deleteButton addTarget:self action:@selector(didClickDeleteButton:) forControlEvents:UIControlEventTouchUpInside];
    [baseView addSubview:textField];
    [baseView addSubview:deleteButton];
    
    
    [self.resigedViews addObject:baseView];
    [textField release];
    [baseView release];
    
}

-(void)setPlace
{
    for (int i = 0; i < [self.resigedViews count]; i++) {
        UIView *view = [self.resigedViews objectAtIndex:i];
        [view setFrame:CGRectMake(0, i * 50 , 300, 45)];
        [self.baseScrollView addSubview:view];
        
    }
}


- (void)dealloc
{
    self.baseScrollView = nil;
    [super dealloc];
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
