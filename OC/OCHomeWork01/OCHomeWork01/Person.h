//
//  Person.h
//  OCHomeWork01
//
//  Created by Duger on 13-9-6.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject

@property(nonatomic,retain) NSString *name;
@property(nonatomic,retain) NSString *sex;
@property(nonatomic,assign) NSInteger age;
@property(nonatomic,retain) NSString *identety;

-(id)initWithName:(NSString *)name sex:(NSString *)sex age:(NSInteger)age identety:(NSString *)identety;
+(id)personWithName:(NSString *)name sex:(NSString *)sex age:(NSInteger)age identety:(NSString *)identety;


@end
