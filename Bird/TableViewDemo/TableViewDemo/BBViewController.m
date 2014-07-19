//
//  BBViewController.m
//  TableViewDemo
//
//  Created by Mac on 2014/7/18.
//  Copyright (c) 2014年 iOSTeam. All rights reserved.
//

#import "BBViewController.h"

@interface BBViewController ()
{
    
    __weak IBOutlet UITableView *tableView;
}
@end

@implementation BBViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    tableView.delegate = self;
    tableView.dataSource = self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - tableView dleegate & dataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 100;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    int cellIndex = (int)[indexPath row];
    [cell.textLabel setText:[NSString stringWithFormat:@"第%i個cell",++cellIndex]];
    return cell;
}
@end
