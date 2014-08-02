//
//  BBDataParser.h
//  TableViewDemo
//
//  Created by Mac on 2014/8/1.
//  Copyright (c) 2014年 iOSTeam. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BBDataObject.h"
@interface BBDataParser : NSObject
+(NSMutableArray*)getDataObjectsWithDefaultData:(NSData*)data;
@end
