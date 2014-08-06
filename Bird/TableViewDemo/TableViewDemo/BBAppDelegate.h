//
//  BBAppDelegate.h
//  TableViewDemo
//
//  Created by Mac on 2014/7/18.
//  Copyright (c) 2014年 iOSTeam. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Reachability.h"
@interface BBAppDelegate : UIResponder <UIApplicationDelegate>
{
    Reachability *reachability;
}
@property (strong, nonatomic) UIWindow *window;

@end
