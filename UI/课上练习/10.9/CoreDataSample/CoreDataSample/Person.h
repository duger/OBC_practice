//
//  Person.h
//  CoreDataSample
//
//  Created by Duger on 13-10-9.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Person : NSManagedObject

@property (nonatomic, retain) NSNumber * page;
@property (nonatomic, retain) NSNumber * pid;
@property (nonatomic, retain) NSString * pname;

@end
