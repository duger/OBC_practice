//
//  Person.h
//  ClassDemo03
//
//  Created by Duger on 13-9-4.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject
{
    NSString *name;
    NSInteger age;
}

@property(nonatomic,retain) NSString *name;

-(void) setAge:(NSInteger) _age;
@end
