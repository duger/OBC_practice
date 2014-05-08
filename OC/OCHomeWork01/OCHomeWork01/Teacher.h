//
//  Teacher.h
//  OCHomeWork01
//
//  Created by Duger on 13-9-6.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#import "Person.h"

@interface Teacher : Person

@property(nonatomic,retain)NSString *workSchool;

-(id)initWithName:(NSString *)name sex:(NSString *)sex age:(NSInteger)age identety:(NSString *)identety workSchool:(NSString *)workSchool;

+(id)teacherWithName:(NSString *)name sex:(NSString *)sex age:(NSInteger)age identety:(NSString *)identety workSchool:(NSString *)workSchool;

@end
