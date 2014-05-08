//
//  Person.h
//  ClassDemo02
//
//  Created by Duger on 13-9-3.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject
{
    NSString *name;
    NSString *identify;
    NSInteger age;
    NSString *sex;
    
}

@property(nonatomic,copy) NSString *name;
@property(nonatomic,copy) NSString *identify;
@property(nonatomic,copy) NSString *sex;
@property(nonatomic) NSInteger age;

+(id)personWithName:(NSString *)_name identify:(NSString *)_identify sex:(NSString *)_sex age:(NSInteger) _age;

-(id)initWithName:(NSString *)_name identify:(NSString *)_identify sex:(NSString *)_sex age:(NSInteger) _age;


@end
