//
//  VideoViewController.m
//  iKTV
//
//  Created by Steve Yeom on 9/30/14.
//  Copyright (c) 2014 2nd Jobs. All rights reserved.
//

#import "VideoViewController.h"

@interface VideoViewController ()
@end

@implementation VideoViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  
  NSString *url = [self loadLastViewedChannel];
  [self playVideoWithURL:url];
  [self.moviePlayer play];
  
  [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(playVideo:) name:@"noti" object:nil];  
}

- (void)playVideoWithURL:(NSString *)url{
  NSURL *movieURL = [NSURL URLWithString:url];
  self.moviePlayer.contentURL = movieURL;
  [self.moviePlayer play];
  [self saveCurrnentChannel:url];
}

- (void)playVideo:(NSNotification *)notification {
  if ([[notification name] isEqualToString:@"noti"]){
    NSString *url = [notification object];
    [self playVideoWithURL:url];
  }
}

- (NSString *)loadLastViewedChannel {
  NSString *channel = [[NSUserDefaults standardUserDefaults] stringForKey:@"channel"];
  if (channel == nil) {
    channel = @"http://120.50.142.154/hls/ag0stream.m3u8";
  }
  return channel;
}

- (void)saveCurrnentChannel:(NSString *)channel {
  [[NSUserDefaults standardUserDefaults] setObject:channel forKey:@"channel"];
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
}


@end
