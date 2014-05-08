//
//  ImageViewController.m
//  FileManagerSample
//
//  Created by Duger on 13-9-27.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#import "ImageViewController.h"


@interface ImageViewController ()

@end

@implementation ImageViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    self.view.backgroundColor = [UIColor randomColor];
}

-(IBAction)didClickSave:(id)sender
{
    UIGraphicsBeginImageContext(self.view.bounds.size);
    [self.view.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *tempImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    NSString *imageFilePath = [[UIImage imageAtDocumentPath] stringByAppendingFormat:@"/%@.png",[[NSDate date] description]]; 
    //通过函数将UIImage对象转换成数据的形式
    NSData *tempImageData = UIImagePNGRepresentation(tempImage);
    //将图片保存到对应路径
    [tempImageData writeToFile:imageFilePath atomically:YES];
    //
    self.view.backgroundColor = [UIColor randomColor];
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
