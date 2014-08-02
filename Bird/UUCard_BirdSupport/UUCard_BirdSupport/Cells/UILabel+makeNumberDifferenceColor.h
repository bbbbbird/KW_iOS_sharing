//
//  UILabel+makeNumberDifferenceColor.h
//  UUCard_BirdSupport
//
//  Created by Bird on 2014/7/25.
//  Copyright (c) 2014年 iOSTeam. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (makeNumberDifferenceColor)
//使用此Method設定字串會導致數字變色
- (void)setText:(NSString *)text withNumberColor:(UIColor*)color;
@end
