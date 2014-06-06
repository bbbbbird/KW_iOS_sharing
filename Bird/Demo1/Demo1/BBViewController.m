//
//  BBViewController.m
//  Demo1
//
//  Created by Mac on 2014/5/26.
//  Copyright (c) 2014年 iOSTeam. All rights reserved.
//

#import "BBViewController.h"
#import "SimpleObject.h"
@interface BBViewController ()

@end

@implementation BBViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	NSLog(@"ViewDidLoad");
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    NSLog(@"viewWillAppear");
}
- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    NSLog(@"viewDidAppear");
}
- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    NSLog(@"viewWillDisappear");
}
- (void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    NSLog(@"viewDidDisappear");
}

#pragma mark - X + Y
- (IBAction)X_Y_Method:(id)sender {
    SimpleObject *simpleObject = [SimpleObject new];
    int answer = [simpleObject getSumX:10 andY:30];
    NSLog(@"%i",answer);
}

@end
