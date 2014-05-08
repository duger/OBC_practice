//
//  TeacherListViewController.m
//  CoreDataPractice
//
//  Created by Duger on 13-10-11.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#import "TeacherListViewController.h"
//#import "Teacher.h"
#import "StudentsListViewController.h"

@interface TeacherListViewController ()

@end

@implementation TeacherListViewController
{
    NSMutableArray *teacherList;
    
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
    teacherList = [[NSMutableArray alloc]init]; 
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [teacherList addObjectsFromArray:[[CoreDataManager defaultManager]allTeacher]];
    [self.tableView reloadData];
}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [teacherList removeAllObjects];
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
    [teacherList release];
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    // Return the number of rows in the section.
    return [teacherList count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"teacherCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    Teacher *teacher = teacherList[indexPath.row];
    NSInteger count = [teacher.studentList count];
    cell.textLabel.text = teacher.tName;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%d",count];
    
    return cell;
}


- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{

    return YES;
}



- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        Teacher *teacher = [teacherList objectAtIndex:indexPath.row];
        NSArray *studentList = [teacher.studentList allObjects];
        for (Student *student in studentList) {
            [[CoreDataManager defaultManager]deleteStudent:student];
        }
        [[CoreDataManager defaultManager]deleteTeacher:teacher];
        [teacherList removeObjectAtIndex:indexPath.row];
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

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(Teacher*)sender
{
    StudentsListViewController *sVC = nil;
    sVC = segue.destinationViewController;
    sVC.teacher = sender;
    [sVC.studentList addObjectsFromArray:[sender.studentList allObjects]];
}

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
    Teacher *teacher = teacherList[indexPath.row];
    [self performSegueWithIdentifier:@"toStudents" sender:teacher];
}

- (IBAction)didClickCreate:(UIBarButtonItem *)sender {
    Teacher *teacher = [[CoreDataManager defaultManager]createdTeacher];
    teacher.tName = @"潇浩";
    [teacherList addObject:teacher];
    
    NSInteger row = [teacherList count] - 1;
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:row inSection:0];
    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
}
@end
