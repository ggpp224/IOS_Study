//
//  GPWebViewController.m
//  IOS_Study
//
//  Created by guo peng on 13-3-11.
//  Copyright (c) 2013年 __MyCompanyName__. All rights reserved.
//

#import "GPWebViewController.h"


@interface GPWebViewController ()

@end

@implementation GPWebViewController

@synthesize webview;
@synthesize delegate;

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
    delegate = [[GPWebViewDelegate alloc] init];
    CGRect screenFrame = [UIScreen mainScreen].bounds; //屏幕大小

	webview = [[UIWebView alloc] initWithFrame:screenFrame];
    [webview setDelegate:delegate];
    [self.view addSubview:webview];
    
    //NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.baidu.com"]];
    //    NSString *resPath = [bundle resourcePath];
    //    NSString *filePath = [resPath stringByAppendingPathComponent:@"index.html"];
    //    [self.view addSubview:webview];
    //    
    //    [webview loadHTMLString:[NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:nil] baseURL:[NSURL fileURLWithPath:[bundle bundlePath]]];
  //[webview loadRequest:request];
    
    NSBundle *bundle = [NSBundle mainBundle];
    NSString *filePath = [bundle pathForResource:@"index" ofType:@"html" inDirectory:@"www"];
    NSURL *url = [NSURL fileURLWithPath:filePath];
    [webview loadRequest:[NSURLRequest requestWithURL:url]];
   
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
