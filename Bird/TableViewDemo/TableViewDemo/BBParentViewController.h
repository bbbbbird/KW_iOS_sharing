//
//  BBParentViewController.h
//  TableViewDemo
//
//  Created by Mac on 2014/8/4.
//  Copyright (c) 2014年 iOSTeam. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MBProgressHUD.h"
@interface BBParentViewController : UIViewController<MBProgressHUDDelegate>
- (void)showHudWithString:(NSString*)message onView:(UIView*)targetView;
- (void)removePreviousHud;
@end
