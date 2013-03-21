
//
//  GPTabBarViewController.m
//  IOS_Study
//
//  Created by guo peng on 13-3-21.
//  Copyright (c) 2013年 __MyCompanyName__. All rights reserved.
//

#import "GPTabBarViewController.h"

@interface GPTabBarViewController ()

@end

@implementation GPTabBarViewController

@synthesize tabBarController;
@synthesize firstTabBarController;
@synthesize secondTabBarController;

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
    self.tabBarController = [[UITabBarController alloc] init];
	self.firstTabBarController = [[GPFirstTabBarViewController alloc] init];
    self.secondTabBarController=[[GPSecondTabBarViewController alloc] init];
    NSArray *controllers = [[NSArray alloc] initWithObjects:self.firstTabBarController, self.secondTabBarController, nil];
    [self.tabBarController setViewControllers:controllers];
    [self.view addSubview:self.tabBarController.view];
    
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
