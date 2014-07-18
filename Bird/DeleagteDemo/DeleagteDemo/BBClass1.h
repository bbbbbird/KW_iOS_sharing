//
//  BBClass1.h
//  DeleagteDemo
//
//  Created by Mac on 2014/7/16.
//  Copyright (c) 2014年 iOSTeam. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BBClass1Protocol.h"
@interface BBClass1 : NSObject
{
    
}
@property (nonatomic,weak)id<BBClass1Protocol> deleagte;
- (void)speakTruth;
@end
