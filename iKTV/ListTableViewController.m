//
//  ListTableViewController.m
//  iKTV
//
//  Created by Steve Yeom on 9/30/14.
//  Copyright (c) 2014 2nd Jobs. All rights reserved.
//

#import "ListTableViewController.h"

#define RAND_FROM_TO(min, max) (min + arc4random_uniform(max - min + 1))

@interface ListTableViewController ()

@end

@implementation ListTableViewController

- (void)viewDidLoad {
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
  return [[self programList] count];
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
  return [[[self programList] objectAtIndex:index] objectAtIndex:1];
}

- (NSString *)channelURLWithIndex:(NSInteger)index {
  NSString *path = [[NSBundle mainBundle] pathForResource:@"program_list" ofType:@"plist"];
  NSDictionary *dict = [[NSMutableDictionary alloc] initWithContentsOfFile:path];
  NSArray *array = [self programList];
  NSInteger serverInteger = RAND_FROM_TO(12, 15);
  NSString *temp1 = [dict objectForKey:@"url"];
  NSString *temp2 = [@(serverInteger) stringValue];
  NSString *temp3 = [[array objectAtIndex:index] objectAtIndex:0];
  NSString *temp4 = [[array objectAtIndex:index] objectAtIndex:2];
  return [NSString stringWithFormat:@"%@%@/live/1%@%@.m3u8?sid=", temp1, temp2, temp3, temp4];
}

- (NSArray *)programList{
  return @[
           @[@"001", @"jtbc", @"5"],
           @[@"002", @"MBN Live", @"3"],
           @[@"003", @"Channel A", @"3"],
           @[@"004", @"TV 조선 Live", @"3"],
           @[@"005", @"tvN", @"5"],
           @[@"007", @"sport HD", @"5"],
           @[@"008", @"Billiards TV", @"3"],
           @[@"009", @"CNN", @"3"],
           @[@"010", @"OnStyle", @"3"],
           @[@"011", @"Story On", @"3"],
           @[@"012", @"Olive Show", @"3"],
           @[@"013", @"OCN", @"3"],
           @[@"014", @"KBS2", @"5"],
           @[@"015", @"MTV", @"3"],
           @[@"016", @"KM", @"3"],
           @[@"017", @"KBS1", @"5"],
           @[@"018", @"EBS", @"3"],
           @[@"019", @"중화TV", @"3"],
           @[@"020", @"아시아N", @"3"],
           @[@"021", @"NOVELA", @"3"],
           @[@"022", @"IB SPORTS", @"3"],
           @[@"023", @"NAT GEO WILD", @"3"],
           @[@"024", @"NAT GEO People", @"3"],
           @[@"025", @"OnGamenet", @"3"],
           @[@"026", @"바둑 TV", @"3"],
           @[@"027", @"FTV", @"3"],
           @[@"028", @"J Golf", @"3"],
           @[@"029", @"NBC Golf", @"3"],
           @[@"030", @"YTN", @"3"],
           @[@"032", @"브레인 TV", @"3"],
           @[@"034", @"ANI PLUS", @"3"],
           @[@"035", @"연합뉴스 TV", @"3"],
           @[@"036", @"SKY ICT", @"3"],
           @[@"037", @"BBC World NEWS", @"3"],
           @[@"040", @"IB SPORTS", @"3"],
           @[@"041", @"KBS N SPORTS", @"5"],
           @[@"042", @"SBS SPORTS", @"5"],
           @[@"043", @"MBC SPORTS", @"5"],
           @[@"044", @"SKY SPORTS", @"3"],
           @[@"045", @"아이넷TV", @"3"],
           @[@"046", @"inet 한국가요채널", @"3"],
           @[@"047", @"YTN Science", @"3"],
           @[@"048", @"한국경제", @"3"],
           @[@"051", @"OBS", @"3"],
           @[@"052", @"ANIMAX", @"3"],
           @[@"054", @"MBC pooq beta", @"3"],
           @[@"055", @"SBS", @"3"],
           @[@"056", @"GS e SHOP", @"3"],
           @[@"057", @"SKY t SHOPPING", @"3"],
           @[@"058", @"디즈니 주니어", @"3"],
           @[@"059", @"디즈니 채널", @"3"],
           @[@"060", @"SBS Sport", @"3"],
           @[@"061", @"SKY ENT", @"3"],
           @[@"062", @"홈쇼핑", @"3"],
           @[@"064", @"ANI ONE", @"3"],
           @[@"065", @"EBS U", @"3"],
           @[@"066", @"ANI BOX", @"3"],
           @[@"182", @"대교어린이 TV", @"3"],
           @[@"183", @"KIDS Talk", @"3"],
           @[@"185", @"한국바둑방송", @"3"],
           @[@"186", @"토마토TV", @"3"],
           @[@"188", @"YTN weather", @"3"],
           @[@"189", @"EBS i", @"3"],
           @[@"190", @"EBS+2", @"3"],
           @[@"191", @"EBS e", @"3"],
           @[@"199", @"Sports TV 2", @"3"]
           ];
}


@end
