//
//  GPWebViewDelegate.m
//  IOS_Study
//
//  Created by guo peng on 13-3-11.
//  Copyright (c) 2013年 __MyCompanyName__. All rights reserved.
//

#import "GPWebViewDelegate.h"

@implementation GPWebViewDelegate
@synthesize activityIndicator;

- (void) webViewDidStartLoad:(UIWebView *)webView{
    NSLog(@"started loaded...");
    UIView *maskView = [[UIView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    [maskView setTag:108];
    [maskView setBackgroundColor:[UIColor blackColor]];
    [maskView setAlpha:0.5];
    [webView addSubview:maskView];
    
    activityIndicator = [[UIActivityIndicatorView alloc] initWithFrame:CGRectMake(0, 0, 32, 32)];
    [activityIndicator setCenter:webView.center];
    [activityIndicator setActivityIndicatorViewStyle:UIActivityIndicatorViewStyleWhite];
    [maskView addSubview:activityIndicator];
    [activityIndicator startAnimating];
    
}

- (void) webViewDidFinishLoad:(UIWebView *)webView{
    NSLog(@"finsih loaded...");
    [activityIndicator stopAnimating];
    UIView *maskView = (UIView *)[webView viewWithTag:108];
    [maskView removeFromSuperview];
}

- (void) webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error{
    NSLog(@"load error : %@", error);
    [activityIndicator stopAnimating];
    UIView *maskView = (UIView *)[webView viewWithTag:108];
    [maskView removeFromSuperview];
}

@end
