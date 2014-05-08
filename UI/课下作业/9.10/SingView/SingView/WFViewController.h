//
//  WFViewController.h
//  SingView
//
//  Created by Duger on 13-9-11.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CustomButton.h"

@interface WFViewController : UIViewController<CustomButtonDelegate>
-(void)showTheLastCount;

@end
