//
//  AppDelegate.m
//  iKTV
//
//  Created by Steve Yeom on 9/29/14.
//  Copyright (c) 2014 2nd Jobs. All rights reserved.
//

#import "AppDelegate.h"

#import "MMDrawerController.h"
#import "MMDrawerVisualState.h"

#import "ListTableViewController.h"
#import "VideoViewController.h"
#import "CreditsViewController.h"

@interface AppDelegate ()

typedef void (^MMDrawerControllerDrawerVisualStateBlock)(MMDrawerController * drawerController, MMDrawerSide drawerSide, CGFloat percentVisible);

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

  self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
  
  ListTableViewController *left = [[ListTableViewController alloc] initWithStyle:UITableViewStylePlain];
  CreditsViewController *right = [[CreditsViewController alloc] init];
  _center = [[VideoViewController alloc] init];
  
  [_center.view setBackgroundColor:[UIColor whiteColor]];
  
  MMDrawerController *root = [[MMDrawerController alloc] initWithCenterViewController:_center leftDrawerViewController:left rightDrawerViewController:right];
  root.view.backgroundColor = [UIColor whiteColor];
  
  [root setMaximumLeftDrawerWidth:200.0];
  [root setOpenDrawerGestureModeMask:MMOpenDrawerGestureModeAll];
  [root setCloseDrawerGestureModeMask:MMCloseDrawerGestureModeAll];
  
//  MMDrawerControllerDrawerVisualStateBlock visualStateBlock = [MMDrawerVisualState swingingDoorVisualStateBlock];
  
//  [root setDrawerVisualStateBlock:^(MMDrawerController *drawerController, MMDrawerSide drawerSide, CGFloat percentVisible) {
//     MMDrawerControllerDrawerVisualStateBlock block = visualStateBlock;
//     block(drawerController, drawerSide, percentVisible);
//   }];
  
  if(floor(NSFoundationVersionNumber) > NSFoundationVersionNumber_iOS_6_1){
    UIColor * tintColor = [UIColor colorWithRed:29.0/255.0
                                          green:173.0/255.0
                                           blue:234.0/255.0
                                          alpha:1.0];
    [self.window setTintColor:tintColor];
  }
  
  [self.window setRootViewController:root];
  [self.window makeKeyAndVisible];

  return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
  // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
  // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
  // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
  // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
  // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
  // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
  [_center playLastViewedChannel];
}

- (void)applicationWillTerminate:(UIApplication *)application {
  // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
