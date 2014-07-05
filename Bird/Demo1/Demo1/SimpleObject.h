//
//  SimpleObject.h
//  Demo1
//
//  Created by Mac on 2014/6/2.
//  Copyright (c) 2014年 iOSTeam. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SimpleObject : NSObject
{
    int b;
}
@property int a;
@property (nonatomic,strong) NSObject *obj;
- (int)getSumX:(int)x andY:(int)y;
- (double)countPlusFrom:(int)fromNum to:(int)toNum;
+ (int)count10Plus10;
@end
