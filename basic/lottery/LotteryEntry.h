//
//  LotteryEntry.h
//  lottery
//
//  Created by Duger on 13-6-5.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LotteryEntry : NSObject{
    
    NSDate *entryDate;
    int firstNumber;
    int secondNumber;

}
//-(void)prepareRandomNumbers;
-(void)setEntryDate:(NSDate *)date;
-(NSDate *)entryDate;
-(int)firstNumber;
-(int)secondNumber;
-(id)initWithEntryDate:(NSDate *)theDate;
@end
