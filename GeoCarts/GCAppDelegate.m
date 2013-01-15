//
//  GCAppDelegate.m
//  GeoCarts
//
//  Created by Justin R. Miller on 1/15/13.
//  Copyright (c) 2013 MapBox. All rights reserved.
//

#import "GCAppDelegate.h"

#import "GCViewController.h"

@implementation GCAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];

    self.window.rootViewController = [[UINavigationController alloc] initWithRootViewController:[GCViewController new]];

    [self.window makeKeyAndVisible];

    return YES;
}

@end