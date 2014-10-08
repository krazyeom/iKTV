//
//  CreditsViewController.m
//  iKTV
//
//  Created by Steve Yeom on 10/5/14.
//  Copyright (c) 2014 2nd Jobs. All rights reserved.
//

#import "CreditsViewController.h"

@interface CreditsViewController ()

@end

@implementation CreditsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
  
  CGRect winsize = [[UIScreen mainScreen] bounds];
    // Do any additional setup after loading the view.
  UILabel *developer = [[UILabel alloc] initWithFrame:CGRectMake(-20, 100, winsize.size.width, 100)];
  developer.textAlignment = NSTextAlignmentCenter;
  developer.text = @"Developing: \n@krazyeom\n 2nd Jobs \nMobile Game Studio";
  developer.numberOfLines = 0;
  developer.lineBreakMode = NSLineBreakByWordWrapping;
  [self.view addSubview:developer];
  
  UILabel *description = [[UILabel alloc] initWithFrame:CGRectMake(-20, 180, winsize.size.width, 100)];
  description.textAlignment = NSTextAlignmentCenter;
  description.text = @"배고파용 ㅠㅠb";
  [self.view addSubview:description];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
