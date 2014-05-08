//
//  main.m
//  ClassDemo02
//
//  Created by Duger on 13-9-3.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"
#import "Student.h"
#import "Teacher.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        Student *stu1 = [[Student alloc] initWithName:@"wangwang" identify:@"3435334255" sex:@"girl" age:34 School:@"lanoukeji" record:@"本科"];
        NSLog(@"\n姓名：%@ 性别：%@ \n年龄：%ld 身份证号：%@ \n学位：%@ 学校：%@",stu1.name ,stu1.sex,stu1.age, stu1.identify,stu1.record ,stu1.school);
        
        Teacher *tech1 =[[Teacher alloc] initWithName:@"rsara" identify:@"349539503" sex:@"boy" age:34 workSchool:@"lanou" class:@"10班" title:@"砖家"];
        NSLog(@"\n姓名：%@ 性别：%@ \n年龄：%ld 身份证号：%@ \n职称：%@ 学校：%@",tech1.name ,tech1.sex,tech1.age, tech1.identify,tech1.title ,[tech1 workSchool]);
        
        Student *stu2 = [Student studentWithName:@"chaochao" identify:@"34343535343" sex:@"girl" age:23 School:@"吉林师范" record:@"本科"];
        NSLog(@"\n姓名：%@ 性别：%@ \n年龄：%ld 身份证号：%@ \n学位：%@ 学校：%@",stu2.name ,stu2.sex,stu2.age, stu2.identify,stu2.record ,stu2.school);
    }
    return 0;
}

