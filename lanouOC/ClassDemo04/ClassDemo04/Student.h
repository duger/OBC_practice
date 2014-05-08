//
//  Student.h
//  ClassDemo04
//
//  Created by Duger on 13-9-5.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Student : NSObject
{
    NSString *_name;
    NSInteger _age;
    NSString *_sex;
    NSString *_address;
    NSString *_hobby;
}

-(id)initWithName:(NSString *)name age:(NSInteger)age sex:(NSString *)sex address:(NSString *)address hobby:(NSString *)hobby;
-(void)sayHi;


@end
