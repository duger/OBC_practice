//
//  Teacher.h
//  ClassDemo03
//
//  Created by Duger on 13-9-4.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Teacher : NSObject
{
    NSString *name;
    NSString *sex;
    NSString *school;
    
}

@property(nonatomic,copy) NSString *name;
@property(nonatomic,copy) NSString *sex;
@property(nonatomic,copy) NSString *school;

-(id)initWithName:(NSString *)_name sex:(NSString *)_sex school:(NSString *)_school;
+(id)teacherWithName:(NSString *)_name sex:(NSString *)_sex school:(NSString *)_school;

@end
