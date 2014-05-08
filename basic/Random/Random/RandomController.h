//
//  RandomController.h
//  Random
//
//  Created by Duger on 13-5-22.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RandomController : NSObject {
    IBOutlet NSTextField *textField;

   }
- (IBAction)seed:(id)sender;
- (IBAction)generate:(id)sender;


@end
