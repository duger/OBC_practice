//
//  CustomCell.m
//  SqliteSample
//
//  Created by Duger on 13-10-9.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#import "CustomCell.h"

@interface CustomCell ()
-(void)_didRecognizedLongPressGesture:(UILongPressGestureRecognizer *)sender;
@end

@implementation CustomCell

-(id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        UILongPressGestureRecognizer *longGes = [[UILongPressGestureRecognizer alloc]initWithTarget:self action:@selector(_didRecognizedLongPressGesture:)];
        [self addGestureRecognizer:longGes];

    }
    return self;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
                
        
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
        
        UIMenuItem *customItem = [[UIMenuItem alloc]initWithTitle:@"编辑" action:@selector(didClickEdit:)];
        menuController.menuItems = @[customItem];

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
    if (action == @selector(didClickEdit:)) {
        return YES;
    }
    return NO;
}

-(void)didClickEdit:(id)sender
{
    
    [self.delegate gotoUpdate:self.textLabel.text];
    NSLog(@"点到了");
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

@end
