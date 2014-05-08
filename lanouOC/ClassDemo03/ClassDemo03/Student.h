//
//  Student.h
//  ClassDemo03
//
//  Created by Duger on 13-9-4.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Student : NSObject
{
    NSString *_name;
    NSString *_number;
    NSString *_sex;
    CGFloat _score;
}

@property(nonatomic,retain) NSString *name;
@property(nonatomic,retain) NSString *number;
@property(nonatomic,retain) NSString *sex;
@property(nonatomic,assign) CGFloat score;

-(id)initWithName:(NSString *)name number:(NSString *)number sex:(NSString *)sex score:(CGFloat) score;
+(id)studentWithName:(NSString *)name number:(NSString *)number sex:(NSString *)sex score:(CGFloat)score;

+(id)studentWithName:(NSString *)name;



@end
