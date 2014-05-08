//
//  CustomView.h
//  ThreadPractice2
//
//  Created by Duger on 13-10-15.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol CustomViewDelegate<NSObject>
-(void)clickButton:(UIButton *)sender;

@end


@interface CustomView : UIView

@property(nonatomic,assign) id<CustomViewDelegate>delegate;
@property(nonatomic,retain)UITextView *textView;
@property(nonatomic,retain)UIButton *button;

-(void)_threadMethod:(id)sender;
-(void)_timerMethod;
@end
