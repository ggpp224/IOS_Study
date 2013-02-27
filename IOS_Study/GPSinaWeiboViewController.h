//
//  GPSinaWeiboViewController.h
//  IOS_Study
//
//  Created by guo peng on 13-2-26.
//  Copyright (c) 2013年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SinaWeibo.h"
#import "SinaWeiboRequest.h"


#define kAppKey             @"4286222588"
#define kAppSecret          @"6f2536acc237bc35c80ac3dccec68b21"
#define kAppRedirectURI     @"http://qq.com"

@interface GPSinaWeiboViewController : UIViewController <SinaWeiboDelegate, SinaWeiboRequestDelegate>
{
    UIButton *loginButton;
    UIButton *logoutButton;
    UIButton *infoButton;
    
    NSDictionary *userInfo;
    NSArray *statuses;
    NSString *postStatusText;
    NSString *postImageStatusText;
}

@property (strong,nonatomic) SinaWeibo *sinaweibo;

@end
