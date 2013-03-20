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
    NSDictionary *dict = [[NSDictionary alloc] initWithObjectsAndKeys:@"我是谁啊",@"a",@"eers",@"b",nil];
    [self writeJavascriptWithParams:param response:dict];
    NSLog(@"execed");
}

- (void) alert:(NSDictionary *)param{
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:[param objectForKey:@"title"] message:[param objectForKey:@"msg"] delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil];
    [alert show];
}

@end
