//
//  BBDetailViewController.m
//  TableViewDemo
//
//  Created by Mac on 2014/8/1.
//  Copyright (c) 2014年 iOSTeam. All rights reserved.
//

#import "BBDetailViewController.h"

@interface BBDetailViewController ()
{

    __weak IBOutlet UIWebView *m_webView;
}
@end

@implementation BBDetailViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = _data.name;
    // Do any additional setup after loading the view.
}
- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [m_webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:_data.contentURL]]];
}

-(void)dealloc{
    [m_webView stopLoading];
    m_webView.delegate = nil;
}

#pragma mark - webView delegate
- (void)webViewDidStartLoad:(UIWebView *)webView{
    [self showHudWithString:@"Loading..." onView:self.view];
}
- (void)webViewDidFinishLoad:(UIWebView *)webView{
    [self removePreviousHud];
}
- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error{
    [self removePreviousHud];
    [self.navigationController popViewControllerAnimated:YES];
    //alert user
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Warning" message:@"Loading failed" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [alert performSelectorOnMainThread:@selector(show) withObject:nil waitUntilDone:NO];
}
@end
