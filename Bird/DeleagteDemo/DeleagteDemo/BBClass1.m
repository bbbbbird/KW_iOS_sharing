//
//  BBClass1.m
//  DeleagteDemo
//
//  Created by Mac on 2014/7/16.
//  Copyright (c) 2014年 iOSTeam. All rights reserved.
//

#import "BBClass1.h"

@implementation BBClass1
- (void)speakTruth{
    for(int i = 0; i < 10000;i++){
         NSLog(@"鳥哥好帥 (%i次)",i + 1);
    }
    //callBack
    if (_deleagte) {
        [_deleagte whenSpeakTruthDone];
    }
}
@end
