//
//  Car.h
//  Car
//
//  Created by Duger on 13-8-3.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Car : NSObject
{
    
    float speed;    //车速
    NSString *name; //名称
//    @private
    @public
    int cID;         //id
}
@property(nonatomic,copy) NSString *name;
@property float speed;
@property int cID;

-(void) run;
-(id) initWithName: (NSString *) _name carSpeed: (float) _speed carID: (int) _cID;

@end
