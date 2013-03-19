//
//  GPTestJs.m
//  IOS_Study
//
//  Created by guo peng on 13-3-19.
//  Copyright (c) 2013年 __MyCompanyName__. All rights reserved.
//

#import "GPTestJs.h"

@implementation GPTestJs




- (void) test:(NSDictionary *)param{
   //
    NSLog(@"exec:function: %@ ",[param objectForKey:@"fn"]);
    NSString *fnParamsValueString = [[NSString alloc] initWithFormat:@";var %@ = {a:\"我是谁\"}",[param objectForKey:@"fnParamsName"]];
    NSString *scriptString = [[NSString alloc] initWithFormat:@"(function(){%@;(%@)(%@)})()",fnParamsValueString,[param objectForKey:@"fn"],[param objectForKey:@"fnParamsName"]];
    NSLog(scriptString);
    
    [webview stringByEvaluatingJavaScriptFromString:scriptString];
}

@end
