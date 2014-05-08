//
//  BuddyListViewController.m
//  InstantMessager
//
//  Created by Duger on 13-12-20.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#import "BuddyListViewController.h"
#import "AddNewBuddyViewController.h"
#import "BuddyItem.h"
#import "ChatViewController.h"

@interface BuddyListViewController ()
//好友列表
@property (nonatomic, strong) NSMutableArray *buddyListArray;

@end

@implementation BuddyListViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
        self.buddyListArray = [NSMutableArray array];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    self.title = @"好友列表";
    UIBarButtonItem *rightBarButtonItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(pushAddNewViewController:)];
    [rightBarButtonItem setTitle:self.title];
    self.navigationItem.rightBarButtonItem = rightBarButtonItem;
    
    [[XMPPManager defaultManager]setDelegate:self];
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)pushAddNewViewController:(id)sender
{
    AddNewBuddyViewController *addNewBuddyVC = [[AddNewBuddyViewController alloc]initWithNibName:@"AddNewBuddyViewController" bundle:nil];
    [self.navigationController pushViewController:addNewBuddyVC animated:YES];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{

    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    // Return the number of rows in the section.
    return [self.buddyListArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    BuddyItem *newItem = [self.buddyListArray objectAtIndex:indexPath.row];
    cell.textLabel.text = [NSString stringWithFormat:@"%@  %@   %@",newItem.buddyName,newItem.buddyStatus,newItem.buddyResource];
    
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    BuddyItem *item = [self.buddyListArray objectAtIndex:indexPath.row];
    ChatViewController *chartVC = [[ChatViewController alloc]initWithStyle:UITableViewStylePlain buddyName:item.buddyName];
    [self.navigationController pushViewController:chartVC animated:YES];
    
}



#pragma mark - XMPPManager Delegate -
-(void)xmppManager:(XMPPManager *)manager didReceiveNewPresenceWithBuddyItem:(BuddyItem *)item
{
    
    for (BuddyItem *newItem in self.buddyListArray) {
        if ([newItem.buddyName isEqualToString:item.buddyName]) {
            newItem.buddyStatus = item.buddyStatus;
            [self.tableView reloadData];
            return;
        }
    }
    [self.buddyListArray addObject:item];
    [self.tableView reloadData];
    
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

/*
#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

 */

@end
