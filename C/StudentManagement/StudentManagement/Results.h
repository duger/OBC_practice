//
//  Results.h
//  StudentManagement
//
//  Created by Duger on 13-8-22.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#ifndef StudentManagement_Results_h
#define StudentManagement_Results_h

typedef struct student2 {
    int num;
    char name[20];
    int age;
    float result[3];
    float average;
    
    
}Student2;

Student2 averageResult(Student2 person);
void findBadboy(Student2 perss[]);
void findgoodboy(Student2 perss[]);
#endif
