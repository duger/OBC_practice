//
//  main.m
//  ClassDemo03
//
//  Created by Duger on 13-9-4.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Student.h"
#import "Teacher.h"
#import "Fraction.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        Student *student1 = [Student studentWithName:@"wangwang" number:@"4423" sex:@"girl" score:98];
//        student1.name = @"naonao";
        
        student1.score = 89;
        NSLog(@"姓名：%@", student1.name );
    }
    
    Teacher *teacher1 = [Teacher teacherWithName:@"wangfu" sex:@"boy" school:@"lanou"];
    
    NSLog(@"姓名：%@ ",teacher1.name );
    
    Fraction *fraction1 = [[Fraction alloc]initWithNumerator:3 deniminator:8];
    [fraction1 reduce];
    [fraction1 description];
    NSLog(@"%d",fraction1.deniminator);
    
    Fraction *fraction2 = [[Fraction alloc]initWithNumerator:4 deniminator:8];
    Fraction *fraction = [fraction1 addFraction:fraction2];
    NSLog(@"结果为：%d / %d",fraction.numerator,fraction.deniminator);
    
    Fraction *fraction3 = [fraction1 multiplyFraction:fraction2];
    NSLog(@"结果为：%d / %d",fraction3.numerator,fraction3.deniminator);
    
    Fraction *fraction4 = [fraction1 reduceFraction:fraction2];
    NSLog(@"结果为：%d / %d",fraction4.numerator,fraction4.deniminator);
    
    fraction4.letxxx = 34;
    NSLog(@"结果为：%d ",fraction4.letxxx);
    return 0;
}

