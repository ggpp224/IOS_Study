//
//  GPHttpClient.m
//  IOS_Study
//
//  Created by guo peng on 13-2-25.
//  Copyright (c) 2013年 __MyCompanyName__. All rights reserved.
//  http请求封装

#import "GPHttpClient.h"

@implementation GPHttpClient

@synthesize async;

// 异步json post请求
+ (void)post: (NSString *)url :(NSDictionary *)params completionHandler:(void(^)(NSURLResponse*, NSData*, NSError*)) handler{
    NSURL *postUrl = [NSURL URLWithString:url];
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:params options:NSJSONWritingPrettyPrinted error:nil];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:postUrl];
    [request addValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [request setHTTPMethod:@"POST"];
    [request setHTTPBody:jsonData];
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    [NSURLConnection sendAsynchronousRequest:request queue:queue completionHandler:^(NSURLResponse *response, NSData *data, NSError *error) {
        handler(response,data,error);
    }];
}

//异步get方法
+ (void) get: (NSString *)url completionHandler:(void(^)(NSURLResponse*, NSData*, NSError*)) handler{
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:[NSURL URLWithString:url]];
    NSOperationQueue *operationQueue = [[NSOperationQueue alloc] init];
    [NSURLConnection sendAsynchronousRequest:request queue:operationQueue completionHandler:^(NSURLResponse *response, NSData *data, NSError *error){
        handler(response,data,error);
    }];
}

//同步get方法
+ (NSDictionary *) syncGet:(NSString *) url{
   // NSDictionary *dict = [[NSDictionary alloc] init];
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:url]];
    NSURLResponse *response=nil;
    NSError *error = nil;
    NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    NSDictionary *dict = [[NSDictionary alloc] initWithObjectsAndKeys:data,@"data",response,@"response",error,@"error", nil];
    return dict;
    
}

//周步post请求
+ (NSDictionary *) syncPost: (NSString *)url :(NSDictionary *)params{
    
}

@end
