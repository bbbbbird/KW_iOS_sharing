//
//  BirdTableViewDelegateObject.h
//  TableViewDemo
//
//  Created by Mac on 2014/8/4.
//  Copyright (c) 2014年 iOSTeam. All rights reserved.
//
#import "BBDataObject.h"
@protocol BirdTableViewDelegate <NSObject>
@optional
- (void)shouldReloadData;
- (void)shouldGoNextViewWithData:(BBDataObject*)data;
@end
#import <Foundation/Foundation.h>

@interface BirdTableViewDelegateObject : NSObject<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,strong) NSMutableArray *dataArray;
@property (nonatomic,weak) id<BirdTableViewDelegate> delegate;
@end
