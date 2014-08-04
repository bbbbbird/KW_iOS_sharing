//
//  BBCatchFileController.h
//  TableViewDemo
//
//  Created by Mac on 2014/8/4.
//  Copyright (c) 2014年 iOSTeam. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BBCatchFileController : NSObject
+ (void)catchFileWithData:(NSMutableData*)data andName:(NSString*)name;
+ (NSData*)readCatchWithName:(NSString*)name;
@end
