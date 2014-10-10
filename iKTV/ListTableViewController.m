//
//  ListTableViewController.m
//  iKTV
//
//  Created by Steve Yeom on 9/30/14.
//  Copyright (c) 2014 2nd Jobs. All rights reserved.
//

#import "ListTableViewController.h"
#import <Realm/Realm.h>

#import "Server.h"
#import "Channel.h"

#define RAND_FROM_TO(min, max) (min + arc4random_uniform(max - min + 1))

@interface ListTableViewController ()
@property (strong) RLMArray *channels;
@end

@implementation ListTableViewController

- (void)viewDidLoad {
  _channels = [Channel allObjects];
  [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
  return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  return [_channels count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  UITableViewCell *cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"listIdentifier"];
  NSString *title = [self channelTitleWithIndex:[indexPath row]];
  cell.textLabel.text = title;
  
  return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
  NSString *url = [self channelURLWithIndex:[indexPath row]];
  [[NSNotificationCenter defaultCenter] postNotificationName:@"noti" object:url];
}

- (NSString *)channelTitleWithIndex:(NSInteger)index {
  return [(Channel *)[_channels objectAtIndex:index] title];
}

- (NSString *)channelURLWithIndex:(NSInteger)index {
  NSInteger serverInteger = RAND_FROM_TO(12, 15);
  NSString *temp1 = [(Server *)[[Server allObjects] firstObject] url];
  NSString *temp2 = [@(serverInteger) stringValue];
  NSString *temp3 = [(Channel *)[_channels objectAtIndex:index] channelNum];
  NSString *temp4 = [(Channel *)[_channels objectAtIndex:index] quality];
  NSString *url = [NSString stringWithFormat:@"%@%@/live/1%@%@.m3u8?sid=", temp1, temp2, temp3, temp4];
  NSLog(@"%@", url);
  return url;
}

@end
