//
//  GPViewController.m
//  IOS_Study
//
//  Created by guo peng on 13-2-21.
//  Copyright (c) 2013年 __MyCompanyName__. All rights reserved.
//

#import "GPViewController.h"
#import "GPStaticViewController.h"
#import "GPGroupTableViewController.h"
#import "GPHttpViewController.h"
#import "GPSinaWeiboViewController.h"

@interface GPViewController ()

@end

@implementation GPViewController

@synthesize controllers;

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
    self.title = @"功能页";
    
    NSMutableArray *array = [[NSMutableArray alloc] init];
    
    GPStaticViewController *staticTable = [[GPStaticViewController alloc] init];
    staticTable.title=@"静态表格";
    [array addObject:staticTable];
    
    GPGroupTableViewController *groupTable=[[GPGroupTableViewController alloc] initWithStyle:UITableViewStyleGrouped];
    groupTable.title=@"分组表格";
    [array addObject:groupTable];    
    
    GPHttpViewController *httpController = [[GPHttpViewController alloc] init];
    httpController.title = @"http请求及json解析";
    [array addObject:httpController];
    
    GPSinaWeiboViewController *sinaWeiboController = [[GPSinaWeiboViewController alloc] init];
    sinaWeiboController.title = @"sina 微博";
    [array addObject:sinaWeiboController];
    
    self.controllers = array;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return YES;
}

#pragma mark - Table view data source

//共有几个区域
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

//获取行总数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.controllers count];
}

//构造单元格
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"StaticCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if(cell==nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    NSInteger rowIdx = [indexPath row];
    UIViewController *tableController = [self.controllers objectAtIndex:rowIdx];
    cell.textLabel.text = tableController.title;
    
    return cell;
}


//选中行操作
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSInteger rowIdx = [indexPath row];
    UIViewController *tableController = [controllers objectAtIndex:rowIdx];
    [self.navigationController pushViewController:tableController animated:YES];
    
    
  
}

@end
