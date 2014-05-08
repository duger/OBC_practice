//
//  ColorManager.h
//  NavigationControllerSample
//
//  Created by Duger on 13-9-23.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ColorManager : NSObject

//defaultManager
//colorMagager
//singleton
//instance

+(ColorManager *)defaultManager;


@property(nonatomic,retain) UIColor *color;

@end
