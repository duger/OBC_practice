//
//  Person.h
//  ClassDemo01
//
//  Created by Duger on 13-9-2.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject
{

    NSString *_name;  //姓名
    NSString *_sex;   //性别
    NSString *_hobby;   //爱好
    int       _age;     //年龄
    NSInteger _id;      //ID
    CGFloat   _weight;  //重量
    
}

-(void) sayHi;
-(void) eat;

-(void) setName;
-(void) getName;



@end
