//
//  FamilySellObject.h
//  mobileInfo
//
//  Created by IOS DEV on 2014/7/23.
//  Copyright (c) 2014年 com.easycard. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FamilySellObject : NSObject

@property int promoType;
@property(strong, atomic) NSString* actionCode;
@property(strong, atomic) NSString* actionName;//活動名稱
@property(strong, atomic) NSString* actionDesc;//活動說明
@property(strong, atomic) NSString* actionProcess;//活動進度
@property(strong, atomic) NSString* actionStart;//活動開始時間
@property(strong, atomic) NSString* actionEnd;//活動結束時間
@property(strong, atomic) NSString* exchangeStart;//兌換開始時間
@property(strong, atomic) NSString* exchangeEnd;//兌換結束時間
@property(strong, atomic) NSString* exchangeMethod;//兌換方式
@property int serNumQrt;
@property int pointQrt;
@property(strong, atomic) NSString* website;//兌換網址
@property BOOL isSerialAccord;//有沒有符合序號
@property BOOL isPointAccord;//有沒有符合貼紙
@end
