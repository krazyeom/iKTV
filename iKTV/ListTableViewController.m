//
//  ListTableViewController.m
//  iKTV
//
//  Created by Steve Yeom on 9/30/14.
//  Copyright (c) 2014 2nd Jobs. All rights reserved.
//

#import "ListTableViewController.h"

@interface ListTableViewController ()

@property (strong) NSDictionary *programList;

@end

@implementation ListTableViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  
  NSString *path = [[NSBundle mainBundle] pathForResource:@"program_list" ofType:@"plist"];
  self.programList = [[NSMutableDictionary alloc] initWithContentsOfFile:path];
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
  return [_programList count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  UITableViewCell *cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"listIdentifier"];
  NSString *title = [[_programList allKeys] objectAtIndex:indexPath.row];
  cell.textLabel.text = title;
  
  return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
  NSString *url = [[_programList allValues] objectAtIndex:indexPath.row];
  [[NSNotificationCenter defaultCenter] postNotificationName:@"noti" object:url];
}

@end
