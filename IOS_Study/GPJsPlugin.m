//
//  GPJsPlugin.m
//  IOS_Study
//
//  Created by guo peng on 13-3-14.
//  Copyright (c) 2013年 __MyCompanyName__. All rights reserved.
//

#import "GPJsPlugin.h"

@implementation GPJsPlugin
+ (void) test:(NSDictionary *)param :(UIWebView *)webview{
    NSLog(@"222");
    NSString *aa = [param objectForKey:@"fn"];
    NSLog(@"exec: %@,function: %@ ",[param objectForKey:@"name"],[param objectForKey:@"fn"]);
    
    [webview stringByEvaluatingJavaScriptFromString:[[NSString alloc] initWithFormat:@"(%@)()",[param objectForKey:@"fn"]]];
}
@end
