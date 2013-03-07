//
//  GPWeiboInfoViewController.m
//  IOS_Study
//
//  Created by guo peng on 13-2-27.
//  Copyright (c) 2013年 __MyCompanyName__. All rights reserved.
//  微博信息列表

#import "GPWeiboInfoViewController.h"

@interface GPWeiboInfoViewController ()

@end

@implementation GPWeiboInfoViewController
@synthesize weiboInfo;
@synthesize weiboInfoList;

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

    self.weiboInfoList = [weiboInfo objectForKey:@"statuses"];
    
    
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
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return self.weiboInfoList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
     NSInteger row = [indexPath row];
    // Configure the cell...
    NSDictionary *user = [[self.weiboInfoList objectAtIndex:row] objectForKey:@"user"];
      NSString *infoStr = [user objectForKey:@"description"];
    // NSLog(infoStr);
    if(cell==nil){
        
        cell = [[UITableViewCell alloc] initWithFrame:CGRectZero reuseIdentifier:CellIdentifier];
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectZero];
        label.tag=1;
        label.lineBreakMode = UILineBreakModeWordWrap;
        label.highlightedTextColor = [UIColor whiteColor];
        label.numberOfLines = 0;
        label.opaque = NO;
        label.backgroundColor = [UIColor clearColor];
        
        NSData *imageData = [NSData dataWithContentsOfURL:[NSURL URLWithString:[user objectForKey:@"profile_image_url"]]];
        UIImage *avatar = [[UIImage alloc] initWithData:imageData];
        UIImageView *imageView = [[UIImageView alloc] initWithImage:avatar];
        
        [cell.contentView addSubview:imageView];
        
        [cell.contentView addSubview:label];
    }
    
    UILabel *label = (UILabel *)[cell viewWithTag:1];
    CGRect cellFrame = [cell frame];
    cellFrame.origin = CGPointMake(0,0);
    label.text=infoStr;
    CGRect rect = CGRectInset(cellFrame, 50, 2);
    label.frame = rect;
    [label sizeToFit];
    if(label.frame.size.height>46){
        cellFrame.size.height = 50+label.frame.size.height-46;
        
    }else {
        cellFrame.size.height = 50;
    }
    [cell setFrame:cellFrame];
    return  cell;
        
}




#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 取消选中状态
    [tableView deselectRowAtIndexPath:indexPath animated:NO]; 
    
    
}



-(CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [self tableView:tableView cellForRowAtIndexPath:indexPath];
    return cell.frame.size.height;
}

@end
