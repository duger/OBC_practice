//
//  EditManager.m
//  ToDoListManger
//
//  Created by Duger on 13-10-3.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#import "EditManager.h"
#import "CharacterViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "EventManager.h"


@implementation EditManager

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        EventManager *event = [[EventManager alloc]init];
        
        self.title = [[UITextField alloc]initWithFrame:CGRectMake(1, 0, 40, 20)];
        [self.title setText:@"标题"];
        
        //字体颜色button
        UIButton *characterColor = [UIButton buttonWithType:UIButtonTypeCustom];
        characterColor.layer.borderWidth = 1.0f;
        characterColor.layer.borderColor = [UIColor blackColor].CGColor;
        [characterColor setFrame:CGRectMake(1, 0, 106, 30)];
        [characterColor setBackgroundColor:[UIColor whiteColor]];
        [characterColor setTitle:@"字体颜色" forState:UIControlStateNormal];
        [characterColor setTitleColor:[UIColor purpleColor] forState:UIControlStateNormal];
        [characterColor addTarget:self action:@selector(didClickCharacterColorButton:) forControlEvents:UIControlEventTouchUpInside];
        //字体大小button
        UIButton *characterSize = [UIButton buttonWithType:UIButtonTypeCustom];
        characterSize.layer.borderWidth = 1.0f;
        characterSize.layer.borderColor = [UIColor blackColor].CGColor;
        [characterSize setFrame:CGRectMake(107, 0, 106, 30)];
        [characterSize setBackgroundColor:[UIColor whiteColor]];
        [characterSize setTitle:@"字体大小" forState:UIControlStateNormal];
        [characterSize setTitleColor:[UIColor purpleColor] forState:UIControlStateNormal];
        [characterSize addTarget:self action:@selector(didClickCharacterSize:) forControlEvents:UIControlEventTouchUpInside];
        
        //字体名称button
        UIButton *characterType = [UIButton buttonWithType:UIButtonTypeCustom];
        characterType.layer.borderWidth = 1.0f;
        characterType.layer.borderColor = [UIColor blackColor].CGColor;
        [characterType setBackgroundColor:[UIColor whiteColor]];
        [characterType setTitle:@"字体名称" forState:UIControlStateNormal];
        [characterType setTitleColor:[UIColor purpleColor] forState:UIControlStateNormal];
        [characterType setFrame:CGRectMake(213, 0, 106, 30)];
        [characterType addTarget:self action:@selector(didClickCharacterType:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:characterColor];
        [self addSubview:characterSize];
        [self addSubview:characterType];
        
        
        //提醒时间
        UITextField *remindDateTextField = [[UITextField alloc]initWithFrame:CGRectMake(1, 30, 159, 30)];
        remindDateTextField.layer.borderWidth = 1.0f;
        remindDateTextField.layer.borderColor = [UIColor blackColor].CGColor;
        [remindDateTextField setBackgroundColor:[UIColor whiteColor]];
        //        [remindDateTextField setText:[NSDate date]];
        //使用单例从事件类中调取时间
        [remindDateTextField setText:event.eventCurrentDate];
        [remindDateTextField setTextColor:[UIColor redColor]];
        [remindDateTextField setTextAlignment:NSTextAlignmentCenter];
        [self addSubview:remindDateTextField];
        //        [remindDateTextField release];
        
        //当前时间
        UITextField *currentDateTextField = [[UITextField alloc]initWithFrame:CGRectMake(160, 30, 159, 30)];
        currentDateTextField.layer.borderWidth = 1.0f;
        currentDateTextField.layer.borderColor = [UIColor blackColor].CGColor;
        [currentDateTextField setBackgroundColor:[UIColor whiteColor]];
        //        [currentDateTextField setText:[NSString stringWithFormat:@"%@",[NSDate date]]];
        //使用单例从事件类中调取时间
        [currentDateTextField setText:event.eventCurrentDate];
        [currentDateTextField setTextColor:[UIColor grayColor]];
        [currentDateTextField setTextAlignment:NSTextAlignmentCenter];
        [self addSubview:currentDateTextField];
        //        [currentDateTextField release];
        
        //事件内容
        UITextView *eventTextView = [[UITextView alloc]initWithFrame:CGRectMake(1, 60, 318, 354)];
        eventTextView.textColor = [UIColor blackColor];
        eventTextView.font = [UIFont fontWithName:event.eventContentsType size:event.eventContentsSize];
        eventTextView.backgroundColor = [UIColor whiteColor];
        eventTextView.layer.borderWidth = 1;
        eventTextView.layer.borderColor = [UIColor purpleColor].CGColor;
        [self addSubview:eventTextView];
        
        
    }
    return self;
}

-(void)didClickCharacterColorButton:(UIButton *)button
{
    UIActionSheet *characterColorSheet = [[UIActionSheet alloc]initWithTitle:@"字体颜色" delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:@"确定" otherButtonTitles:@"颜色一",@"颜色二",@"颜色三", nil];
    characterColorSheet.actionSheetStyle = UIActionSheetStyleBlackTranslucent;
    //    [self addSubview:characterColorSheet];
    [characterColorSheet showInView:self];
}

-(void)didClickCharacterSize:(UIButton *)button
{
    UIActionSheet *characterColorSheet = [[UIActionSheet alloc]initWithTitle:@"字体大小" delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:@"确定" otherButtonTitles:@"略小",@"适中",@"较大", nil];
    characterColorSheet.actionSheetStyle = UIActionSheetStyleBlackTranslucent;

    [characterColorSheet showInView:self];
}

-(void)didClickCharacterType:(UIButton *)button
{
    [self.delegate didClickContentType];
}

#pragma mark - UIActionSheetDelegate
-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    switch (buttonIndex) {
        case 0:
            [self showAlert:@"确定"];
            break;
        case 1:
            ;
            break;
        case 2:
            ;
            break;
        case 3:
            ;
            break;
            
        default:
            break;
    }
}



-(void)showAlert:(NSString *)msg {
    UIAlertView *alert = [[UIAlertView alloc]
                          initWithTitle:@"Action Sheet选择项"
                          message:msg
                          delegate:self
                          cancelButtonTitle:@"确定"
                          otherButtonTitles: nil];
    [alert show];
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
