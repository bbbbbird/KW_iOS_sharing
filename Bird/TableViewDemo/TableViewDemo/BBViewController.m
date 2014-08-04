//
//  BBViewController.m
//  TableViewDemo
//
//  Created by Mac on 2014/7/18.
//  Copyright (c) 2014年 iOSTeam. All rights reserved.
//
#define NEWS_URL @"https://api.app.net/stream/0/posts/stream/global"
#define RENEW_WORDING @"Loading..."
#define SHOULD_KILL_WELCOM_VIEW YES
#import "BBViewController.h"
#import "BBTableViewCell.h"
#import "BBDataParser.h"
#import "BBDetailViewController.h"
@interface BBViewController ()
{
    __weak IBOutlet UITableView *tableView;
    BirdTableViewDelegateObject *tableViewDelegate;
}
@end
@implementation BBViewController

#pragma mark - viewController life cycle
- (void)viewDidLoad
{
    [super viewDidLoad];
    [self showHudWithString:RENEW_WORDING onView:self.navigationController.view];
    [self performSelectorInBackground:@selector(loadNewsDataFromURL:) withObject:NEWS_URL];
}


#pragma mark - tableView CallBack
- (void)shouldReloadData{
    [self showHudWithString:RENEW_WORDING onView:self.navigationController.view];
    [self performSelectorInBackground:@selector(loadNewsDataFromURL:) withObject:NEWS_URL];
}
- (void)shouldGoNextViewWithData:(BBDataObject *)data{
    [self performSegueWithIdentifier:@"goView2" sender:data];
}

#pragma mark - data control
- (void)loadNewsDataFromURL:(NSString*)targetURL{
    NSURL *feedURL = [NSURL URLWithString:NEWS_URL];
    NSData *data = [NSData dataWithContentsOfURL:feedURL];
    tableViewDelegate = [BirdTableViewDelegateObject new];
    tableViewDelegate.dataArray = [BBDataParser getDataObjectsWithDefaultData:data];
    [self removePreviousHud];
    tableView.delegate = tableViewDelegate;
    tableView.dataSource = tableViewDelegate;
    tableViewDelegate.delegate = self;
    [tableView performSelectorOnMainThread:@selector(reloadData) withObject:nil waitUntilDone:NO];
}

#pragma mark - segue control
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)data{
    BBDetailViewController *vc = (BBDetailViewController*)segue.destinationViewController;
    vc.data = data;
}

@end
