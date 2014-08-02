//
//  UILabel+makeNumberDifferenceColor.m
//  UUCard_BirdSupport
//
//  Created by Bird on 2014/7/25.
//  Copyright (c) 2014年 iOSTeam. All rights reserved.
//

#import "UILabel+makeNumberDifferenceColor.h"

@implementation UILabel (makeNumberDifferenceColor)
- (void)setText:(NSString *)text withNumberColor:(UIColor*)color{
    [self setText:text];
    NSDictionary *attribs = @{
                              NSForegroundColorAttributeName: self.textColor,
                              NSFontAttributeName: self.font
                              };
    NSMutableAttributedString *attributedText =
    [[NSMutableAttributedString alloc] initWithString:text
                                           attributes:attribs];
    NSUInteger count = 0, length = [text length] - 0;
    NSRange newRange = NSMakeRange(count, length);
    NSRange range = [text rangeOfCharacterFromSet:[NSCharacterSet decimalDigitCharacterSet] options:NSCaseInsensitiveSearch range:newRange];
    while(range.location != NSNotFound)
    {
        if (count >= length) {
            break;
        }
        newRange = NSMakeRange(count, length - count);
        if(range.location != NSNotFound)
        {
            range = [text rangeOfCharacterFromSet:[NSCharacterSet decimalDigitCharacterSet] options:NSCaseInsensitiveSearch range:newRange];
            count++; 
        }
        UIColor *numberColor = color;
        NSRange colorRange = range;
        [attributedText setAttributes:@{NSForegroundColorAttributeName:numberColor}
                                range:colorRange];
        self.attributedText = attributedText;
    }
}
@end
