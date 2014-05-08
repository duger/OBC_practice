//
//  Candidate.h
//  StudentManagement
//
//  Created by Duger on 13-8-22.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#ifndef StudentManagement_Candidate_h
#define StudentManagement_Candidate_h

typedef struct candidates{
    char sign;
    char name[20];
    int ticket;
    
}Candidates;

void election(char chr);
#endif
