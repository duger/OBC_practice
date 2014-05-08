//
//  main.c
//  test02
//
//  Created by Duger on 13-8-30.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#include <stdio.h>
#include <string.h>


void maxFirst(char *str1,char *str2,char str3[],int n)
{
    int len1,len2 ;
    
    len1 = (int)strlen(str1);
    len2 = (int)strlen(str2);
    char *temp = NULL;
    if (len1 > len2) {
        temp = str1;
        str1 = str2;
        str2 = temp;
//        strcpy(temp, str1);
//        strcpy(str1, str2);
//        strcpy(str2, temp);
    }
    printf("str1 %s\n",str1);
    printf("str2 %s\n",str2);

    int n1 = len1 < len2 ? len1 : len2;
    
    for (int i = 0; i < n1; i++) {
        if (memcmp((str1 + i ), (str2 + i),1) < 0) {
            memcpy(&str3[2*i], (str1 + i), 1);
            memcpy(&str3[2*i + 1], (str2 + i),1);
        }else
        {
            memcpy(&str3[2*i], (str2 + i),1);
            memcpy(&str3[2*i + 1], (str1 + i),1);
        }
    }
   
    
    strcpy(str3 + 2*n1 , (str2 + n1));

}

int main(int argc, const char * argv[])
{

 /*  2、有两个字符串（有效字符不超过9个）str1，str2，将str1，str2的对应字符中德较大者存放在另一个数组的对应位置上，如：char str1 = "hello"; char str2 = "aka";
    完成组合后，兴盛程的字符串为：“ahekaleldou”。
  */
    
    char *str1 = "hello";
    char *str2 = "akaeduaawww";
    char str3[18];
    maxFirst(str1, str2, str3, 18);
    
   

    printf("%s\n",str3);

    
    
    
    
    return 0;
}

