//
//  Candidate.c
//  StudentManagement
//
//  Created by Duger on 13-8-22.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#include <stdio.h>
#include "Candidate.h"

void election(char chr){
    Candidates person1 = { 'A',"wangfu",56};
    Candidates person2 = { 'B',"bingbing",77};
    Candidates person3 = { 'C',"titi",33};
    Candidates person4 = { 'D',"cooco",45};
    Candidates candds[4] = {person1,person2,person3,person4};
    for (int i = 0; i < 4; i++) {
        if (candds[i].sign == chr) {
            candds[i].ticket++;
        }
    }
    
    Candidates temp = {};
    for (int i = 0; i < 4; i++) {
        for (int j = 0; j < 4 - i; j++) {
            if (candds[i].ticket < candds[i + 1].ticket ) {
                temp = candds[i + 1];
                candds[i + 1] = candds[i];
                candds[i] = temp;
            }
        }
    }
    
    for (int i = 0; i < 4; i++) {
        
        
        printf("候选人%c,",candds[i].sign);
        printf(" %s ",candds[i].name);
        printf("票数为%d \n",candds[i].ticket);
        
    }
    
    
    
    
}


