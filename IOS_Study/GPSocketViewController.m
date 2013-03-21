//
//  GPSocketViewController.m
//  IOS_Study
//
//  Created by guo peng on 13-3-21.
//  Copyright (c) 2013年 __MyCompanyName__. All rights reserved.
//

#import "GPSocketViewController.h"


@interface GPSocketViewController (){
    
}

@end

@implementation GPSocketViewController
@synthesize btn;
@synthesize asyncSocket;
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
    btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn.frame = CGRectMake(110, 20, 100, 37);
    [btn setTitle:@"链接" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:btn];
    
	// Do any additional setup after loading the view.
}

-(void) buttonPressed:(UIButton *)sender{
    NSLog(@"ssss");
    asyncSocket = [[AsyncSocket alloc] initWithDelegate:self];
    NSError *err = nil;
    if(![asyncSocket connectToHost:@"10.10.12.78" onPort:7003 error:&err]){
        NSLog(@"connect err");
    }
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
