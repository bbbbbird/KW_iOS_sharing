//
//  FamilyCollectionCell.m
//  UUCard_BirdSupport
//
//  Created by Bird on 2014/7/25.
//  Copyright (c) 2014年 iOSTeam. All rights reserved.
//

#import "FamilyCollectionCell.h"
#import "UILabel+makeNumberDifferenceColor.h"
#import "BBStickerBook.h"
@interface FamilyCollectionCell(){
    
    __weak IBOutlet UILabel *processDescription;
    __weak IBOutlet UILabel *contentDescription;
    __weak IBOutlet UILabel *durationDescription;
    __weak IBOutlet UILabel *exchangeMethodDescription;
    __weak IBOutlet UILabel *updateDate;
    __weak IBOutlet UILabel *exchangeDuration;
    __weak IBOutlet UILabel *webUrlDescription;
    UITapGestureRecognizer *tapGesture;
    __weak IBOutlet BBStickerBook *stickerBook;
}
@end
@implementation FamilyCollectionCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}
- (IBAction)getOrSearchBtnClicked:(id)sender {
    [[NSNotificationCenter defaultCenter] postNotificationName:@"getOrSearchBtnClicked" object:nil userInfo:nil];
}
- (IBAction)uperBtnClicked:(id)sender {
    [[NSNotificationCenter defaultCenter] postNotificationName:@"uperBtnClicked" object:nil userInfo:nil];
}
- (IBAction)lowerBtnClicked:(id)sender {
    [[NSNotificationCenter defaultCenter] postNotificationName:@"lowerBtnClicked" object:nil userInfo:nil];
}
- (void)urlTaped{
    [[NSNotificationCenter defaultCenter] postNotificationName:@"URL_TAPED" object:nil userInfo:nil];
}
- (void)setDataFromIdentifer:(NSString *)identifer andData:(FamilySellObject*)data{
    if ([identifer isEqualToString:@"FamilyTitle"]) {
    }else if ([identifer isEqualToString:@"SpeerateLine"]){
    }else if ([identifer isEqualToString:@"ActivityTitle"]){
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        [formatter setDateFormat:@"YYYY年MM月dd號"];
        //更新日期 - 取前一天
        NSString *dateString = [formatter stringFromDate:[NSDate dateWithTimeIntervalSinceNow:-24 * 60 * 60]];
        [updateDate setText:dateString];
    }else if ([identifer isEqualToString:@"ActivityContent"]){
        [processDescription setText:data.actionProcess withNumberColor:[UIColor colorWithRed:255.0/255.0 green:247.0/255.0 blue:153.0/255.0 alpha:1.0]];
    }else if ([identifer isEqualToString:@"ActivityDescriptionContent"]){
        [contentDescription setText:data.actionDesc];
    }else if ([identifer isEqualToString:@"ActivityDurationContent"]){
        NSString *activityDuration = [NSString stringWithFormat:@"%@ 至 \n%@",data.actionStart,data.actionEnd];
        [durationDescription setText:activityDuration];
    }else if ([identifer isEqualToString:@"ExchangeMethodContent"]){
        [exchangeMethodDescription setText:data.exchangeMethod];
    }else if ([identifer isEqualToString:@"URLContent"]){
        [exchangeMethodDescription setText:data.website];
        exchangeMethodDescription.userInteractionEnabled = YES;
        if(!tapGesture){
            tapGesture =
            [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(urlTaped)];
            [exchangeMethodDescription addGestureRecognizer:tapGesture];
        }
    }else if ([identifer isEqualToString:@"ExchangeTimeContent"]){
        NSString *exchangeDurationString = [NSString stringWithFormat:@"%@ 至 \n%@",data.exchangeStart,data.exchangeEnd];
        [exchangeDuration setText:exchangeDurationString];
    }//以下為貼紙頁面
    else if ([identifer isEqualToString:@"stickers"]){
        [stickerBook initStickerBook];
        [stickerBook pasteStickersWithNumber:data.pointQrt];
    }
}
+ (CGSize)getCellSizeFromIdentifer:(NSString *)identifer andData:(FamilySellObject*)data{
    if ([identifer isEqualToString:@"FamilyTitle"]) {
        return CGSizeMake(288, 50);
    }else if ([identifer isEqualToString:@"gap10"]){
        return CGSizeMake(288, 10);
    }else if ([identifer isEqualToString:@"SpeerateLine"]){
        return CGSizeMake(288, 21);
    }else if ([identifer isEqualToString:@"ActivityTitle"]){
        return CGSizeMake(288, 26);
    }else if ([identifer isEqualToString:@"ActivityContent"]){
        return [FamilyCollectionCell SizeForCellWithString:data.actionProcess containerWidth:288 andTextSize:20 addHeight:0];
    }else if ([identifer isEqualToString:@"ActivityBtn"]){
        return CGSizeMake(170, 30);
    }else if ([identifer isEqualToString:@"ActivityDescriptionTitle"]){
        return CGSizeMake(288, 26);
    }else if ([identifer isEqualToString:@"ActivityDescriptionContent"]){
        return [FamilyCollectionCell SizeForCellWithString:data.actionDesc containerWidth:288 andTextSize:20 addHeight:0];
    }else if ([identifer isEqualToString:@"ActivityDurationTitle"]){
        return CGSizeMake(288, 26);
    }else if ([identifer isEqualToString:@"ActivityDurationContent"]){
        NSString *activityDuration = [NSString stringWithFormat:@"%@ 至 \n%@",data.actionStart,data.actionEnd];
        return [FamilyCollectionCell SizeForCellWithString:activityDuration containerWidth:288 andTextSize:20 addHeight:0];
    }else if ([identifer isEqualToString:@"ExchangeMethodTitle"]){
        return CGSizeMake(288, 26);
    }else if ([identifer isEqualToString:@"ExchangeMethodContent"]){
        return [FamilyCollectionCell SizeForCellWithString:data.exchangeMethod containerWidth:288 andTextSize:20 addHeight:0];
    }else if ([identifer isEqualToString:@"URLTitle"]){
        return CGSizeMake(288, 26);
    }else if ([identifer isEqualToString:@"URLContent"]){
        return [FamilyCollectionCell SizeForCellWithString:data.website containerWidth:288 andTextSize:20 addHeight:0];
    }else if ([identifer isEqualToString:@"ExchangeTimeTitle"]){
        return CGSizeMake(288, 26);
    }else if ([identifer isEqualToString:@"ExchangeTimeContent"]){
        NSString *activityDuration = [NSString stringWithFormat:@"%@ 至 \n%@",data.exchangeStart,data.exchangeEnd];
        return [FamilyCollectionCell SizeForCellWithString:activityDuration containerWidth:288 andTextSize:20 addHeight:0];
    }//以下為貼紙頁面
    else if ([identifer isEqualToString:@"stickers"]){
        return CGSizeMake(288, 216);
    }
    else if ([identifer isEqualToString:@"uperBtn"]){
        return CGSizeMake(288, 30);
    }
    else if ([identifer isEqualToString:@"lowerBtn"]){
        return CGSizeMake(288, 30);
    }
    return CGSizeMake(0, 0);
}

+ (CGSize)SizeForCellWithString:(NSString *)text containerWidth:(CGFloat)contailerWidth andTextSize:(CGFloat)textSize addHeight:(int)addHeight{
    UILabel *l = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, contailerWidth, 0)];
    [l setText:text];
    [l setFont:[UIFont systemFontOfSize:textSize]];
    [l setNumberOfLines:100];
    [l sizeToFit];
    return CGSizeMake(contailerWidth, l.frame.size.height);
}

- (void)dealloc{
    if (exchangeMethodDescription) {
        [exchangeMethodDescription removeGestureRecognizer:tapGesture];
    }
}
@end
