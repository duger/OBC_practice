//
//  CoreDataManager.h
//  CoreDataPractice
//
//  Created by Duger on 13-10-11.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "Person.h"
#import "Teacher.h"
#import "Student.h"

@interface CoreDataManager : NSObject
+(CoreDataManager *)defaultManager;

-(Person *)createdPerson;
-(void)save;
-(void)deletePerson:(Person *)person;

-(Person *)lastPerson;

-(NSArray *)allTeacher;
//-(NSArray *)allStudent;

-(Teacher *)createdTeacher;
-(Student *)createdStudent;

-(void)deleteTeacher:(Teacher *)teacher;
-(void)deleteStudent:(Student *)student;

-(NSArray *)sortStudent;

@property(nonatomic,retain) NSString *theOne;
@end
