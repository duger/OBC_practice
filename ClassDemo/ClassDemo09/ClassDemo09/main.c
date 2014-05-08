//
//  main.c
//  ClassDemo09
//
//  Created by Duger on 13-8-27.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#include <stdio.h>

#define DEBUG_DUGER

void debug_printf(char *chr ,...)
{
#ifdef DEBUG_DUGER
    printf("say yes");
#else
    printf("Say NO");
#endif
}

typedef enum {
    spring = 1,
    summer,
    autumn,
    winter 
}Season;

void season_print(Season season){
    if (season == 1) {
        printf("summer\n");
    }
}


int main(int argc, const char * argv[])
{

#ifdef DEBUG_DUGER
    printf("say yes\n");
#else
    printf("Say NO\n");
#endif
    
    season_print(winter);
    
    int a = 0;
    switch (4) {
        case spring:
            printf("Spring\n");
            break;
        case summer:
            printf("summer\n");
            break;
        case autumn:
            printf("autumn\n");
            break;
        case winter:
            printf("winter\n");
            break;
            
        default:
            break;
    }
    const int a1 = 5;
   const int *p = &a1;
//    *p = 10;
    printf("%d\n",*p);
    
        
    
    return 0;
}

