//
//  BBDataParser.m
//  TableViewDemo
//
//  Created by Mac on 2014/8/1.
//  Copyright (c) 2014年 iOSTeam. All rights reserved.
//

#import "BBDataParser.h"

@implementation BBDataParser
+(id)JSONValue:(NSData*)data
{
    id result = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
    return result;
}
+(NSMutableArray*)getDataObjectsWithDefaultData:(NSData*)data{
    NSMutableArray *retArray = [NSMutableArray new];
    NSDictionary *step1Dic = [BBDataParser JSONValue:data];
    NSArray *setp1DataArray = [step1Dic objectForKey:@"data"];
    for (int i = 0; i < setp1DataArray.count; i++) {
        BBDataObject *targetDataObject = [BBDataObject new];
        NSDictionary *singleDic = setp1DataArray[i];
        //get user name
        NSDictionary *userDic = [singleDic objectForKey:@"user"];
        targetDataObject.name = [userDic objectForKey:@"name"];
        //get img url
        NSDictionary *imgDic = [userDic objectForKey:@"avatar_image"];
        targetDataObject.imgUrl = [imgDic objectForKey:@"url"];
        //get content
        targetDataObject.content = [singleDic objectForKey:@"text"];
        //message time
        targetDataObject.messageTime = [singleDic objectForKey:@"created_at"];
        targetDataObject.contentURL = [singleDic objectForKey:@"canonical_url"];
        [retArray addObject:targetDataObject];
    }
    return retArray;
}
@end
