//
//  BBStickerBook.m
//  UUCard_BirdSupport
//
//  Created by Bird on 2014/7/28.
//  Copyright (c) 2014年 iOSTeam. All rights reserved.
//
#define MAX_STICKER_NUMBER 30
#define NUMBER_OF_ROW 6
#define STICKER_WIDTH 40
#define STICKER_HEIGHT 40
#define GAP_BETWWEN_STICKERS 4
#import "BBStickerBook.h"
@interface BBStickerBook(){
    NSMutableArray *stickers;
}
@end
@implementation BBStickerBook

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}
- (void)initStickerBook{
    for (UIView *view in self.subviews) {
        [view removeFromSuperview];
    }
    int width = self.frame.size.width;
    //計算初始邊界寬度
    int gapsWidth = (NUMBER_OF_ROW - 1) * GAP_BETWWEN_STICKERS;
    int allStickersWidth = STICKER_WIDTH * NUMBER_OF_ROW;
    int initWidth = (width - (gapsWidth + allStickersWidth)) / 2;
    if(stickers){
        [stickers removeAllObjects];
    }else{
        stickers = [NSMutableArray new];
    }
    for (int i = 0; i < MAX_STICKER_NUMBER; i++) {
        NSString *targetImageName = [NSString stringWithFormat:@"mdpi_stickers%02d.png",i + 1];
        UIImageView *sticker = [[UIImageView alloc] initWithImage:[UIImage imageNamed:targetImageName]];
        int numberOfRow = i % 6;
        int numberOfColume = i / 6;
        //求x,y
        int targetX = initWidth + (numberOfRow * (GAP_BETWWEN_STICKERS + STICKER_WIDTH));
        int targetY = (numberOfColume * (GAP_BETWWEN_STICKERS + STICKER_HEIGHT));
        [sticker setFrame:CGRectMake(targetX, targetY, STICKER_WIDTH, STICKER_HEIGHT)];
        [self addSubview:sticker];
        [stickers addObject:sticker];
    }
}
- (void)pasteStickersWithNumber:(int)numberOfStickers{
    if (numberOfStickers > stickers.count) {
        numberOfStickers = (int)stickers.count;
    }
    for (int i = 0; i < numberOfStickers; i++) {
        UIImageView *targetSticker = [stickers objectAtIndex:i];
        [targetSticker setBackgroundColor:[UIColor redColor]];
    }
}
@end
