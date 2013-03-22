//
//  GPSocketViewController.m
//  IOS_Study
//
//  Created by guo peng on 13-3-21.
//  Copyright (c) 2013年 __MyCompanyName__. All rights reserved.
//

#import "GPSocketViewController.h"

#define HOST @"10.10.12.78"
#define PORT 7003

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
    asyncSocket = [[AsyncSocket alloc] initWithDelegate:self];
    NSError *err = nil;
    if(![asyncSocket connectToHost:HOST onPort:PORT error:&err]){
        NSLog(@"connect err");
    }
    NSData* aData= [@"test data" dataUsingEncoding: NSUTF8StringEncoding];
    //连接成功后需手动调用一下readDataWithTimeout
    [asyncSocket readDataWithTimeout:-1 tag:0];
    
    [asyncSocket writeData:aData withTimeout:-1 tag:1];
    
    NSLog(@"ssss");
}


-(void) onSocket:(AsyncSocket *)sock didWriteDataWithTag:(long)tag{
    
    NSLog(@"thread(%),onSocket:%p didWriteDataWithTag:%ld",[[NSThread currentThread] name],sock,tag); 
}


- (void)onSocket:(AsyncSocket *)sock didReadData:(NSData *)data withTag:(long)tag{
    NSString* aStr = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    NSLog(@"Hava received datas is :%@",aStr);

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
