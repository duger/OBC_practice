//
//  Student.h
//  OCHomeWork01
//
//  Created by Duger on 13-9-6.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#import "Person.h"

@interface Student : Person
@property(nonatomic,retain) NSString *studyclass;
-(id)initWithName:(NSString *)name sex:(NSString *)sex age:(NSInteger)age identety:(NSString *)identety studyclass:(NSString *)studyclass;

+(id)studentWithName:(NSString *)name sex:(NSString *)sex age:(NSInteger)age identety:(NSString *)identety studyclass:(NSString *)studyclass;

@end
