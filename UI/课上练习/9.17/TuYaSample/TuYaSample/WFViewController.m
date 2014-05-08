//
//  WFViewController.m
//  TuYaSample
//
//  Created by Duger on 13-9-17.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#import "WFViewController.h"

@interface WFViewController ()

@end

@implementation WFViewController
@synthesize imageArray = _imageArray;
@synthesize imageViewArray = _imageViewArray;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    //BLOCK 块儿 数组对象使用block排序
   self.imageViewArray = [self.imageViewArray sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2) {
        UIImageView *value1 =(UIImageView *)obj1;
        UIImageView *value2 = (UIImageView *)obj2;
        if (value1.tag < value2.tag) {
            return NSOrderedAscending;
        }
     if (value1.tag > value2.tag) {
         return NSOrderedDescending;
     }else
     return NSOrderedSame;
    }];
    
    /*
    NSArray *_array = [[NSArray alloc]init];
    self.imageArray = _array;
    [_array release];
    */
    //等价于下面
    self.imageArray = [[[NSMutableArray alloc]init] autorelease];
    
   }


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)setupImageViewArray
{
    for (UIImageView *item in self.imageViewArray) {
        
        @try {
//            item.image = [self.imageArray objectAtIndex:(item.tag - 1001)];用tag也可以
            item.image = [self.imageArray objectAtIndex:[self.imageViewArray indexOfObject:item] ];
        }
        @catch (NSException *exception) {
            ;
        }
        @finally {
            ;
        }
    }
}


- (void)dealloc {
    self.imageArray = nil;
    self.imageViewArray = nil;
    self.customView = nil;
    [super dealloc];
}

- (IBAction)didClickSaveButton:(UIButton *)sender {
    if ([self.imageArray count] <= 6) {
//        self.imageArray = [self.imageArray arrayByAddingObject:[self.customView customView]];
        [self.imageArray addObject:[self.customView customImage]];
    }
    else{
        //KVC、KVO能够解决不可变数组删除元素
//        self.imageArray = self.imageArray
        [self.imageArray removeObjectAtIndex:0];
        [self.imageArray addObject:[self.customView customImage]];
    }
        
    [self setupImageViewArray];
}

                   
- (IBAction)reDoButton:(UIButton *)sender {
    [self.customView reDo];
}

- (IBAction)didChangeValued:(id)sender {
    UISlider *slider = (UISlider *)sender;
    self.customView.lineWidth = slider.value;
    
    
}
@end
