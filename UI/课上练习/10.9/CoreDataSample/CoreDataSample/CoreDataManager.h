//
//  CoreDataManager.h
//  CoreDataSample
//
//  Created by Duger on 13-10-9.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "Person.h"
#import "Teacher.h"
#import "Student.h"

@interface CoreDataManager : NSObject
+(CoreDataManager *)intence;

-(Person *)createdPerson;

-(void)save;

-(void)deletePerson:(Person *)person;

//获取最后的person
-(Person *)lastPerson;

-(Teacher *)createdTeacher;
-(Student *)createdStudent;

-(void)deleteObject:(NSManagedObject *)object;

-(NSArray *)allTeacher;

-(void)deleteStudent:(Student *)student;

-(void)deleteTeacher:(Teacher *)teacher;

@end
