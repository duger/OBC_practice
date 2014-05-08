//
//  ChatViewController.m
//  InstantMessager
//
//  Created by Duger on 13-12-20.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#import "ChatViewController.h"


@interface ChatViewController ()

@end

@implementation ChatViewController

-(id)initWithStyle:(UITableViewStyle)style buddyName:(NSString *)buddyName
{
    self = [self initWithStyle:style];
    if (self) {
        self.title = buddyName;
    }
    return self;
}


- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
        self.messageArray = [NSMutableArray array];
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
    
    [[XMPPManager defaultManager]setDelegate:self];
    
    UIBarButtonItem *rightBarButton = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(sendText:)];
    self.navigationItem.rightBarButtonItem = rightBarButton;
    
}



-(void)sendText:(id)sender
{
    MessageItem *message = [[MessageItem alloc]init];
    XMPPMessage *newMessage = [XMPPMessage messageWithType:@"chat" to:[XMPPJID jidWithString:[NSString stringWithFormat:@"%@@lanouserver",self.title]]];
    [newMessage addBody:@"呵呵~"];
    NSLog(@"%@",[newMessage description]);
    [[[XMPPManager defaultManager] xmppStream] sendElement:newMessage];
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
    return self.messageArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    MessageItem *newItem = [self.messageArray objectAtIndex:indexPath.row];
    cell.textLabel.text = newItem.messageText;
    if (newItem.isComposing) {
        cell.textLabel.textAlignment = NSTextAlignmentLeft;
    }else
        cell.textLabel.textAlignment = NSTextAlignmentRight;
    
    return cell;
}



#pragma mark - XMPPManager Delegate -
-(void)xmppManager:(XMPPManager *)manager didReceiveNewMessage:(MessageItem *)message
{
    [self.messageArray addObject:message];
    [self.tableView reloadData];
    NSIndexPath *lastIndexPath = [NSIndexPath indexPathForRow:self.messageArray.count - 1 inSection:0];
    [self.tableView scrollToRowAtIndexPath:lastIndexPath atScrollPosition:UITableViewScrollPositionBottom animated:YES];
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
