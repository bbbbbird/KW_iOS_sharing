//
//  BBViewController.m
//  Demo2
//
//  Created by Mac on 2014/7/15.
//  Copyright (c) 2014年 iOSTeam. All rights reserved.
//

#import "BBViewController.h"

@interface BBViewController ()

@end

@implementation BBViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self lab1];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - Lab1
- (void)lab1{
    NSString *defaultString = @"123.456.789.10";
    NSMutableArray *m_array = [NSMutableArray arrayWithArray:[defaultString componentsSeparatedByString:@"."]];
    for (int i = 0; i < m_array.count ; i ++) {
//        NSString *s = [m_array objectAtIndex:i];
//        s = @"999";
        [m_array replaceObjectAtIndex:i withObject:@"999"];
    }
    
    NSString *newString = @"";
    for (int i = 0; i < m_array.count; i++) {
        if (i == 0) {
            newString = m_array[0];
        }else{
            newString = [NSString stringWithFormat:@"%@.%@",newString,m_array[i]];
        }
    }
    NSLog(@"%@",newString);
}
@end
