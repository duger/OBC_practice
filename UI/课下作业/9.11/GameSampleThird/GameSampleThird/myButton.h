//
//  myButton.h
//  GameSampleThird
//
//  Created by Duger on 13-9-12.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol   myButtonDelegate <NSObject>
-(void)showTheCount;

@end

@interface myButton : UIView
{
//    UIButton *grayButton;
//    UIButton *_orangeButton;
}
@property(nonatomic,retain) UIButton *orangeButton;
@property(nonatomic,retain) UIButton *grayButton;
@property(nonatomic,assign) NSInteger x;
@property(nonatomic,assign) NSInteger y;

@property(nonatomic,assign) id<myButtonDelegate> delegate;
-(void)reset;



@end
