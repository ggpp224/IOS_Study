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
  //  NSString *aa = [param objectForKey:@"fn"];
    NSLog(@"exec:function: %@ ",[param objectForKey:@"fn"]);
    NSString *fnParamsValueString = [[NSString alloc] initWithFormat:@";var %@ = {a:\"我是谁\"}",[param objectForKey:@"fnParamsName"]];
    NSString *scriptString = [[NSString alloc] initWithFormat:@"(function(){%@;(%@)(%@)})()",fnParamsValueString,[param objectForKey:@"fn"],[param objectForKey:@"fnParamsName"]];
    NSLog(scriptString);
    [webview stringByEvaluatingJavaScriptFromString:scriptString];
}
@end
