//
//  BBDataParser.m
//  BirdDemo_onCLass
//
//  Created by Mac on 2014/8/2.
//  Copyright (c) 2014年 iOSTeam. All rights reserved.
//

#import "BBDataParser.h"
#import "BBCellDataObject.h"
@implementation BBDataParser
+(id)JSONValue:(NSData*)data
{
    id result = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
    return result;
}
+ (NSMutableArray*)parseData:(NSData*)data{
    NSMutableArray *returnArray = [NSMutableArray new];
    NSDictionary *jsonObj = [[self class] JSONValue:data];
    
    NSArray *arr = [jsonObj objectForKey:@"data"];
    
    for (int i = 0; i < arr.count; i++) {
        BBCellDataObject *cellObj = [BBCellDataObject new];
        NSDictionary *dic1 = arr[i];
        NSDictionary *userDic  = [dic1 objectForKey:@"user"];
        //get title
        cellObj.title = [userDic objectForKey:@"username"];
        //get img url
        cellObj.imgURL = [[userDic objectForKey:@"avatar_image"] objectForKey:@"url"];
        //get content
        cellObj.content = [dic1 objectForKey:@"text"];
        //get detail url
        cellObj.detailURL = [dic1 objectForKey:@"canonical_url"];
        
        [returnArray addObject:cellObj];
    }
    return returnArray;
}

@end
