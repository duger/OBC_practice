//
//  WFViewController.m
//  CoreDataSample
//
//  Created by Duger on 13-10-9.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#import "WFViewController.h"
#import "Person.h"

static inline NSNumber *toto(NSString *value)
{
    NSInteger integer = [value integerValue];
    NSNumber *number = [NSNumber numberWithInteger:integer];
    return number;
}


@interface WFViewController ()

@end

@implementation WFViewController
{
    Person *person;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    person = [[[CoreDataManager intence]lastPerson] retain];
    UITextField *pId = (UITextField *)[self.view viewWithTag:1001];
    UITextField *pName = (UITextField *)[self.view viewWithTag:1002];
    UITextField *pAge = (UITextField *)[self.view viewWithTag:1003];
    
    pId.text = [person.pid description];
    pName.text = person.pname;
    pAge.text = [person.page description];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)didClickInsert:(UIButton *)sender {
 /*
    //实例化实体描述对象
    NSEntityDescription *entity = [NSEntityDescription entityForName:; inManagedObjectContext:<#(NSManagedObjectContext *)#>]
    Person *person = [Person alloc]initWithEntity:<#(NSEntityDescription *)#> insertIntoManagedObjectContext:<#(NSManagedObjectContext *)#>
  
  */
    person = [[[CoreDataManager intence] createdPerson] retain];
    
    UITextField *pId = (UITextField *)[self.view viewWithTag:1001];
    UITextField *pName = (UITextField *)[self.view viewWithTag:1002];
    UITextField *pAge = (UITextField *)[self.view viewWithTag:1003];
    
    pId.text = [person.pid description];
    pName.text = person.pname;
    pAge.text = [person.page description];
}

- (IBAction)didClickSelect:(UIButton *)sender {
}

- (IBAction)didClickRemove:(UIButton *)sender {
    [[CoreDataManager intence] deletePerson:person];
}

- (IBAction)didClickUpdate:(UIButton *)sender {
}

#pragma mark - textField delegate
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    UITextField *pId = (UITextField *)[self.view viewWithTag:1001];
    UITextField *pName = (UITextField *)[self.view viewWithTag:1002];
    UITextField *pAge = (UITextField *)[self.view viewWithTag:1003];
    
            person.pid = toto(pId.text);
            
        
            person.pname = pName.text;
            
        
            person.page = toto(pAge.text);
            
            
        
    
    [textField resignFirstResponder];
    [[CoreDataManager intence] save];
    return YES;
}

@end
