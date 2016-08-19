//
//  zzwTabbar.h
//  Zhang_tabBar
//
//  Created by zhangzhenwei on 16/8/17.
//  Copyright © 2016年 zhangzhenwei. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "zzwPlusButton.h"

@class zzwTabbar;

@protocol ZZWTabBarDelegate <NSObject>

- (void)pathButton:(zzwTabbar *)zzwTabBar clickItemButtonAtIndex:(NSInteger )itemButtonIndex;


@end


@interface zzwTabbar : UITabBar


@property (nonatomic, assign)id<ZZWTabBarDelegate> delegate;

/** 所有的弹出按钮 */
@property (nonatomic, strong)NSArray *itemButtonArray;

/** 弹出动画时间*/
@property (assign, nonatomic) NSTimeInterval basicDuration;

/** 设置弹出时是否旋转   */
@property (assign, nonatomic) BOOL allowSubItemRotation;

/**  设置底部弹出的半径，默认是105 */
@property (assign, nonatomic) CGFloat bloomRadius;

/**  设置散开的角度 */
@property (assign, nonatomic) CGFloat bloomAngel;

/**  设置中间的按钮是否旋转 */
@property (assign, nonatomic) BOOL allowCenterButtonRotation;




@end
