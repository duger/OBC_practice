//
//  WFViewController.m
//  Calculator
//
//  Created by Duger on 13-9-15.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#import "WFViewController.h"

@interface WFViewController ()
{
    NSMutableArray *numberList;
    NSMutableString *ShowList;
    NSInteger tagCount;
}

@end

@implementation WFViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    numberList = [[NSMutableArray alloc]init];
    ShowList = [[NSMutableString alloc]init];
    [ShowList setString:@""];
    tagCount = 0;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    [numberList release];
    [ShowList release];
}


- (IBAction)num7:(UITapGestureRecognizer *)sender {
    NSInteger tag = 7;
    [self getNumber:tag];
    [self showTheNumber];

}

- (IBAction)num8:(UITapGestureRecognizer *)sender {
    NSInteger tag = 8;
    [self getNumber:tag];
    [self showTheNumber];
}

- (IBAction)num9:(UITapGestureRecognizer *)sender {
    NSInteger tag = 9;
    [self getNumber:tag];
    [self showTheNumber];
}

- (IBAction)num4:(UITapGestureRecognizer *)sender {
    NSInteger tag = 4;
    [self getNumber:tag];
    [self showTheNumber];
}

- (IBAction)num5:(UITapGestureRecognizer *)sender {
    NSInteger tag = 5;
    [self getNumber:tag];
    [self showTheNumber];
}

- (IBAction)num6:(UITapGestureRecognizer *)sender {
    NSInteger tag = 6;
    [self getNumber:tag];
    [self showTheNumber];
}

- (IBAction)num1:(UITapGestureRecognizer *)sender {
    NSInteger tag = 1;
    [self getNumber:tag];
    [self showTheNumber];
}

- (IBAction)num2:(UITapGestureRecognizer *)sender {
    NSInteger tag = 2;
    [self getNumber:tag];
    [self showTheNumber];
}

- (IBAction)num3:(UITapGestureRecognizer *)sender {
    NSInteger tag = 3;
    [self getNumber:tag];
    [self showTheNumber];
}

- (IBAction)num0:(UITapGestureRecognizer *)sender {
    NSInteger tag = 10;
    [self getNumber:tag];
    [self showTheNumber];
}

- (IBAction)numPoint:(UITapGestureRecognizer *)sender {
    
    NSInteger tag = 11;
    [self getNumber:tag];
    [self showTheNumber];
}

- (IBAction)numAC:(UITapGestureRecognizer *)sender {
    NSInteger tag = 16;
    [self allClear];
}

- (IBAction)numPlus:(UITapGestureRecognizer *)sender {
    NSInteger tag = 12;
   
    [self signButton:tag];
    
}

- (IBAction)numMines:(UITapGestureRecognizer *)sender {
    NSInteger tag = 13;
    [self signButton:tag];
    

}

- (IBAction)numCheng:(UITapGestureRecognizer *)sender {
    NSInteger tag = 14;
    [self signButton:tag];
    
}

- (IBAction)numChu:(UITapGestureRecognizer *)sender {
    NSInteger tag = 15;
    [self signButton:tag];
    

}




- (IBAction)numEquire:(UITapGestureRecognizer *)sender {
    
    if ([self check]) {
        [self calculate];
        [self showResult];
    };
    
}




-(void)getNumber:(NSInteger) tag
{
    
    UITextField *num = (UITextField *)[self.view viewWithTag:tag];
    NSLog(@"%@",num.text);

    [ShowList appendString:[NSString stringWithFormat:@"%@",num.text]];
    NSLog(@"showlist%@",ShowList);
    
    //    NSArray *numbers = [ShowList componentsSeparatedByString:@"."];
//    if (numbers.count >= 3) {
//        ;
//    }
//    if ([numbers objectAtIndex:1] == nil && numbers.count == 2) {
//        [self myErrors];
//    }
    
}



-(void)showTheNumber
{
    

    UITextField *result = (UITextField *)[self.view viewWithTag:20];

    NSArray *numbers = [ShowList componentsSeparatedByString:@"$"];
    
//    result.text = [numbers componentsJoinedByString:nil];
    result.text = [numbers objectAtIndex:(numbers.count - 1)];
//    NSArray *num1 = [ShowList ]
    
}

-(void)showResult
{
    tagCount = 0;
    UITextField *result = (UITextField *)[self.view viewWithTag:20];
    
    
//    NSArray *numbers = [ShowList componentsSeparatedByString:@"."];
//    NSInteger num = [[numbers objectAtIndex:1]integerValue];
//    if (num == 0) {
//        result.text = [numbers objectAtIndex:0];
//    }else{
//        result.text = ShowList;
//    }
    result.text = ShowList;
    [ShowList setString:@""];
    
}

