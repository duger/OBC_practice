//
//  main.c
//  ClassDemo07
//
//  Created by Duger on 13-8-23.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#include <stdio.h>


void swap(int *a,int *b){
  
    int temp = *a;
    *a = *b;
    *b = temp;
}

void array1(int arr[]){
    int temp = 0;
    
    if (arr[1] > arr[0]) {
        temp = arr[1];
        arr[1] = arr[0];
        arr[0] = temp;
        
    }
    
    }

unsigned long myStrlen(char *str)
{
    unsigned long count = 1;
    for (int i = 1; 1; i++) {
        if (*(str + i) == '\0') {
            break;
        }
        count++;
    }
    return count;
}


int main(int argc, const char * argv[])
{


    char array[5] = "ipone";
    
//    char *p = array;
    
//    printf("%c\n",*(p +1)+ 1);
    
    int m = 3, n = 5;
    swap(&m, &n);
    
    printf("m = %d, n = %d\n",m,n);
    
    
    int array2[2] = { 56,78};
    
    array1(&array2[0]);
    printf("最大值：%d\n最小值：%d\n",array2[0],array2[1]);
    
    char *string1 = "to be or not to bezzz!";
    unsigned long s = 0;
    s = myStrlen(string1);
    printf("%lu\n",s);
    
    char string[] = "iphone";
    
    char *p = string;
    *(p + 4) = 'v';
    printf("%s",p+1);
    
    
    char *strings[3] = {"iPhone","Android","win8"};
    
    for (int i = 0; i < 3; i++) {
        
        printf("%s\n",*(strings + i));  //strings++ 不可以！  地址为常量！不能改变！
    }
    
    
    
    
    return 0;
}

