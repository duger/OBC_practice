//
//  CustomCell.m
//  SQLitePractice2
//
//  Created by Duger on 13-10-10.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#import "CustomCell.h"

@implementation CustomCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}
-(id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        UILongPressGestureRecognizer *longGesture = [[UILongPressGestureRecognizer alloc]initWithTarget:self action:@selector(_didClickLongCesture:)];
        [self addGestureRecognizer:longGesture];
    }
    return self;
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(BOOL)canBecomeFirstResponder
{
    return YES;
}

-(void)_didClickLongCesture:(UILongPressGestureRecognizer *)sender
{
    if (sender.state == UIGestureRecognizerStateBegan) {
        [self becomeFirstResponder];
        CGPoint location = [sender locationInView:self];
        UIMenuController *menuC = [UIMenuController sharedMenuController];
        UIMenuItem *customItem = [[UIMenuItem alloc]initWithTitle:@"编辑" action:@selector(didClickEdit:)];
        menuC.menuItems = @[customItem];
        
        CGRect frame = menuC.menuFrame;
        frame.origin = location;
        
        [menuC setTargetRect:frame inView:self];
        [menuC setMenuVisible:YES animated:YES];
        
        
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
    [self.delegate goToUpdate:self.textLabel.text];
}



@end
