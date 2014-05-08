//
//  Teacher.m
//  ClassDemo02
//
//  Created by Duger on 13-9-3.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#import "Teacher.h"

@implementation Teacher
@synthesize workSchool,class,title;

+(id) teacherWithName: (NSString *)_name identify:(NSString *)_identify sex:(NSString *)_sex age:(NSInteger) _age workSchool: (NSString *)_workSchool class:(NSString *)_class title:(NSString *)_title
{
    Teacher *teach = [[Teacher alloc] initWithName:_name identify:_identify sex:_sex age:_age workSchool:_workSchool class:_class title:_title];
    return [teach autorelease];
}

-(id)initWithName:(NSString *)_name identify:(NSString *)_identify sex:(NSString *)_sex age:(NSInteger) _age workSchool: (NSString *)_workSchool class:(NSString *)_class title:(NSString *)_title
{
    if (self = [super initWithName:_name identify:_identify sex:_sex age:_age ]) {
        workSchool = _workSchool;
        class = _class ;
        title = _title;
    }
    return self;
}

-(id)initWithTitle:(NSString *)_title
{
    return [self initWithName:nil identify:nil sex:nil age:0 workSchool:nil class:nil title:@"高级"];
}

-(void) whereDidYouWork
{
    NSLog(@"工作地点： %@ ",workSchool);
}

@end
