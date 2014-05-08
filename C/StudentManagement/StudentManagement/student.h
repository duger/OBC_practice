//
//  student.h
//  StudentManagement
//
//  Created by Duger on 13-8-22.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#ifndef StudentManagement_student_h
#define StudentManagement_student_h

typedef struct student {
    
    char name[20];
    int age;
    float score;
    
}Student;

Student maxOne(Student St[]);

void printStudent(Student stu) ;

void arrangement(Student St[]);

void printStudent2(Student St[]);

#endif
