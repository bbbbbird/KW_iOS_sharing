//
//  BBViewController.m
//  BirdDemo_onCLass
//
//  Created by Mac on 2014/8/2.
//  Copyright (c) 2014年 iOSTeam. All rights reserved.
//
#define NEWS_URL @"https://api.app.net/stream/0/posts/stream/global"

#import "BBViewController.h"
#import "BBDataParser.h"
#import "BBCellDataObject.h"
#import "BBDataCell.h"
@interface BBViewController ()
{
    __weak IBOutlet UITableView *tableView;
    NSMutableArray *dataArray;
}
@end

@implementation BBViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}
- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [self performSelectorInBackground:@selector(loadingData) withObject:nil];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - loading data
- (void)loadingData{
    NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:NEWS_URL]];
    dataArray = [BBDataParser parseData:data];
    tableView.delegate = self;
    tableView.dataSource = self;
    [tableView performSelectorOnMainThread:@selector(reloadData) withObject:nil waitUntilDone:NO];
}
#pragma mark - UITableView delegate & dataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [dataArray count];
}
- (UITableViewCell *)tableView:(UITableView *)_tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    BBCellDataObject *cellData = dataArray[indexPath.row];
    BBDataCell *cell = [_tableView dequeueReusableCellWithIdentifier:@"birdCell"];
    [cell setData:cellData];
    return cell;
}
@end
