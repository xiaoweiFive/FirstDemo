
//
//  ZZWGlobal.m
//  Zhang_tabBar
//
//  Created by zhangzhenwei on 16/8/22.
//  Copyright © 2016年 zhangzhenwei. All rights reserved.
//

#import "ZZWGlobal.h"

@implementation ZZWGlobal

+ (ZZWGlobal *)shareQSCGlobal
{
    static dispatch_once_t pred = 0;
    __strong static id sharedObject = nil;
    dispatch_once(&pred, ^{
        sharedObject = [[self alloc] init];
    });
    
    return sharedObject;
}

@end
