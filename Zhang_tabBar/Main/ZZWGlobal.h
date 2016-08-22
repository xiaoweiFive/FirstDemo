//
//  ZZWGlobal.h
//  Zhang_tabBar
//
//  Created by zhangzhenwei on 16/8/22.
//  Copyright © 2016年 zhangzhenwei. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "zzwPlusButton.h"


@interface ZZWGlobal : NSObject


@property (nonatomic, strong) zzwPlusButton *plusBtn;

+ (ZZWGlobal *)shareQSCGlobal;

@end
