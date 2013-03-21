//
//  GPTabBarViewController.h
//  IOS_Study
//
//  Created by guo peng on 13-3-21.
//  Copyright (c) 2013年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GPFirstTabBarViewController.h"
#import "GPSecondTabBarViewController.h"

@interface GPTabBarViewController : UIViewController
@property (strong,nonatomic) UITabBarController *tabBarController;
@property (strong,nonatomic) GPFirstTabBarViewController *firstTabBarController;
@property (strong,nonatomic) GPSecondTabBarViewController *secondTabBarController;
@end
