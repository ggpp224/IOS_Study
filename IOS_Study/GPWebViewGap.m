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
@end
