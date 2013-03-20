//
//  GPWebViewGap.m
//  IOS_Study
//
//  Created by guo peng on 13-3-19.
//  Copyright (c) 2013年 __MyCompanyName__. All rights reserved.
//

#import "GPWebViewGap.h"

@implementation GPWebViewGap
//@synthesize webview;
-(GPWebViewGap *) initWith:(UIWebView *) myWebview{
    self = [super init];
    if(self){
        webview = myWebview;
    }
    return self;
}

- (void) writeJavascriptWithParams:(NSDictionary *) params response:(NSDictionary *) response{
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:response options:NSJSONWritingPrettyPrinted error:nil];
    NSString *jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    NSString *fnParamsValueString = [[NSString alloc] initWithFormat:@";var %@ = %@",[params objectForKey:@"fnParamsName"],jsonString];
    NSString *scriptString = [[NSString alloc] initWithFormat:@"(function(){%@;(%@)(%@)})()",fnParamsValueString,[params objectForKey:@"fn"],[params objectForKey:@"fnParamsName"]];
    
    [webview stringByEvaluatingJavaScriptFromString:scriptString];
}
@end
