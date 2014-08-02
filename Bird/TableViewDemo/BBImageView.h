//
//  BBImageView.h
//  TableViewDemo
//
//  Created by Mac on 2014/8/1.
//  Copyright (c) 2014年 iOSTeam. All rights reserved.
//
@protocol BBImageViewDelegate <NSObject>
@optional
- (void)whenUrlImageLoadFinished:(UIImageView*)imageView;
@end

#import <UIKit/UIKit.h>

@interface BBImageView : UIImageView<NSURLConnectionDelegate>
- (void)setImageWithUrl:(NSURL*)targetUrl;
- (void)stopLoadingImage;
@property (nonatomic,weak)id<BBImageViewDelegate>delegate;
@end
