//
//  MyClass.m
//  OCHomeWork01
//
//  Created by Duger on 13-9-6.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#import "MyClass.h"
#import "Teacher.h"
#import "Student.h"

@implementation MyClass
-(id)initWithClassName:(NSString *)className teacher:(Teacher *)teacher students:(NSMutableArray *)students
{
    if (self = [super init]) {
        _className = className;
        self.teacher = teacher;
        self.students = [[[NSMutableArray alloc]initWithArray:students]autorelease];
    }
    return self;
}
+(id)myClassWithClassName:(NSString *)className teacher:(Teacher *)teacher students:(NSMutableArray *)students
{
    MyClass *class = [[MyClass alloc]initWithClassName:className teacher:teacher students:students];
    return [class autorelease];
}

-(void)addTeacher:(Teacher *)teacher
{
    self.teacher = [teacher autorelease];
}

-(void)addStudents:(Student *)student
{
    [self.students addObject:student];
    
}

-(void)removeStudentsWithName:(NSString *)name
{
    for (int i = 0; i < self.students.count; i++) {
        if ([[self.students[i] name]isEqualToString:name ]) {
            [self.students removeObjectAtIndex:i];
        }
    }
}


- (void)dealloc
{
    NSLog(@"myclass died");
    [_className release];
    [_teacher release];
    [_students release];
    [super dealloc];
}
@end
