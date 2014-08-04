//
//  BBCatchFileController.m
//  TableViewDemo
//
//  Created by Mac on 2014/8/4.
//  Copyright (c) 2014年 iOSTeam. All rights reserved.
//

#import "BBCatchFileController.h"

@implementation BBCatchFileController
+ (void)catchFileWithData:(NSMutableData*)data andName:(NSString*)name{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *filePath = [NSString stringWithFormat:@"%@/%@", documentsDirectory, [self toBase64String:name]];
    
    if (![[NSFileManager defaultManager] fileExistsAtPath:filePath]) {
        // if file is not exist, create it.
        [data writeToFile:filePath atomically:YES];
    }
}
+ (NSData*)readCatchWithName:(NSString*)name{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *filePath = [NSString stringWithFormat:@"%@/%@", documentsDirectory, [self toBase64String:name]];
    if([[NSFileManager defaultManager] fileExistsAtPath:filePath isDirectory:NO]){
        return [NSData dataWithContentsOfFile:filePath];
    }
    return nil;
}
+ (NSString *)toBase64String:(NSString *)string {
    NSData *plainData = [string dataUsingEncoding:NSUTF8StringEncoding];
    NSString *base64String = [plainData base64EncodedStringWithOptions:0];
    return base64String;
}
@end
