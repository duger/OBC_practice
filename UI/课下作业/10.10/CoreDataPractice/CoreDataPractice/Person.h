//
//  Person.h
//  CoreDataPractice
//
//  Created by Duger on 13-10-12.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Person : NSManagedObject

@property (nonatomic, retain) NSString * pAge;
@property (nonatomic, retain) NSNumber * pId;
@property (nonatomic, retain) NSString * pName;

@end
