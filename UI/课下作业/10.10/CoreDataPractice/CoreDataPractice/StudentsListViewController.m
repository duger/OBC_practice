//
//  StudentsListViewController.m
//  CoreDataPractice
//
//  Created by Duger on 13-10-11.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#import "StudentsListViewController.h"
#import "Teacher.h"

@interface StudentsListViewController ()

@end

@implementation StudentsListViewController
{
    NSSortDescriptor *sortDescriptor;
    NSSortDescriptor *sortScriptor;
    BOOL DescriptOrScript;
    
}

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void)awakeFromNib
{
    [super awakeFromNib];
    sortDescriptor = [[NSSortDescriptor alloc]initWithKey:@"score" ascending:NO];
    sortScriptor = [[NSSortDescriptor alloc]initWithKey:@"score" ascending:YES];
    self.studentList = [[[NSMutableArray alloc]init]autorelease];
    NSLog(@"刚刚要开始 %@",[CoreDataManager defaultManager].theOne);
    //    [self.studentList addObjectsFromArray:[self.teacher.studentList allObjects]];
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    NSLog(@"初始化 %@",self.sortOnOrOff);
    DescriptOrScript = [self.teacher.sortOrNot boolValue];
    NSLog(@"判断前%d",DescriptOrScript);
//    if ([[CoreDataManager defaultManager].theOne isEqualToString:@"YES"]) {
        if (DescriptOrScript == YES) {
            
            [self.studentList sortUsingDescriptors:@[sortDescriptor]];
            
        }else{
            [self.studentList sortUsingDescriptors:@[sortScriptor]];
        }
        [self.tableView reloadData];
//    }
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    // Return the number of rows in the section.
    return [self.studentList count] + 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"studentCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    if (indexPath.row == self.studentList.count) {
        UILabel *label = [[UILabel alloc]init];
        label.bounds = cell.bounds;
        label.center = CGPointMake(CGRectGetMidX(cell.bounds), CGRectGetMidY(cell.bounds));
        label.text = @"添加学生";
        label.textAlignment = NSTextAlignmentCenter;
        label.tag = 1001;
        [[cell viewWithTag:1001] removeFromSuperview];
        [cell addSubview:label];
        [label release];
    }else{
        //        if (cell.textLabel.text != nil) {
        [[cell viewWithTag:1001] removeFromSuperview];
        
        //        }
        
        Student *student = self.studentList[indexPath.row];
        cell.textLabel.text = student.sname;
        cell.detailTextLabel.text = [student.score description];
        
    }
    
    return cell;
}


- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}



- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        
//        [[CoreDataManager defaultManager]deleteStudent:[self.studentList objectAtIndex:indexPath.row]];
        [self.teacher removeStudentListObject:[self.studentList objectAtIndex:indexPath.row]];
        

        [self.studentList removeObjectAtIndex:indexPath.row];
        
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
    
}


/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
 {
 }
 */

/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     [detailViewController release];
     */
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.row == self.studentList.count) {
//        [CoreDataManager defaultManager].theOne = @"NO";
        Student *student = [[CoreDataManager defaultManager]createdStudent];
        [self.studentList addObject:student];
        [self.teacher addStudentListObject:student];

        student.sname = [NSString stringWithFormat:@"%d",self.studentList.count];
        NSInteger score = arc4random() % 100 + 1;
        student.score = @(score);
        NSInteger row = self.studentList.count - 1;
        
        NSIndexPath *indexPath = [NSIndexPath indexPathForItem:row inSection:0];
        [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    }
    
}

- (IBAction)didClickSelect:(UIBarButtonItem *)sender {
//    [CoreDataManager defaultManager].theOne = @"YES";
    
    NSLog(@"排序号 %@",[CoreDataManager defaultManager].theOne);
    DescriptOrScript = !DescriptOrScript;
    self.teacher.sortOrNot = @(DescriptOrScript);
    NSLog(@"%d",DescriptOrScript);
//    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc]initWithKey:@"score" ascending:NO];
//    NSSortDescriptor *sortScriptor = [[NSSortDescriptor alloc]initWithKey:@"score" ascending:YES];

    if (DescriptOrScript == YES) {
        
//        [self.studentList removeAllObjects];
        [self.studentList sortUsingDescriptors:@[sortDescriptor]];
        
    }else{
        
        [self.studentList sortUsingDescriptors:@[sortScriptor]];
//        [self.studentList removeAllObjects];
//        [self.studentList addObjectsFromArray:basicStudentsList];
    }
    [self.tableView reloadData];
    
    
}

@end


