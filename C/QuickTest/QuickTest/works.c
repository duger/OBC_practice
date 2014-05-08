//
//  works.c
//  QuickTest
//
//  Created by Duger on 13-8-24.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#include <stdio.h>
#include "works.h"
#include <math.h>

//
//int is_leap_year(int year)
//{
//    if ((year % 4 == 0 && year % 100 == 0) || year % 400 == 0) {
//        return 1;
//    }else{
//        return 0;
//    }
//}
//
//double myround(double a)
//{
//    int b = a;
//    if ((a - b) >= 0.5 || (a - b) >= -0.5 ) {
//        a = ceil(a);
//        return a;
//    }else{
//        return floor(a);
//    }
//    
//}
//
//int abs(int x)
//{
//    int a = 0;
//    if (x < 0) {
//        a = -x;
//    }else
//        a = x;
//    return a;
//}
//
//float myCalculate(float a ,float b,char c){
//    
//    switch (c) {
//        case '+':
//            return a + b;
//            break;
//        case '-':
//            return a - b;
//            break;
//        case '*':
//            return a * b;
//            break;
//        case '/':
//            return a / b;
//            break;
//        case '%':
//            return (int)a % (int)b;
//            break;
//        default:
//            break;
//    }
//}

//void itoa(int x, char (*p)[])
//{
//    char *a = 0;
//    int x2 = x;
//    int i = 0,m = 1;
//    while (x) {
//        x = x / 10;
//        i++;
//    }
//    for (int k = 0; k < i; k++) {
//        for (int l = 0; l < k; l++) {
//            m = m * 10;
//        }
//        *(a + k) = (x2 / (10 * m)) % 10;
//    }
//    for (int j = 0; j < i; j++) {
//        *(p + j) = *(a + i - 1 - j);
//    }
//    
//}
//

void itoa1(int x, char *p)
{
   
    
    sprintf(p, "%d",x);
    
}


