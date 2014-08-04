//
//  BBDetailViewController.h
//  TableViewDemo
//
//  Created by Mac on 2014/8/1.
//  Copyright (c) 2014年 iOSTeam. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BBDataObject.h"
#import "BBParentViewController.h"
@interface BBDetailViewController : BBParentViewController<UIWebViewDelegate>
@property (nonatomic,strong) BBDataObject *data;
@end
