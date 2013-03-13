//
//  GPWebViewController.h
//  IOS_Study
//
//  Created by guo peng on 13-3-11.
//  Copyright (c) 2013年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GPWebViewDelegate.h"

@interface GPWebViewController : UIViewController
@property (strong, nonatomic) UIWebView *webview;
@property (nonatomic, strong) GPWebViewDelegate *delegate;
@end
