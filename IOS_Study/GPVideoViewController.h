//
//  GPVideoViewController.h
//  IOS_Study
//
//  Created by guo peng on 13-3-7.
//  Copyright (c) 2013年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MediaPlayer/MediaPlayer.h"

@interface GPVideoViewController : UIViewController
@property (nonatomic, strong) MPMoviePlayerController *moviePlayer;
@property (nonatomic, strong) UIButton *playButton;

@end
