//
//  Car.h
//  ClassDemo01
//
//  Created by Duger on 13-9-2.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#import <Foundation/Foundation.h>
static NSInteger wocao;     //static静态变量 本类以及其子类都可以使用

@interface Car : NSObject
{
    NSInteger number;
    NSString  *name;
    float   weight;
    
    
}

@property(nonatomic) NSInteger number;
@property(nonatomic,retain) NSString *name;
@property(nonatomic) float weight;

+(id) carWithNumber:(NSInteger) _number name:(NSString *)_name weight:(float) _weight;

-(id) initWithNumber:(NSInteger )_number andName:(NSString *)_name andWeight:(float )_weight;

-(id) initWithNumber:(NSInteger )_number;
+(id) carWithName:(NSString *)_name;

-(void) introduceYourself;

-(void) drive;


@end
