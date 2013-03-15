//
//  GPWebViewDelegate.m
//  IOS_Study
//
//  Created by guo peng on 13-3-11.
//  Copyright (c) 2013年 __MyCompanyName__. All rights reserved.
//

#import "GPWebViewDelegate.h"
#import "GPJsPlugin.h"

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

- (BOOL) webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType{
    NSString *urlString = [[[request URL] absoluteString] stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSRange range = [urlString rangeOfString:@"cmd:"];
    if(range.length>0){
        NSString *paramsStr = [urlString substringFromIndex:range.length];   
        NSDictionary *params = [NSJSONSerialization JSONObjectWithData:[paramsStr dataUsingEncoding:NSUTF8StringEncoding]  options:kNilOptions error:nil]; 
        NSString *className = [params objectForKey:@"class"];
        NSString *methodName = [params objectForKey:@"method"];
        NSDictionary *paramsDict = (NSDictionary *)[params objectForKey:@"params"];
        
        id PluginClass = NSClassFromString(className);
        NSLog(@"%@",paramsStr);
        NSLog(@"%@",[paramsDict objectForKey:@"fn"]);
        [PluginClass performSelector:NSSelectorFromString(methodName) withObject:paramsDict withObject:webView];
        
        //NSLog(@"aa: %@",[params objectForKey:@"class"]);
        return NO;
    }
    
    
   // NSArray *urlArr = [urlString componentsSeparatedByString:@":"];
//    if([urlArr count]&&[[urlArr objectAtIndex:0] isEqualToString:@"cmd"]){
//        NSString *functionString = [urlArr objectAtIndex:1];
//     //   NSLog(functionString);
//        
////        return NO;
//    }
    
    return YES;
}

@end
