//
//  BBTableViewCell.m
//  TableViewDemo
//
//  Created by Mac on 2014/7/30.
//  Copyright (c) 2014年 iOSTeam. All rights reserved.
//

#import "BBTableViewCell.h"
@interface BBTableViewCell ()
{
    __weak IBOutlet UIActivityIndicatorView *flower;
}
@end
@implementation BBTableViewCell

- (void)setData:(BBDataObject*)dataItem{
    [flower startAnimating];
    [flower setAlpha:1.0];
    _targetImageView.delegate = self;
    [_targetImageView setImageWithUrl:[NSURL URLWithString:dataItem.imgUrl]];
    [_targetContent setText:dataItem.content];
    [_targetTitle setText:dataItem.name];
}

#pragma mark - BBImageView delegate
- (void)whenUrlImageLoadFinished:(UIImageView*)imageView{
    [flower stopAnimating];
    [flower setAlpha:0.0f];
}
- (void)dealloc{
    [_targetImageView stopLoadingImage];
}
@end


