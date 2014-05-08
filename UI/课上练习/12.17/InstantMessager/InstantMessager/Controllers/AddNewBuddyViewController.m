//
//  AddNewBuddyViewController.m
//  InstantMessager
//
//  Created by Duger on 13-12-20.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#import "AddNewBuddyViewController.h"
#import "XMPPManager.h"

@interface AddNewBuddyViewController ()

@end

@implementation AddNewBuddyViewController

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
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)didClickAddButton:(UIButton *)sender {
    NSString *tempString = nil;
//    if (![self.userName.text hasSuffix:@"@lanouserver"]) {
//        tempString = [NSString stringWithFormat:@"%@@%@",self.userName.text,@"lanouserver"];
//    }else
        tempString = self.userName.text;
    
    [[[XMPPManager defaultManager] xmppRoster] addUser:[XMPPJID jidWithString:tempString] withNickname:nil];
    
}
@end
