//
//  Student.h
//  ClassDemo02
//
//  Created by Duger on 13-9-3.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#import "Person.h"

@interface Student : Person
{
    NSString *school;
    NSString *record;
    
}

@property(nonatomic,copy) NSString *school;
@property(nonatomic,copy) NSString *record;

+(id) studentWithName:(NSString *)_name identify:(NSString *)_identify sex:(NSString *)_sex age:(NSInteger)_age School: (NSString *)_school record:(NSString *)_record;

-(id)initWithName:(NSString *)_name identify:(NSString *)_identify sex:(NSString *)_sex age:(NSInteger)_age School: (NSString *)_school record:(NSString *)_record;

@end
