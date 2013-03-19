//
//  GPWebViewGap.h
//  IOS_Study
//
//  Created by guo peng on 13-3-19.
//  Copyright (c) 2013年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GPWebViewGap : NSObject{
    UIWebView *webview;
}
//@property (strong,nonatomic) UIWebView *webview;
- (GPWebViewGap *) initWith:(UIWebView *) myWebview;
@end
