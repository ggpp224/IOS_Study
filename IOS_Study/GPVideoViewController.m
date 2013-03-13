//
//  GPVideoViewController.m
//  IOS_Study
//
//  Created by guo peng on 13-3-7.
//  Copyright (c) 2013年 __MyCompanyName__. All rights reserved.
//

#import "GPVideoViewController.h"

@interface GPVideoViewController ()

@end

@implementation GPVideoViewController

@synthesize moviePlayer;
@synthesize playButton;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self startPlayVideo:nil];
	
}

- (void) startPlayVideo:(id) paramSender{
    NSBundle *mainBundle = [NSBundle mainBundle];
    NSString *urlStr = [mainBundle pathForResource:@"sample_iPod" ofType:@"m4v"];
    NSURL *url = [NSURL fileURLWithPath:urlStr];
    if(self.moviePlayer != nil){
        [self stopPlayingVideo:nil];
    }
    
    self.moviePlayer = [[MPMoviePlayerController alloc] initWithContentURL:url];
    if(self.moviePlayer != nil){
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(videoHasFinishedPlaying:) name:MPMoviePlayerPlaybackDidFinishNotification object:self.moviePlayer];
        self.moviePlayer.scalingMode = MPMovieScalingModeAspectFit;
        [self.moviePlayer play];
        [self.view addSubview:self.moviePlayer.view];
        [self.moviePlayer setFullscreen:YES];
    }else {
        NSLog(@"播放器初始化失败");
    }
}

- (void) stopPlayingVideo:(id) paramSender{
    if(self.moviePlayer != nil){
        [[NSNotificationCenter defaultCenter] removeObserver:self name:MPMoviePlayerPlaybackDidFinishNotification object:self.moviePlayer];
        [self.moviePlayer stop];
        if([self.moviePlayer.view.superview isEqual:self.view]){
            [self.moviePlayer.view removeFromSuperview];
        }
    }
}

- (void) videoHasFinishedPlaying:(NSNotification *) paramNotification{
    NSNumber *reason = [paramNotification.userInfo valueForKey:MPMoviePlayerPlaybackDidFinishReasonUserInfoKey];
    if(reason != nil){
        NSInteger reasonAsInteger = [reason integerValue];
        switch (reasonAsInteger) {
            case MPMovieFinishReasonPlaybackEnded:
                NSLog(@"正常结束");
                break;
            case MPMovieFinishReasonPlaybackError:
                NSLog(@"错误导致结束");
                break;
            case MPMovieFinishReasonUserExited:
                NSLog(@"用户退出播放器");
                break;
            default:
                break;
        }
        NSLog(@"finish reason= %ld",(long)reasonAsInteger);
        [self stopPlayingVideo:nil];
    }
    
}

- (void)viewDidUnload
{
    self.playButton=nil;
    self.moviePlayer=nil;
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
