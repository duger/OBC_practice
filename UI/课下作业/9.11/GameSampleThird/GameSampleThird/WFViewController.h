//
//  WFViewController.h
//  GameSampleThird
//
//  Created by Duger on 13-9-12.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "myButton.h"

@interface WFViewController : UIViewController<myButtonDelegate>
-(void)showTheCount;
@end
