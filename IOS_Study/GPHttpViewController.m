//
//  GPHttpViewController.m
//  IOS_Study
//
//  Created by guo peng on 13-2-22.
//  Copyright (c) 2013年 __MyCompanyName__. All rights reserved.
//

#import "GPHttpViewController.h"
#import "GPHttpClient.h"

@interface GPHttpViewController ()

@end

@implementation GPHttpViewController
@synthesize syncBtn;
@synthesize asyncBtn;
@synthesize postBtn;
@synthesize wrapBtn;
@synthesize wrapGetBtn;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //创建button
    syncBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    syncBtn.frame = CGRectMake(110.0f, 20.0f, 100.0f, 37.0f);
    [self.syncBtn setTitle:@"同步请求" forState:UIControlStateNormal];
    [syncBtn addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:syncBtn];
    
    self.asyncBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    self.asyncBtn.frame = CGRectMake(110.0f, 70.0f, 100.0f, 37.0f);
    [self.asyncBtn setTitle:@"异步请求" forState:UIControlStateNormal];
    [self.asyncBtn addTarget:self action:@selector(asyncBtnPressed:) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:asyncBtn];
    
    self.postBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    self.postBtn.frame = CGRectMake(110.0f, 120.0f, 100.0f, 37.0f);
    [self.postBtn setTitle:@"POST请求" forState:UIControlStateNormal];
    [self.postBtn addTarget:self action:@selector(postBtnPressed:) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:self.postBtn];
    
    self.wrapBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    self.wrapBtn.frame = CGRectMake(110.0f, 170.0f, 100.0f, 37.0f);
    [self.wrapBtn setTitle:@"封装POST请求" forState:UIControlStateNormal];
    [self.wrapBtn addTarget:self action:@selector(warpBtnPressed:) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:self.wrapBtn];
    
    self.wrapGetBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    self.wrapGetBtn.frame = CGRectMake(110.0f, 220.0f, 100.0f, 37.0f);
    [self.wrapGetBtn setTitle:@"封装GET请求" forState:UIControlStateNormal];
    [self.wrapGetBtn addTarget:self action:@selector(warpGetBtnPressed:) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:self.wrapGetBtn];
    
    
    
}

//同步按钮事件
-(void) buttonPressed:(UIButton *)sender{
    NSLog(@"pressed");
    NSURL *url = [NSURL URLWithString:@"http://localhost/test.php"];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    [request setHTTPMethod:@"GET"];
    NSHTTPURLResponse *response = nil;
    //发送请求
    NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:nil];
   // NSError *error;
    
    NSString *respString = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
    //将返回的json数据构造成dictionary
   // NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:&error];

    NSLog(@"返回状态：%d,内容：%@",[response statusCode],respString);
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"返回内容" message:respString delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil];
    [alert show];
    
} 

//异步按钮事件
-(void) asyncBtnPressed:(UIButton *) sender{
    UIActivityIndicatorView *activityView = [[UIActivityIndicatorView alloc] initWithFrame:CGRectMake(150, 30, 100, 100)];
    [activityView setBackgroundColor:[UIColor lightGrayColor]];
    [self.view addSubview:activityView];
    [activityView startAnimating];
    
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:[NSURL URLWithString:@"http://localhost/async.php"]];
    NSOperationQueue *operationQueue = [[NSOperationQueue alloc] init];
    [NSURLConnection sendAsynchronousRequest:request queue:operationQueue completionHandler:^(NSURLResponse *response, NSData *data, NSError *error) {
        if(error){
            NSLog(@"error:%@",error);
        }
        
        [activityView stopAnimating];
        NSString *responseStr = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        NSLog(@"response:%@",responseStr);
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"async" message:responseStr delegate:nil cancelButtonTitle:@"ok" otherButtonTitles: nil];
        [alert show];
    }];
}


//post 请求
-(void) postBtnPressed:(UIButton *)sender{
    NSURL *url = [NSURL URLWithString:@"http://localhost/json.php"];
    NSDictionary *params = [[NSDictionary alloc] initWithObjectsAndKeys:@"111",@"aa",@"222",@"bb", nil];
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:params options:NSJSONWritingPrettyPrinted error:nil];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url];
    [request addValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [request setHTTPMethod:@"POST"];
    [request setHTTPBody:jsonData];
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    [NSURLConnection sendAsynchronousRequest:request queue:queue completionHandler:^(NSURLResponse *response, NSData *data, NSError *error) {
        if(error==nil){
            NSHTTPURLResponse *httpRespsonse = (NSHTTPURLResponse*)response;
            //int code = [httpRespsonse statusCode];
            NSString *respStr = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
            UIAlertView *alert=[[UIAlertView alloc] initWithTitle:@"json" message:respStr delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
            [alert show];
        }else {
            NSLog(@"error:%@",error);
        }
    }];
    
}

//封装post 请求
-(void) warpBtnPressed:(UIButton *)sender{
    NSDictionary *params = [[NSDictionary alloc] initWithObjectsAndKeys:@"111",@"aa",@"222",@"bb",nil];
    [GPHttpClient post:@"http://localhost/json.php" :params completionHandler:^(NSURLResponse *response, NSData *data, NSError *error){
      
        NSHTTPURLResponse* httpResponse = (NSHTTPURLResponse*)response;
        int code = [httpResponse statusCode];
        NSString *respStr = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"json" message:respStr delegate:nil cancelButtonTitle:@"ok" otherButtonTitles:nil];
        [alert show];
        
        NSLog(@"json post status:%d,%a", code,respStr);
    
    }];
    
}

//封装get 请求
-(void) warpGetBtnPressed:(UIButton *)sender{
    [GPHttpClient get: @"http://localhost/async.php" completionHandler:^(NSURLResponse *response, NSData *data, NSError *error) {
        if(error){
            NSLog(@"error:%@",error);
        }
        NSString *responseStr = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        NSLog(@"response:%@",responseStr);
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"async" message:responseStr delegate:nil cancelButtonTitle:@"ok" otherButtonTitles: nil];
        [alert show];
    }];

    
   
    
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
