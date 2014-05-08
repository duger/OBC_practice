//
//  Day.c
//  StudentManagement
//
//  Created by Duger on 13-8-22.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#include <stdio.h>
#include "Day.h"

int days(Date date1){
    int days = 0;
    int year1[12] = {31,28,31,30,31,30,31,31,30,31,30,31},
    year2[12] = {31,29,31,30,31,30,31,31,30,31,30,31};
    if ((date1.year % 4 == 0 && date1.year % 100!= 0 )|| date1.year % 400 == 0) {
        for (int i = 0; i < date1.month - 1; i++) {
            days += year2[i];
        }
        days += date1.day;
         
    }else{
        for (int i = 0; i < date1.month - 1; i++) {
            days += year1[i];
        }
        days += date1.day;

    }
    return days;
}