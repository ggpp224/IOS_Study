//
//  GPSecondTabBarViewController.m
//  IOS_Study
//
//  Created by guo peng on 13-3-21.
//  Copyright (c) 2013年 __MyCompanyName__. All rights reserved.
//

#import "GPSecondTabBarViewController.h"

@interface GPSecondTabBarViewController ()

@end

@implementation GPSecondTabBarViewController

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
	self.view.backgroundColor = [UIColor blueColor];
    self.title=@"second";
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
