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
{
    NSArray *array;
    NSMutableArray *mutableArray;
}
@property (weak, nonatomic) IBOutlet UILabel *label1;

@end

@implementation BBViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
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
- (void)dealloc{
    
}
- (IBAction)sliderValueChange:(UISlider*)sender {
    _label1.text = [NSString stringWithFormat:@"%.2f",sender.value];
}

#pragma mark - X + Y
- (IBAction)X_Y_Method:(id)sender {
    SimpleObject *simpleObject = [SimpleObject new];
    int answer = [simpleObject getSumX:10 andY:30];
    NSLog(@"answer = %i",answer);
    _label1.text = [NSString stringWithFormat:@"%i",answer];
}
#pragma mark - 0 + 1 +... 100
- (IBAction)plusTo:(id)sender {
    SimpleObject *simpleObject = [SimpleObject new];
    int answer = [simpleObject countPlusFrom:0 to:100];
    NSLog(@"answer = %i",answer);
}
@end
