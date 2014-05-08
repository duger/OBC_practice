//
//  main.c
//  ClassDemo05
//
//  Created by Duger on 13-8-21.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#include <stdio.h>
#include <string.h>
#include "Header.h"
#include "arrayDeal.h"
#include "factorial.h"

//void printHello(void)
//{
//    printf("Hello\n");
//}
//
//int peopleCount ()
//{
//    return 19;
//}
//
//float avarge(int a ,int b)
//{
//    return ( a + b ) / 2.0 ;
//}
//
//int max(int a ,int b)
//{
//    return (a > b ? a : b );
//}
//
//int max2(int a, int b)
//{
//    int c = 0;
//    if (a > b) {
//        c = 1;
//    }else if(a == b){
//        c = 0;
//    }else{
//        c = -1;
//    }
//    return c;
//}
//
//int sum1(int a,int b)
//{
//    int sum = 0;
//    for (int i = a; i <= b; i++) {
//        sum += i;
//    }
//    return sum;
//}

int recursion(int n){
    if (n == 1) {
        return 1;
    }else
        return n * recursion(n - 1);
    
}


int main(int argc, const char * argv[])
{

//    printHello();
//    
//    char str[20] = "iphone";
//    char str1[20] = "winphone";
//    
//    int a = strcmp(str, str1);
//    printf("a = %d\n",a);
//    
//    int studentNum = peopleCount() ;
//    
//    printf("十班人数为：%d\n",studentNum);
//    
//    float ave = avarge(3, 4);
//    printf("ave = %.2f\n",ave);
//    
//    int b = max(9, 6);
//    printf("b = %d\n",b);
//    
//    int c = max2(4, 6);
//    printf("c = %d\n",c);
//    
//    int sum = sum1(1, 100);
//    printf("sum = %d\n",sum);

    
    int a[10] = {3,4,5,6,7,8,9,3,2,1};
    
    printf("array sum = %d\n",arraySum(a, sizeof(a) / sizeof(a[0])));
    
    int num1 = 2,num2 = 3, num3 = 4;
    
    printf("s = %lu\n",sum(num1, num2, num3));
    
    
    return 0;
}

