//
//  customView.m
//  NewLightGame
//
//  Created by Duger on 13-9-14.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#import "customView.h"

@implementation customView
@synthesize upView,downView;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        upView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, frame.size.width - 2, frame.size.height - 2)];
        downView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, frame.size.width -2, frame.size.height - 2)];
        upView.center = CGPointMake(CGRectGetMidX(self.bounds), CGRectGetMidY(self.bounds));
        downView.center = CGPointMake(CGRectGetMidX(self.bounds), CGRectGetMidY(self.bounds));
        
        self.backgroundColor = [UIColor blackColor];
        upView.backgroundColor = [UIColor yellowColor];
        downView.backgroundColor = [UIColor grayColor];
        upView.tag = 7;
        downView.tag = 8;
        
        [self addSubview:downView];
        [self addSubview:upView];
        
        UITapGestureRecognizer *singRecognizer;
        singRecognizer = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(closeLight:)];
        singRecognizer.numberOfTapsRequired = 1;
        
        [self addGestureRecognizer:singRecognizer];
        
    }
    return self;
}

-(void)closeLight:(UITapGestureRecognizer*)recognizer
{

//    UIView *myView = [self viewWithTag:7];
//    myView.backgroundColor = [UIColor colorWithWhite:1 alpha:0];
    [self AllTurned];
    [self.delegate showTheCount];
    
}

-(void)turned
{
    
    UIView *myView = [self viewWithTag:7];
    if (CGColorEqualToColor(myView.backgroundColor.CGColor ,[UIColor colorWithWhite:1 alpha:0].CGColor)) {
        myView.backgroundColor = [UIColor yellowColor];
        
    }else if (CGColorEqualToColor(myView.backgroundColor.CGColor, [UIColor yellowColor].CGColor)) {
        myView.backgroundColor = [UIColor colorWithWhite:1 alpha:0];
    }
}

-(void)AllTurned
{
    [self turned];
    [[self up]turned];
    [[self down]turned];
    [[self left] turned];
    [[self right] turned];
}

-(BOOL)isUseAbility:(NSInteger) tag
{
    
    return  ((tag >= 1 && tag <= 5)||
             (tag >= 1001 && tag <= 1005)||
             (tag >= 2001 && tag <= 2005)||
             (tag >= 3001 && tag <= 3005)||
             (tag >= 4001 && tag <= 4005));
    
}

-(customView *)up
{
    NSInteger tag = self.x + (self.y - 1)* 1000;
    customView *view1 = nil;
    customView *view2 = nil;
    if ([self isUseAbility:tag]) {
        view1 = (customView *)[self.superview viewWithTag:tag];
        view2 = (customView *)[view1 viewWithTag:7];
        }
    return view1;
}
-(customView *)down
{
    NSInteger tag = self.x + (self.y + 1) * 1000;
    customView *view1 = nil;
    customView *view2 = nil;
    if ([self isUseAbility:tag]) {
        view1 = (customView *)[self.superview viewWithTag:tag];
        view2 = (customView *)[view1 viewWithTag:7];
    }
    return view1;
}
-(customView *)left
{
    NSInteger tag = self.x - 1 + self.y * 1000;
    customView *view1 = nil;
    customView *view2 = nil;
    if ([self isUseAbility:tag]) {
        view1 = (customView *)[self.superview viewWithTag:tag];
        view2 = (customView *)[view1 viewWithTag:7];
    }
    return view1;
}
-(customView *)right
{
    NSInteger tag = self.x + 1 + self.y * 1000;
    customView *view1 = nil;
    customView *view2 = nil;
    if ([self isUseAbility:tag]) {
        view1 = (customView *)[self.superview viewWithTag:tag];
        view2 = (customView *)[view1 viewWithTag:7];
    }
    return view1;
}

-(void)viewReset
{
    upView.backgroundColor = [UIColor yellowColor];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/
-(BOOL)isClear
{
    return CGColorEqualToColor(upView.backgroundColor.CGColor ,[UIColor colorWithWhite:1 alpha:0].CGColor);
}

- (void)dealloc
{
    self.upView = nil;
    self.downView = nil;
    
    [super dealloc];
}

@end
