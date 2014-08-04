//
//  BBParentViewController.m
//  TableViewDemo
//
//  Created by Mac on 2014/8/4.
//  Copyright (c) 2014年 iOSTeam. All rights reserved.
//

#import "BBParentViewController.h"

@interface BBParentViewController (){
     MBProgressHUD *hud;
}
@end

@implementation BBParentViewController

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
    // Do any additional setup after loading the view.
}

- (BOOL)prefersStatusBarHidden{
    return YES;
}

#pragma mark - MBProgress Hud method
- (void)showHudWithString:(NSString*)message onView:(UIView*)targetView{
    if (hud != nil) {
        [self removePreviousHud];
    }
	hud = [[MBProgressHUD alloc] initWithView:self.navigationController.view];
	[targetView addSubview:hud];
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
@end
