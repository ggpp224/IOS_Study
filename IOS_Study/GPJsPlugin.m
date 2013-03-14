//
//  GPJsPlugin.m
//  IOS_Study
//
//  Created by guo peng on 13-3-14.
//  Copyright (c) 2013年 __MyCompanyName__. All rights reserved.
//

#import "GPJsPlugin.h"

@implementation GPJsPlugin
+ (void) test:(NSDictionary *)param{
    NSLog(@"exec: %@ ",[param objectForKey:@"name"]);
}
@end
