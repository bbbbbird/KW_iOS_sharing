//
//  BBAppDelegate.m
//  Demo1
//
//  Created by Mac on 2014/5/26.
//  Copyright (c) 2014年 iOSTeam. All rights reserved.
//

#import "BBAppDelegate.h"

@implementation BBAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    //開啟App
    NSLog(@"開啟App");
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    //App被電話等等打斷
    NSLog(@"App被電話或使用者等等打斷");
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    //App即將進入背景
    NSLog(@"App已進入背景");
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    //App已進入背景
    NSLog(@"App即將進入背景");
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    //App即將進入前景
    NSLog(@"App已進入前景");
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    //App即將關閉
    NSLog(@"App即將關閉");
}

@end
