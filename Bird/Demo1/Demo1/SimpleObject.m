//
//  SimpleObject.m
//  Demo1
//
//  Created by Mac on 2014/6/2.
//  Copyright (c) 2014年 iOSTeam. All rights reserved.
//

#import "SimpleObject.h"

@implementation SimpleObject

- (int)getSumX:(int)x andY:(int)y{
    return x + y;
}
- (double)countPlusFrom:(int)fromNum to:(int)toNum{
    double retValue = 0;
    for (int i = fromNum; i <= toNum; i++) {
        retValue += i;
    }
    return retValue;
}
+ (int)count10Plus10{
    return 10 + 10;
}
@end
