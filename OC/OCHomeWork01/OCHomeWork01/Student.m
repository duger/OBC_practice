//
//  Student.m
//  OCHomeWork01
//
//  Created by Duger on 13-9-6.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#import "Student.h"

@implementation Student
-(id)initWithName:(NSString *)name sex:(NSString *)sex age:(NSInteger)age identety:(NSString *)identety studyclass:(NSString *)studyclass
{
    if (self = [super initWithName:name sex:sex age:age identety:identety]) {
        _studyclass = studyclass;
    }
    return self;
}

+(id)studentWithName:(NSString *)name sex:(NSString *)sex age:(NSInteger)age identety:(NSString *)identety studyclass:(NSString *)studyclass
{
    Student *student = [[Student alloc]initWithName:name sex:sex age:age identety:identety studyclass:studyclass ];
    return [student autorelease];
}

- (void)dealloc
{
    NSLog(@"student died");
    [_studyclass release];
    [super dealloc];
}
@end
