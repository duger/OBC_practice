//
//  CustomView.m
//  MenuControllerSample
//
//  Created by Duger on 13-9-26.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#import "CustomView.h"

@interface CustomView ()
-(void)_didRecognizedLongPressGesture:(UILongPressGestureRecognizer *)sender;
@end


@implementation CustomView

-(id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        UILongPressGestureRecognizer *longGes = [[UILongPressGestureRecognizer alloc]initWithTarget:self action:@selector(_didRecognizedLongPressGesture:)];
        [self addGestureRecognizer:longGes];
        [longGes release];

    }
    return self;
}


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        UILongPressGestureRecognizer *longGes = [[UILongPressGestureRecognizer alloc]initWithTarget:self action:@selector(_didRecognizedLongPressGesture:)];
        [self addGestureRecognizer:longGes];
        [longGes release];
    }
    return self;
}

-(BOOL)canBecomeFirstResponder
{
    return YES;
}

-(void)_didRecognizedLongPressGesture:(UILongPressGestureRecognizer *)sender
{
    if (sender.state == UIGestureRecognizerStateBegan) {
        [self becomeFirstResponder];
        //获取手势触发的坐标
        CGPoint location = [sender locationInView:self];
        //获取菜单选项的视图控制器
        UIMenuController *menuController = [UIMenuController sharedMenuController];
        
        UIMenuItem *customItem = [[UIMenuItem alloc]initWithTitle:@"wangwang" action:@selector(didClickWangwang:)];
        menuController.menuItems = @[customItem];
        [customItem release];
        
        
        //获取菜单选项的Frame
        CGRect frame = menuController.menuFrame;
        frame.origin = location;
        //设置菜单选项控制器可见
        [menuController setMenuVisible:YES animated:YES];
        //菜单选项弹出的位置
        [menuController setTargetRect:frame inView:self];
        
        
    }
}

-(BOOL)canPerformAction:(SEL)action withSender:(id)sender
{
    if (action == @selector(copy:) ||
        action == @selector(didClickWangwang:)) {
        return YES;
    }
    return NO;
}

-(void)copy:(id)sender
{
   
}

-(void)didClickWangwang:(id)sender
{
    NSLog(@"%s",__FUNCTION__);
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