-(void)signButton:(NSInteger) tag
{
    tagCount++;
    
    if (![self check]) {
        return;
    }
    
    if ([ShowList isEqual: @""]) {
        [ShowList setString:[numberList objectAtIndex:0]];
    }
    
    UITextField *num = (UITextField *)[self.view viewWithTag:tag];
    NSLog(@"%@",num.text);
    [ShowList appendString:@"$"];
    [ShowList appendString:[NSString stringWithFormat:@"%@",num.text]];

    [ShowList appendString:@"$"];
    NSLog(@"showlist%@",ShowList);
    
    ////////////////////////判断“。”
    
    
   }


-(BOOL)check
{
    
    if ([ShowList isEqual:@""]) {
        [self myErrors];
        return 0;
    }
    
    NSInteger count = 0;
    //判断0在头一位
    NSArray *number1 = [ShowList componentsSeparatedByString:@"0"];
    if ([[number1 objectAtIndex:0]isEqual: @""]) {
        [self myErrors];
        return 0;
    }
    
    
    
    
    NSArray *numbers = [ShowList componentsSeparatedByString:@"."];
    NSLog(@"判读%@",numbers);
    count = numbers.count - 1;
    if ([[numbers objectAtIndex:0]isEqual: @""]) {
        [self myErrors];
        return 0;
    }
    
    for (NSString *item in numbers) {
        
    }
    if (count > tagCount) {
        [self myErrors];
        return 0;
    }
    
    
    NSArray *number2 = [[numbers objectAtIndex:(numbers.count - 1)] componentsSeparatedByString:@"$"];
    if ([[number2 objectAtIndex:0]isEqual: @""]) {
        [self myErrors];
    }else{
        if ([[number2 objectAtIndex:0]integerValue]==0) {
            [self myErrors];
            return 0;
        }
    }
//    NSArray *number3 = [ShowList componentsSeparatedByString:@"$"];
//    if (number3.count >= 3) {
//        if ([[number3 objectAtIndex:(number3.count - 3)]isEqual: @""]) {
//            [self myErrors];
//            return;
//        }
//    }
    

}


-(void)calculate
{
    NSLog(@"%@",ShowList);
    numberList = (NSMutableArray *)[ShowList componentsSeparatedByString:@"$"];
    NSLog(@"%@",numberList.description);
    NSInteger count = numberList.count;
    NSLog(@"%d",count);
    CGFloat num1,num2;
    NSString *sign;
    CGFloat result = 0;
    for (NSInteger i = 1; i <= count / 3; i++) {
        
    
    
        
       
        num1 =[[numberList objectAtIndex:0] floatValue];
        num2 = [[numberList objectAtIndex:2] floatValue];
        sign = [numberList objectAtIndex:1];
        result = [self inCalculate:num1 :num2 :sign];
    
        [numberList replaceObjectAtIndex:0 withObject:[NSString stringWithFormat:@"%g",result]];
        [numberList removeObjectAtIndex:1];
        [numberList removeObjectAtIndex:1];
    }
    
    [ShowList setString:[NSString stringWithFormat:@"%g",result]];

}


-(CGFloat)inCalculate:(CGFloat)num1 :(CGFloat)num2 :(NSString*)sign
{
    CGFloat result;
    if ([sign isEqual: @"+"]) {
        result = num1 + num2;

    }else if ([sign isEqual:@"-"])
    {
        result = num1 - num2;
    }else if ([sign isEqual:@"*"])
    {
        result = num1 * num2;
        
    }else{
        result = num1 / num2;
    }
    return result;
}


-(void)allClear
{
    UITextField *num = (UITextField *)[self.view viewWithTag:20];
    num.text = @"0";
    [ShowList setString:@""];
//    NSLog(@"clear NumberList: %@",[numberList description]);
    if (numberList.count == 0) {
        return;
    }else{
    [numberList removeAllObjects];
    }
}

-(void)myErrors
{
    UIAlertView *error = [[UIAlertView alloc]initWithTitle:@"警告" message:@"包含非法输入" delegate:nil cancelButtonTitle:@"返回" otherButtonTitles:@"确认", nil];
    [self.view addSubview:error];
    [error show];
    [error release];
    [self allClear];
}

- (void)dealloc {
    
    [numberList release];
    [ShowList release];
    
    self.Result = nil;
    [super dealloc];
}

@end
