//
//  main.c
//  ClassDemo11
//
//  Created by Duger on 13-8-28.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#include <stdio.h>
#include <string.h>
/*
int max(int x,int y)
{
    return x > y ? x :y;
}

int sum(int x,int y)
{
    return x + y;
}

int min(int x , int y)
{
    return  x < y ? x : y;
}
*/

typedef struct
{
    char func_name[10];
    int (*p)(int ,int);
}FuncBrother;

int max(int x,int y)
{
    return x > y ? x :y;
}

int min(int x , int y)
{
    return  x < y ? x : y;
}

int sum(int x,int y)
{
    return x + y;
}

typedef int (*PFUN) (int ,int);
FuncBrother func_family[3] = {{"max",max},{"min",min},{"sum",sum}};

PFUN return_funcP(char *str)
{
    PFUN temp = NULL;
    for (int i = 0; i < 3; i++) {
        if (strcmp(func_family[i].func_name,str ) == 0) {
            temp = func_family[i].p;
            break;
        }
    }
    return temp;
}

int main(int argc, const char * argv[])
{
/*
    int (*p[3])(int ,int) ={ max ,sum , min };
    int a = 3,b = 5;
//    int result[3];
    for (int i = 0 ; i < 3; i++) {
        printf("%d\n",p[i](a,b));
    }
 */
    
    PFUN p = return_funcP("sum");
    int result = p(3 , 5);
    printf("result = %d\n",result);
    
    
    
    return 0;
}

