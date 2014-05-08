//
//  WFViewController.m
//  DrawWark
//
//  Created by Duger on 13-9-18.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#import "WFViewController.h"



@interface WFViewController ()

@end

@implementation WFViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.imageViewArray = [self.imageViewArray sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2) {
        UIImageView *value1 = (UIImageView *)obj1;
        UIImageView *value2 = (UIImageView *)obj2;
        
        if (value1.tag > value2.tag) {
            return NSOrderedDescending;
        }
        if (value1.tag < value2.tag) {
            return NSOrderedAscending;
        }
        return NSOrderedSame;
    }];
    self.imageList = [[NSMutableArray alloc]init];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    self.imageList = nil;
    
}

- (IBAction)didClickReture:(UIButton *)sender {
    NSLog(@"didclickReture");
    [self.drawView roDo];
    
}

- (IBAction)didClickSaveButton:(UIButton *)sender {
    if ([self.imageList count] < 6) {
        NSLog(@"imageList:%d",self.imageList.count);
        [self.imageList addObject:[self.drawView getMyImage]];
        
    }else{
        [self.imageList removeObjectAtIndex:0];
        [self.imageList addObject:[self.drawView getMyImage]];
    }
    
    for (UIImageView *item in self.imageViewArray) {
        
        @try {
            item.image = [self.imageList objectAtIndex:[self.imageViewArray indexOfObject:item]];
        }
        @catch (NSException *exception) {
            ;
        }
        @finally {
            ;
        }
        
    }

}
- (IBAction)didChageValue:(UISlider *)sender {
}

- (void)dealloc
{
    self.imageList = nil;
    self.drawView = nil;
    self.imageViewArray = nil;
    [super dealloc];
}

@end
