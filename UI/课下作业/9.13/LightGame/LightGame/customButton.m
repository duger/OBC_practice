//
//  customButton.m
//  LightGame
//
//  Created by Duger on 13-9-13.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#import "customButton.h"

@implementation customButton
@synthesize upButton,downButton;
@synthesize x,y;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        upButton = [UIButton buttonWithType:UIButtonTypeCustom];
        downButton = [UIButton buttonWithType:UIButtonTypeCustom];
        upButton.frame = CGRectMake(0, 0, frame.size.width - 2, frame.size.height - 2);
        downButton.frame = CGRectMake(0, 0, frame.size.width - 2, frame.size.height - 2);
        
        upButton.center = CGPointMake(CGRectGetMidX(self.bounds), CGRectGetMidY(self.bounds));
        downButton.center = CGPointMake(CGRectGetMidX(self.bounds), CGRectGetMidY(self.bounds));
        
        self.backgroundColor = [UIColor blackColor];
        upButton.backgroundColor = [UIColor darkGrayColor];
        downButton.backgroundColor = [UIColor yellowColor];
        
        
        [self addSubview:downButton];
        [self addSubview:upButton];
        
        [upButton addTarget:self action:@selector(didClickUpButton) forControlEvents:UIControlEventTouchUpInside];
        [downButton addTarget:self action:@selector(didClickDownButton) forControlEvents:UIControlEventTouchUpInside];
        
        
    }
    return self;
}

-(void)didClickUpButton
{
    [self AllTurned];
}

-(void)didClickDownButton
{
    [self AllTurned];
}


-(void)turned
{
    upButton.hidden = !upButton.hidden;
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

-(customButton *)up
{
    NSInteger tag = x + (y - 1)* 1000;
    customButton *Button = nil;
    if ([self isUseAbility:tag]) {
        Button = (customButton *)[self.superview viewWithTag:tag];
//        NSLog(@"shangshang%d",tag);
    }
    return Button;
}
-(customButton *)down
{
    NSInteger tag = x + (y + 1) * 1000;
    customButton *Button = nil;
    if ([self isUseAbility:tag]) {
        Button = (customButton *)[self.superview viewWithTag:tag];
    }
    return Button;
}
-(customButton *)left
{
    NSInteger tag = x - 1 + y * 1000;
    customButton *Button = nil;
    if ([self isUseAbility:tag]) {
        Button = (customButton *)[self.superview viewWithTag:tag];
        
    }
    return Button;
}
-(customButton *)right
{
    NSInteger tag = x + 1 + y * 1000;
    customButton *Button = nil;
    if ([self isUseAbility:tag]) {
        Button = (customButton *)[self.superview viewWithTag:tag];
        
    }
    return Button;
}

- (void)dealloc
{
    self.upButton = nil;
    self.downButton = nil;
    
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
