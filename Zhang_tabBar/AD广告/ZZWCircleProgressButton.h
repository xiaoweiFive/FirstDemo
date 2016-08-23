//
//  ZZWCircleProgressButton.h
//  Zhang_tabBar
//
//  Created by zhangzhenwei on 16/8/23.
//  Copyright © 2016年 zhangzhenwei. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^DrawCircleProgressBlock)(void);


@interface ZZWCircleProgressButton : UIButton



@property (nonatomic, strong)UIColor *trackColor;


@property (nonatomic, strong)UIColor *progressColor;

//填充色
@property (nonatomic, strong)UIColor *fillColor;

//宽度
@property (nonatomic,assign)CGFloat    lineWidth;

//时长
@property (nonatomic,assign)CGFloat    animationDuration;


- (void)startAnimationDuration:(CGFloat) duration withBlock:(DrawCircleProgressBlock) block;

@end
