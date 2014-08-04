//
//  BBImageView.m
//  TableViewDemo
//
//  Created by Mac on 2014/8/1.
//  Copyright (c) 2014年 iOSTeam. All rights reserved.
//

#import "BBImageView.h"
#import "BBCatchFileController.h"
@interface BBImageView(){
    NSURLConnection *connection;
    NSMutableData *imageData;
    BOOL catchFlag;
}
@end
@implementation BBImageView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setImageWithUrl:(NSURL*)targetUrl catch:(BOOL)shouldCatch{
    if (shouldCatch) {
        //load image from catch
        NSData *targetData = [BBCatchFileController readCatchWithName:targetUrl.absoluteString];
        if (targetData) {
            UIImage *targetImage = [UIImage imageWithData:targetData];
            [self setImage:targetImage];
            if (_delegate) {
                [self downloadFinishedCallBack];
            }
            return;
        }
    }
    //load image from URL
    if (connection) {
        [connection cancel];
        connection = nil;
    }
    [self setImage:nil];
    connection = [NSURLConnection connectionWithRequest:[NSURLRequest requestWithURL:targetUrl] delegate:self];
    [connection performSelectorInBackground:@selector(start) withObject:nil];
    
    //set Catch setting
    catchFlag = shouldCatch;
}
- (void)stopLoadingImage{
    if (connection) {
        [connection cancel];
        connection = nil;
    }
    if (imageData) {
        imageData = nil;
    }
}
#pragma mark - NSURLConnection delegate
- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response{
    if (imageData) {
        imageData = nil;
    }
    imageData = [NSMutableData data];
}
- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data{
    [imageData appendData:data];
}
- (void)connectionDidFinishLoading:(NSURLConnection *)_connection{
    UIImage *targetImage = [UIImage imageWithData:imageData];
    [self performSelectorOnMainThread:@selector(setImage:) withObject:targetImage waitUntilDone:NO];
    if (catchFlag) {
        [BBCatchFileController catchFileWithData:imageData andName:_connection.originalRequest.URL.absoluteString];
    }
    if (_delegate) {
        [self performSelectorOnMainThread:@selector(downloadFinishedCallBack) withObject:nil waitUntilDone:NO];
    }
}

#pragma mark - callBack function
- (void)downloadFinishedCallBack{
    if (_delegate) {
        [_delegate whenUrlImageLoadFinished:self];
    }
}
@end
