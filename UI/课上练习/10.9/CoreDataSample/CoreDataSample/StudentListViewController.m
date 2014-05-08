//
//  StudentListViewController.m
//  CoreDataSample
//
//  Created by Duger on 13-10-9.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#import "StudentListViewController.h"
#import "Student.h"

@interface StudentListViewController ()

@end

@implementation StudentListViewController

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
    NSMutableArray *temp = [[NSMutableArray alloc]init];
    self.studentsList = temp;
    [temp release];
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
    NSLog(@"返回数量%d",self.studentsList.count);
    return self.studentsList.count + 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"studentCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    if (indexPath.row == self.studentsList.count) {
        UILabel *label = [[UILabel alloc] init];
        label.bounds = cell.bounds;
        label.center = CGPointMake(CGRectGetMidX(cell.bounds), CGRectGetMidY(cell.bounds));
        label.textAlignment = NSTextAlignmentCenter;
        label.text = @"添加学生";
        label.tag = 1001;
        [cell addSubview:label];
        [label release];
    }else
    {
        [[cell viewWithTag:1001] removeFromSuperview];
        Student *student = self.studentsList[indexPath.row];
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
        [tableView beginUpdates];
        Student *student = [self.studentsList objectAtIndex:indexPath.row];
        [self.teacher removeStudentListObject:student];
        [[CoreDataManager intence]deleteStudent:student];
        
        [self.studentsList removeObjectAtIndex:indexPath.row];
        
        NSLog(@"删除时%d",self.studentsList.count);
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        [tableView endUpdates];
    }
    
}
/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

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
    if (indexPath.row == self.studentsList.count) {
        Student *student = [[CoreDataManager intence] createdStudent];
        [self.studentsList addObject:student];
        [self.teacher addStudentListObject:student];
        
        student.sname = [NSString stringWithFormat:@"%d",self.studentsList.count];
        NSInteger random = arc4random() % 1000;
        CGFloat score = random / 10.0f;
        
        student.score = @(score);
        
        NSInteger row = self.studentsList.count -1 ;
        NSInteger section = 0;
        
        NSIndexPath *indexPath = [NSIndexPath indexPathForItem:row inSection:section];
        [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
        
    }
}

- (IBAction)didClickSort:(UIBarButtonItem *)sender {
    //NSSortDescriptor
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"score" ascending:NO];
    [self.studentsList sortUsingDescriptors:@[sortDescriptor]];
    //
    
    [self.tableView reloadData];
}
@end
