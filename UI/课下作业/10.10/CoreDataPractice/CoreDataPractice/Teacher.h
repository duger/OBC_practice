//
//  Teacher.h
//  CoreDataPractice
//
//  Created by Duger on 13-10-12.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Student;

@interface Teacher : NSManagedObject

@property (nonatomic, retain) NSString * tName;
@property (nonatomic, retain) NSNumber * sortOrNot;
@property (nonatomic, retain) NSSet *studentList;
@end

@interface Teacher (CoreDataGeneratedAccessors)

- (void)addStudentListObject:(Student *)value;
- (void)removeStudentListObject:(Student *)value;
- (void)addStudentList:(NSSet *)values;
- (void)removeStudentList:(NSSet *)values;

@end
