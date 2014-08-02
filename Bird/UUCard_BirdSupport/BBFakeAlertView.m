//
//  BBFakeAlertView.m
//  UUCard_BirdSupport
//
//  Created by Mac on 2014/7/29.
//  Copyright (c) 2014年 iOSTeam. All rights reserved.
//
#define SHOW_HIDE_ANIMATION_DURATION 0.5f
#define BG_ALPHA 0.8f
#define CORNER_DADIOUS 5
#import "BBFakeAlertView.h"
#import <QuartzCore/QuartzCore.h>
@interface BBFakeAlertView ()
{
    
}
@end
@implementation BBFakeAlertView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (id)initWithNibName:(NSString*)targetNib{
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    self = [super initWithFrame:screenRect];
    //產生背景alpha UIImageView
    UIImageView *bgImageView = [[UIImageView alloc] initWithFrame:screenRect];
    [bgImageView setBackgroundColor:[UIColor blackColor]];
    [bgImageView setAlpha:BG_ALPHA];
    [self addSubview:bgImageView];
    //load layout
    if (targetNib) {
        UIView *targetNibView = [[[NSBundle mainBundle] loadNibNamed:targetNib owner:self options:nil] objectAtIndex:0];
        [self makeCorner:targetNibView];
        [self addSubview:targetNibView];
        [targetNibView setCenter:self.center];
    }
    //corner
    [self makeCorner:self];
    self.alpha = 0.0;
    return self;
}
- (void)show{
    [UIView animateWithDuration:SHOW_HIDE_ANIMATION_DURATION animations:^{
        self.alpha = 1.0f;
    }];
}
- (void)hide{
    [UIView animateWithDuration:SHOW_HIDE_ANIMATION_DURATION animations:^{
        self.alpha = 0.0f;
    } completion:^(BOOL complete){
        [self removeFromSuperview];
    }];
}
- (void)makeCorner:(UIView *)targetView{
    targetView.layer.cornerRadius = 5;
    targetView.layer.masksToBounds = YES;
}
@end
