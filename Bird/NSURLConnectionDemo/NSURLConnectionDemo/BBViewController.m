//
//  BBViewController.m
//  NSURLConnectionDemo
//
//  Created by Mac on 2014/8/2.
//  Copyright (c) 2014年 iOSTeam. All rights reserved.
//
#define NEWS_URL @"https://api.app.net/stream/0/posts/stream/global"
#import "BBViewController.h"

@interface BBViewController ()
{
    NSMutableData *m_data;
}
@end

@implementation BBViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)URLCOnnection:(id)sender {
    //最簡單的方法
    NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:NEWS_URL]];
    NSString *feedBackString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    NSLog(@"%@",feedBackString);
}
- (IBAction)urlRequest:(id)sender {
    //NSMutableURLRequest 可控制Method、Timeout、Body等等，並可監控狀態，或終止
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:NEWS_URL]];
    [request setHTTPMethod:@"GET"];
    
    NSURLConnection *connection = [NSURLConnection connectionWithRequest:request delegate:self];
    [connection performSelectorInBackground:@selector(start) withObject:nil];
}


#pragma mark - NSURLConnection delegate
- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response{
    if (m_data) {
        m_data = nil;
    }
    m_data = [NSMutableData data];
}
- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data{
    [m_data appendData:data];
}
- (void)connectionDidFinishLoading:(NSURLConnection *)connection{
    NSString *feedBackString = [[NSString alloc] initWithData:m_data encoding:NSUTF8StringEncoding];
    NSLog(@"%@",feedBackString);
}
@end
