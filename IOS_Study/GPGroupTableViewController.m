//
//  GPGroupTableViewController.m
//  IOS_Study
//
//  Created by guo peng on 13-2-21.
//  Copyright (c) 2013年 __MyCompanyName__. All rights reserved.
//

#import "GPGroupTableViewController.h"

@interface GPGroupTableViewController ()

@end

@implementation GPGroupTableViewController

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

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    // Configure the cell...
    if(cell==nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    cell.textLabel.text = [[NSString alloc] initWithFormat:@"Cell %i",indexPath.row];
    return cell;
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
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
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
     */
}

//注释部分为可以为任意控件
/*

- (UIView *) tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *result = nil;
    UILabel *label = nil;
    if(section == 0){
        label = [[UILabel alloc] initWithFrame:CGRectZero];
        label.text = @"section1 Header";
        [label sizeToFit];
        label.backgroundColor = [UIColor clearColor];
        label.frame = CGRectMake(label.frame.origin.x+10.0f, 5.0f, label.frame.size.width, label.frame.size.height);
        result = [[UIView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, label.frame.size.height, label.frame.size.width+10.0f)];
        [result addSubview:label];
    }
    return result;
}

- (UIView *) tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    UIView *result = nil;
    UILabel *label = nil;
    if(section == 0){
        label = [[UILabel alloc] initWithFrame:CGRectZero];
        label.text = @"section1 Fotter";
        [label sizeToFit];
        label.backgroundColor = [UIColor clearColor];
        label.frame = CGRectMake(label.frame.origin.x+10.0f, 5.0f, label.frame.size.width, label.frame.size.height);
        result = [[UIView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, label.frame.size.height, label.frame.size.width+10.0f)];
        [result addSubview:label];
        
    }
    return result;
}


- (CGFloat) tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    CGFloat height = 0.0f;
    if(section==0){
        height = 30.0f;
    }
    return height;
}

- (CGFloat) tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    CGFloat height = 0.0f;
    if(section==0){
        height = 30.0f;
    }
    return height;
}
 */

-(NSString *) tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section{
    NSString *str = nil;
    if(section==0){
        str = @"section1 Fotter";
    }
    return str;
}

-(NSString *) tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    NSString *str = nil;
    if(section==0){
        str = @"section1 Header";;
    }
    return str;
}
@end
