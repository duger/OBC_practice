//
//  MyClass.h
//  OCHomeWork01
//
//  Created by Duger on 13-9-6.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Teacher.h"
@class Teacher;
@class Student;

@interface MyClass : NSObject

@property(nonatomic,retain) NSString *className;
@property(nonatomic,retain) Teacher *teacher;
@property(nonatomic,retain) NSMutableArray *students;

-(id)initWithClassName:(NSString *)className teacher:(Teacher *)teacher students:(NSMutableArray *)students;
+(id)myClassWithClassName:(NSString *)className teacher:(Teacher *)teacher students:(NSMutableArray *)students;
-(void)addTeacher:(Teacher *)teacher;
-(void)addStudents:(Student *)student;
-(void)removeStudentsWithName:(NSString *)name;
@end
