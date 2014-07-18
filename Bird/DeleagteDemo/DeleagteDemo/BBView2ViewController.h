//
//  BBView2ViewController.h
//  DeleagteDemo
//
//  Created by Mac on 2014/7/17.
//  Copyright (c) 2014年 iOSTeam. All rights reserved.
//

@protocol forView1Delegate <NSObject>
- (void)whenView2Dead;
@end

#import <UIKit/UIKit.h>

@interface BBView2ViewController : UIViewController
@property(nonatomic,weak) id<forView1Delegate> delegate;
@end
