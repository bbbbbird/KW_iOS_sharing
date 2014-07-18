//
//  BBViewController.h
//  DeleagteDemo
//
//  Created by Mac on 2014/7/16.
//  Copyright (c) 2014年 iOSTeam. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BBClass1.h"
#import "BBClass1Protocol.h"
#import "BBView2ViewController.h"
@interface BBViewController : UIViewController<BBClass1Protocol,forView1Delegate>

@end
