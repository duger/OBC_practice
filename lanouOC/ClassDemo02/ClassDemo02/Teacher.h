//
//  Teacher.h
//  ClassDemo02
//
//  Created by Duger on 13-9-3.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#import "Person.h"

@interface Teacher : Person
{
    NSString *workSchool;
    NSString *class;
    NSString *title;
}

@property(nonatomic,copy) NSString *workSchool;
@property(nonatomic,copy) NSString *class;
@property(nonatomic,copy) NSString *title;

+(id) teacherWithName: (NSString *)_name identify:(NSString *)_identify sex:(NSString *)_sex age:(NSInteger) _age workSchool: (NSString *)_workSchool class:(NSString *)_class title:(NSString *)_title;

-(id)initWithName:(NSString *)_name identify:(NSString *)_identify sex:(NSString *)_sex age:(NSInteger) _age workSchool: (NSString *)_workSchool class:(NSString *)_class title:(NSString *)_title;

-(id)initWithTitle:(NSString *)_title;

-(void) whereDidYouWork;
@end
