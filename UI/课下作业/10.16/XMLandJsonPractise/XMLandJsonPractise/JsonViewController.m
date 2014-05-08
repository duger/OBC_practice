//
//  JsonViewController.m
//  XMLandJsonPractise
//
//  Created by Duger on 13-10-16.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#import "JsonViewController.h"
#import "Citys.h"

#define kCityURL @"http://www.google.com/ig/cities?hl=en&country=cn&output=json"
#define wCityName @"name"
#define wLongitude @"longitude_e6"
#define wlatitude @"latitude_e6"

@interface JsonViewController ()

@end

@implementation JsonViewController
{
    NSMutableData *mutableData;
    NSMutableArray *cities;
}

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [NSURLConnection sendAsynchronousRequest:[NSURLRequest requestWithString:kCityURL] queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *error) {
        NSString *content = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
//        NSLog(@"%@",content);
        content = [content stringByReplacingOccurrencesOfString:@"code:" withString:@"\"code\":"];
        content = [content stringByReplacingOccurrencesOfString:@"name" withString:@"\"name\""];
        content = [content stringByReplacingOccurrencesOfString:@"lat" withString:@"\"lat\""];
        content = [content stringByReplacingOccurrencesOfString:@"lon" withString:@"\"lon\""];
        content = [content stringByReplacingOccurrencesOfString:@"cities" withString:@"\"cities\""];
        content = [content stringByReplacingOccurrencesOfString:@"selected" withString:@"\"selected\""];
        
        
        NSLog(@"%@",content);
        NSData *tempdata = [content dataUsingEncoding:NSUTF8StringEncoding];
        NSDictionary *cityDic = [NSJSONSerialization JSONObjectWithData:tempdata options:NSJSONReadingMutableContainers error:&error];
        
        NSLog(@"字典字典%@",cityDic);
        NSArray *tempArr = [NSArray arrayWithArray:[cityDic objectForKey:@"cities"]];
        for (NSDictionary *cityItem in tempArr) {
            Citys *city = [[Citys alloc]init];
            city.cityName = [cityItem objectForKey:wCityName];
            city.klatitude = [cityItem objectForKey:wlatitude];
            city.klongitude = [cityItem objectForKey:wLongitude];
//            NSLog(@"%@",city.cityName);
            [cities addObject:city];
            [city release];
        }
        
        [self.tableView reloadData];
        }];
        

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
    return [cities count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    Citys *city = [cities objectAtIndex:indexPath.row];
    cell.textLabel.text = city.cityName;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"东经%@ 西经%@",city.klongitude,city.klatitude];
    
    
    
    
    return cell;
}

#pragma mark - URLConnection Delegate
- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    //在接受服务器应答的时候，如果发送网络请求使用的是http协议，则HSURLResponse这个数据类型的返回参数，一定是她的一个子类的实例对象，这个子类是NSHTTPPURLResponse
    NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
    //网络请求有很多种协议，不止http，列如ftp等等
    //http协议请求服务器，获得的服务器应答是固定格式的，而且是很常见的，可以通过应答的某些header字段获取想要的值，如文件大小
    //对应的key,同样是response的一个headerField
    //虽然request和response的headerField中同样包含，列如Content-Length 和Content-Type等相同的字符串的字段，但是代表的含义是完全不同的。
    
    NSLog(@"字典里有啥呢%@",[[httpResponse allHeaderFields]description]);
    mutableData = [[NSMutableData alloc]init];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [mutableData appendData:data];
    NSLog(@"数据数据Data %@",mutableData);
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    
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
