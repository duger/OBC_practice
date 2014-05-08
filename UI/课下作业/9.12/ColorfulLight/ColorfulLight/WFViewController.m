//
//  WFViewController.m
//  ColorfulLight
//
//  Created by Duger on 13-9-13.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#import "WFViewController.h"
#import "ColorfullView.h"

typedef enum Color
{
    grayColor,
    redColor,
    greenColor,
    blueColor,
    cyanColor,
    yellowColor,
    magentaColor,
    orangeColor,
    urpleColor,
    brownColor
}mycolor;

@interface WFViewController ()

@end

@implementation WFViewController
{
    NSMutableArray *viewLines;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor scrollViewTexturedBackgroundColor];
    viewLines = [[NSMutableArray alloc]init];
   
    
    for (NSInteger i = 1; i <= 10; i++) {

        UIView *colorView = [[UIView alloc]init];
        colorView.frame = CGRectMake(0, 0,100, 100 );
        
    
        colorView.backgroundColor = [UIColor colorWithRed:((CGFloat)i * 5.0f)/50.0f green:((10.0 - (CGFloat)i) * 6.0f)/60.0f blue:((CGFloat)i * 8.0f)/80.0f alpha:1];
//    colorView.backgroundColor = [UIColor purpleColor];
        colorView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight ;
        colorView.tag = i;
        
//        [self.view addSubview:colorView];
        [viewLines addObject:colorView];
        [colorView release];
    }
    [self.view addSubview:viewLines[0]];
    for (NSInteger j = 0; j < 10; j++) {
        [[viewLines objectAtIndex:j] addSubview:[viewLines objectAtIndex:(j + 1)]];
    }
    for (UIView *item in viewLines) {
        item.center = CGPointMake(CGRectGetMidX(),CGRectGetMidY(super.view.bounds) );
    }
    

//    for (NSInteger j = 1; 1; j++) {
//        
//        UIView *colorView = [self.view viewWithTag:1];
//        
//        if (colorView.bounds.size.width < 300) {
//            CGRect bounds = colorView.bounds;
//            
//            bounds.size.width += 2;
//            bounds.size.height += 2;
//            
//            colorView.bounds = bounds;
//        }else{
//            break;
//        }
//        
//       
//        if (j== 20) {
//            j = 1;
//        }
//    }
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
