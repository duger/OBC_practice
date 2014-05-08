//
//  Student.h
//  ClassDemo01
//
//  Created by Duger on 13-9-2.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#import "Person.h"

@interface Student : Person
{
    NSInteger number;
    NSInteger score;
}

-(void) goToClass;

@end
