//
//  GPSocketViewController.h
//  IOS_Study
//
//  Created by guo peng on 13-3-21.
//  Copyright (c) 2013年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AsyncSocket.h"

@interface GPSocketViewController : UIViewController
@property (strong,nonatomic) UIButton *btn;
@property (strong,nonatomic) AsyncSocket *asyncSocket;
@end
