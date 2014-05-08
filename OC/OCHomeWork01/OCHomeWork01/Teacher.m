//
//  Teacher.m
//  OCHomeWork01
//
//  Created by Duger on 13-9-6.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#import "Teacher.h"

@implementation Teacher

-(id)initWithName:(NSString *)name sex:(NSString *)sex age:(NSInteger)age identety:(NSString *)identety workSchool:(NSString *)workSchool
{
    if (self = [super initWithName:name sex:sex age:age identety:identety]) {
        _workSchool = workSchool;
    }
    return self;
}

+(id)teacherWithName:(NSString *)name sex:(NSString *)sex age:(NSInteger)age identety:(NSString *)identety workSchool:(NSString *)workSchool
{
    Teacher *teacher = [[Teacher alloc]initWithName:name sex:sex age:age identety:identety workSchool:workSchool];
    return [teacher autorelease];
    
}

- (void)dealloc
{
    NSLog(@"teacher died");
    [_workSchool release];
    [super dealloc];
}


@end
