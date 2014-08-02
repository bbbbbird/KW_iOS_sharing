//
//  BBViewController.m
//  TableViewDemo
//
//  Created by Mac on 2014/7/18.
//  Copyright (c) 2014年 iOSTeam. All rights reserved.
//
#define NEWS_URL @"https://api.app.net/stream/0/posts/stream/global"
#define REFRESF_OFFSET -150
#define RENEW_WORDING @"Loading..."
#define SHOULD_KILL_WELCOM_VIEW YES
#import "BBViewController.h"
#import "BBTableViewCell.h"
#import "BBDataParser.h"
#import "BBDetailViewController.h"
@interface BBViewController ()
{
    __weak IBOutlet UITableView *tableView;
    NSMutableArray *dataArray;
    MBProgressHUD *hud;
}
@end
@implementation BBViewController

#pragma mark - viewController life cycle
- (void)viewDidLoad
{
    [super viewDidLoad];
    if (SHOULD_KILL_WELCOM_VIEW) {
        UINavigationController *navigation = self.navigationController;
        NSArray *viewcontrollerArray = navigation.viewControllers;
        NSMutableArray *viewcontrollerMutableArray = [NSMutableArray arrayWithArray:viewcontrollerArray];
        [viewcontrollerMutableArray removeObjectAtIndex:0];
        NSArray *newViewControllers = [NSArray arrayWithArray:viewcontrollerMutableArray];
        navigation.viewControllers = newViewControllers;
        [self.navigationItem setHidesBackButton:YES animated:YES];
    }
    tableView.delegate = self;
    tableView.dataSource = self;
    dataArray = [NSMutableArray new];
    [self showHudWithString:RENEW_WORDING];
    [self performSelectorInBackground:@selector(loadNewsDataFromURL:) withObject:NEWS_URL];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (BOOL)prefersStatusBarHidden{
    return YES;
}

#pragma mark - tableView delegate & dataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)_tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    BBTableViewCell *cell = [_tableView dequeueReusableCellWithIdentifier:@"cell_ID"];
    BBDataObject *data = dataArray[indexPath.row];
    [cell setData:data];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    BBDataObject *data = dataArray[indexPath.row];
    [self performSegueWithIdentifier:@"goView2" sender:data];
}
-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat contentYoffset = scrollView.contentOffset.y;
    if(contentYoffset < REFRESF_OFFSET)
    {
        tableView.delegate = nil;
        [self showHudWithString:RENEW_WORDING];
        [self performSelectorInBackground:@selector(loadNewsDataFromURL:) withObject:NEWS_URL];
    }
}


#pragma mark - data control
- (void)loadNewsDataFromURL:(NSString*)targetURL{
    NSURL *feedURL = [NSURL URLWithString:NEWS_URL];
    NSData *data = [NSData dataWithContentsOfURL:feedURL];
    dataArray = [BBDataParser getDataObjectsWithDefaultData:data];
    [tableView performSelectorOnMainThread:@selector(reloadData) withObject:nil waitUntilDone:NO];
    [self removePreviousHud];
    tableView.delegate = self;
}

#pragma mark - MBProgress Hud method
- (void)showHudWithString:(NSString*)message{
    if (hud != nil) {
        [self removePreviousHud];
    }
	hud = [[MBProgressHUD alloc] initWithView:self.navigationController.view];
	[self.navigationController.view addSubview:hud];
	hud.delegate = self;
	hud.labelText = message;
	[hud show:YES];
}
- (void)removePreviousHud{
    [hud hide:YES];
}
#pragma mark - MBProgress Hud delegate
- (void)hudWasHidden:(MBProgressHUD *)_hud {
	[_hud removeFromSuperview];
	_hud = nil;
}
#pragma mark - segue control
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)data{
    BBDetailViewController *vc = (BBDetailViewController*)segue.destinationViewController;
    vc.data = data;
}

@end
