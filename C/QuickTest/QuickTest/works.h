//
//  works.h
//  QuickTest
//
//  Created by Duger on 13-8-24.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#ifndef QuickTest_works_h
#define QuickTest_works_h

int is_leap_year(int year);
double myround(double a);
int abs(int x);

typedef struct people
{
    char name[20];
    int age;
    int num;
}People;

float myCalculate(float a ,float b,char c);

//void itoa(int x, char *p);

void itoa1(int x, char *p);

#endif
