//
//  ShiBan.m
//  FileManagerSample
//
//  Created by Duger on 13-9-27.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#import "ShiBan.h"

@implementation ShiBan

-(void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:self.sid forKey:@"sid"];
    [aCoder encodeObject:self.sname forKey:@"sname"];
    [aCoder encodeObject:self.sheadImg forKey:@"sheadImg"];
}


-(id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    if (self) {
        self.sid = [aDecoder decodeObjectForKey:@"sid"];
        self.sname = [aDecoder decodeObjectForKey:@"sname"];
        self.sheadImg = [aDecoder decodeObjectForKey:@"sheadImg"];
        
    }
    return self;
}

- (void)dealloc
{
    self.sid = nil;
    self.sname = nil;
    self.sheadImg = nil;
    [super dealloc];
}


-(id)initWithContentOfFile:(NSString *)path
{
    self = [super init];
    if (self) {
        //自动调用 initWithCoder  反序列化
        self = [NSKeyedUnarchiver unarchiveObjectWithFile:path];
    }
    return self;
}

-(void)writeToFile:(NSString *)path atomically:(BOOL)atomic
{
    //自动调用rootObject encodeWithCoder: 序列化
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:self];
    [data writeToFile:path atomically:YES];
    
}


@end
