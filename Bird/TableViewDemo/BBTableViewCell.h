//
//  BBTableViewCell.h
//  TableViewDemo
//
//  Created by Mac on 2014/7/30.
//  Copyright (c) 2014年 iOSTeam. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BBDataObject.h"
#import "BBImageView.h"
@interface BBTableViewCell : UITableViewCell<BBImageViewDelegate>

@property (weak, nonatomic) IBOutlet UILabel *targetTitle;
@property (weak, nonatomic) IBOutlet UILabel *targetContent;
@property (weak, nonatomic) IBOutlet BBImageView *targetImageView;
- (void)setData:(BBDataObject*)dataItem;
@end
