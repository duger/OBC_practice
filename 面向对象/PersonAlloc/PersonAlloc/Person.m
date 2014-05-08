//
//  Person.m
//  PersonAlloc
//
//  Created by Duger on 13-7-24.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#import "Person.h"

@implementation Person
//方法的实现
-(id) initWithAge:(int)_age identify:(int) _identify{
    if (self = [super init]) {
        age = _age;
        identify =_identify;
    }
    return self;
}
-(int) getIdentify{
    return identify;
}
-(int) getage{
    return age;
}
-(void) setAge:(int) _age{
    age = _age;
}
-(void) changeAge:(int) _age{
    _age = 38;
    NSLog(@"age____:%d",_age);
}
@end
