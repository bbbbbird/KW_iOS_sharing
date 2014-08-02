//
//  FamilyCollectionCell.h
//  UUCard_BirdSupport
//
//  Created by Bird on 2014/7/25.
//  Copyright (c) 2014年 iOSTeam. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FamilySellObject.h"
@interface FamilyCollectionCell : UICollectionViewCell
+ (CGSize)getCellSizeFromIdentifer:(NSString *)identifer andData:(FamilySellObject*)data;
- (void)setDataFromIdentifer:(NSString *)identifer andData:(FamilySellObject*)data;
@end
