//
//  WFViewController.h
//  GameSampleFirst
//
//  Created by Duger on 13-9-11.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WFButton.h"

@interface WFViewController : UIViewController<WFButtonDelegate>
-(void)showTheCount;
@end
