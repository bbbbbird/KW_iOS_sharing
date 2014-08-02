//
//  BBFamilyStickerViewController.h
//  UUCard_BirdSupport
//
//  Created by Bird on 2014/7/28.
//  Copyright (c) 2014年 iOSTeam. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FamilySellObject.h"
@interface BBFamilyStickerViewController : UIViewController<UICollectionViewDataSource,UICollectionViewDelegate>
@property (nonatomic,strong) FamilySellObject *dataObject;
@property (nonatomic,strong)UIImage *bgImage;
@end
