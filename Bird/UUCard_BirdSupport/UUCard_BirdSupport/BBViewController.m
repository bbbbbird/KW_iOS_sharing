//
//  BBViewController.m
//  UUCard_BirdSupport
//
//  Created by Mac on 2014/7/23.
//  Copyright (c) 2014年 iOSTeam. All rights reserved.
//

#import "BBViewController.h"
#import "FamilySellObject.h"
#import "BBFamilyGiftViewController.h"
@interface BBViewController ()

@end

@implementation BBViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (BOOL)prefersStatusBarHidden{
    return YES;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    //假資料區
    FamilySellObject *data = [FamilySellObject new];
    data.actionDesc = @"活動期間持悠遊卡於全家超商小額消費, 累積扣款滿500元即可領取序號一組,可 至全家Famiport兌換好禮。";
    data.actionProcess = @"您目前累積消費金額為600元,您目前已 領取0份序號,還可領取0份序號,本活 動尚有3202份好禮可領取";
    data.actionStart = @"2014/8/20/20:00";
    data.actionEnd = @"2014/8/30/20:00";
    data.exchangeMethod = @"持卡人請於兌換期間內,持符合兌換資 格之悠遊卡至全家Famiport兌換。";
    data.website = @"活動詳細說明WEB LINK";
    data.exchangeStart = @"2014/9/20/20:00";
    data.exchangeEnd = @"2014/9/30/20:00";
    data.isSerialAccord = YES;
    data.isPointAccord = YES;
    BBFamilyGiftViewController *vc = (BBFamilyGiftViewController*)segue.destinationViewController;
    vc.dataObject = data;
}
@end
