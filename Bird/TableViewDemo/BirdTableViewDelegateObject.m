//
//  BirdTableViewDelegateObject.m
//  TableViewDemo
//
//  Created by Mac on 2014/8/4.
//  Copyright (c) 2014年 iOSTeam. All rights reserved.
//
#define REFRESF_OFFSET -150
#import "BirdTableViewDelegateObject.h"
#import "BBTableViewCell.h"
@implementation BirdTableViewDelegateObject
#pragma mark - tableView delegate & dataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)_tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    BBTableViewCell *cell = [_tableView dequeueReusableCellWithIdentifier:@"cell_ID"];
    BBDataObject *data = _dataArray[indexPath.row];
    [cell setData:data];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (_delegate) {
        [_delegate shouldGoNextViewWithData:_dataArray[indexPath.row]];
    }
}
-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    UITableView *tableView = (UITableView *)scrollView;
    CGFloat contentYoffset = scrollView.contentOffset.y;
    if(contentYoffset < -150)
    {
        tableView.delegate = nil;
        if (_delegate) {
            [_delegate shouldReloadData];
        }
    }
}
@end
