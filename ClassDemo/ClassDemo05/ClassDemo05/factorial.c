//
//  factorial.c
//  ClassDemo05
//
//  Created by Duger on 13-8-21.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#include <stdio.h>


unsigned long multiplication(int a ){
    unsigned long rest = 0;
    rest = a * a;
    return rest;
}
unsigned long factor(int a){
    unsigned long rest = 1;
    unsigned long j = multiplication(a);
    for (int i = 1; i <= j; i++) {
        rest *= i;
        
    }
    return rest;
}
unsigned long sum(int a ,int b ,int c){
    unsigned long sum = 0;
    unsigned long l = factor(a);
    unsigned long m = factor(b);
    unsigned long n = factor(c);
    sum = l + m + n;
    return sum;
}