//
//  arrayDeal.c
//  ClassDemo05
//
//  Created by Duger on 13-8-21.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#include <stdio.h>

int arraySum(int arr[],int n)
{
    
    int sum = 0;
    for (int i = 0; i < n; i++) {
        sum += arr[i];
    }
    return sum;
}