//
//  RootViewController.h
//  ObservingDemo
//
//  Created by Duger on 13-11-26.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol RootViewControllerDelegate <NSObject>
@optional
-(void)changeThemeColor:(id)sender;

@end

@interface RootViewController : UITabBarController
@property(nonatomic,assign) id<RootViewControllerDelegate>kdelegate;
@end
