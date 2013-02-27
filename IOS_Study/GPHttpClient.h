//
//  GPHttpClient.h
//  IOS_Study
//
//  Created by guo peng on 13-2-25.
//  Copyright (c) 2013年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GPHttpClient : NSURLConnection
@property (nonatomic)BOOL async;

+ (void)post: (NSString *)url :(NSDictionary *)params completionHandler:(void(^)(NSURLResponse*, NSData*, NSError*)) handler;
+ (void) get: (NSString *)url completionHandler:(void(^)(NSURLResponse*, NSData*, NSError*)) handler;
@end
