//
//  main.c
//  test03
//
//  Created by Duger on 13-8-30.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#include <stdio.h>
#include <string.h>
#include <assert.h>

//unsigned long mystrcmp(const char *s1,const char *s2)
//{
//    unsigned long len1,len2;
//    assert(s1 != NULL && s2 != NULL);
//    len1 = strlen(s1);
//    len2 = strlen(s2);
//    unsigned long max = len1 > len2 ? len1 : len2;
//    unsigned long min = len1 < len2 ? len1 : len2;
//    char temp[max];
//    if (len1 > len2) {
//        strcpy(temp, s1);
//        strcpy(s1, s2);
//        strcpy(s2, temp);
//    }
//    
//    for (int i = 0; i < min; i++) {
//        if (*(s1 + i) < *(s2 + i) ) {
//            return (*(s1 + i) - *(s2 + i)) ;
//        }
//    }
//}

int strcmp2(const char *s1,const char *s2)
{
    assert(s1 != NULL && s2 != NULL);
    
    char *sr1 = s1, *sr2 = s2;
    for (; sr1 != '\0' && sr2 != '\0' ; sr1++,sr2++) {
        if (*sr1 == *sr2) {
            
            continue;
        }

            return (*sr1 - *sr2);
      
        }
    
    
}

int strcmp3(const char *s1,const char *s2)
{
    assert(s1 != NULL && s2 != NULL);
    
//    char *sr1 = s1, *sr2 = s2;
    for (; *s1 != '\0' && *s2 != '\0' ; s1++,s2++) {
        if (*s1 == *s2) {
            
            continue;
        }
        
        return (*s1 - *s2);
        
    }
    return 0;
    
    
}

int strcmp4(const char *s1,const char *s2)
{
    assert(s1 != NULL && s2 != NULL);
    if (*s1 == '\0' && *s2 == '\0') {
        return 0;
    }else if (*s1 == *s2) {
        strcmp4(++s1, ++s2);
        
        }else{
            return (*s1 - *s2);
        }
}


int main(int argc, const char * argv[])
{

    //3、实现C标准函数int
  //  strcmp(const char *s1, const char *s2);。（注意参数类型和条件判断， 以及函数返回值）
    char *s1 = "def";
    char *s2 = "def";
    
//    int a = (int)mystrcmp(s1, s2);
//    int a1 = (int)strcmp(s1, s2);
//    int a2 = (int)strcmp2(s1, s2);
//    int a3 = (int)strcmp3(s1, s2);
    int a = (int)strcmp4(s1, s2);
    printf("%d\n",a);
    return 0;
}

