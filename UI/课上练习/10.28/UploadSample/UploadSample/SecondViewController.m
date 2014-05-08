//
//  SecondViewController.m
//  UploadSample
//
//  Created by Lewis on 13-10-17.
//  Copyright (c) 2013年 www.lanou3g.com  北京蓝鸥科技有限公司. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"Second", @"Second");
        self.tabBarItem.image = [UIImage imageNamed:@"second"];
        
        //添加注册通知
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(_didReceiveNotification) name:kUploadSuccessedNotification object:nil];
    }
    return self;
}
							
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.textView.text = [Singleton instance].content;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [_textView release];
    [super dealloc];
}

#pragma mark - 收到上传成功的通知
- (void)_didReceiveNotification
{
    self.textView.text = [Singleton instance].content;
}
@end
