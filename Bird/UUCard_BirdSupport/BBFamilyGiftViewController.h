//
//  BBFamilyGiftViewController.h
//  UUCard_BirdSupport
//
//  Created by Bird on 2014/7/25.
//  Copyright (c) 2014年 iOSTeam. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FamilySellObject.h"
@interface BBFamilyGiftViewController : UIViewController<UICollectionViewDataSource,UICollectionViewDelegate>
@property (nonatomic,strong)FamilySellObject *dataObject;
@property (nonatomic,strong)UIImage *bgImage;
@end
