//
//  TextViewController.m
//  FileManagerSample
//
//  Created by Duger on 13-9-27.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#import "TextViewController.h"

@interface TextViewController ()

@end

@implementation TextViewController

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

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)didClickDone:(UIBarButtonItem *)sender {
    [self.txtView resignFirstResponder];
    [self.navigationItem setRightBarButtonItem:self.saveItem animated:YES];
    
}
- (void)dealloc {
    [_txtField release];
    [_txtView release];
    [_doneItem release];
    [_saveItem release];
    [super dealloc];
}
- (IBAction)didClickSave:(UIBarButtonItem *)sender {
    
    if ([[self.txtField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet] ] isEqualToString:@""]) {
        return;
    }
    
    if ([[self.txtView.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet] ] isEqualToString:@""]) {
        return;
    }
    NSString *fileName = self.txtField.text;
    NSString *filePath = [[NSDictionary textAtDocumentPath]stringByAppendingFormat:@"/%@.plist",fileName];
    
    //声明一个需要保存的字典对象
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    [dic setObject:fileName forKey:@"name"];
    [dic setObject:self.txtView.text forKey:@"content"];
    
    //将字典写入文件
    [dic writeToFile:filePath atomically:YES];

}

#pragma mark - textField delegate
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
    
}

#pragma mark - textView Delegate
- (BOOL)textViewShouldBeginEditing:(UITextView *)textView;
{
    [self.navigationItem setRightBarButtonItem:self.doneItem animated:YES];
    return YES;
}
    
@end
