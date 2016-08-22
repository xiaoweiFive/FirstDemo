//
//  zzwTabbar.m
//  Zhang_tabBar
//
//  Created by zhangzhenwei on 16/8/17.
//  Copyright © 2016年 zhangzhenwei. All rights reserved.
//

#import "zzwTabbar.h"
#import "UIView+LBExtension.h"

#import "ZZWGlobal.h"

#define Magin 10

@interface zzwTabbar()<zzwPlusButtonDelegate>
@property (nonatomic, strong) zzwPlusButton *plusBtn;

@end


@implementation zzwTabbar


//对按钮的一些基本设置
- (void)setUpPathButton:(zzwPlusButton *)pathButton {
    pathButton.delegate = self;
    pathButton.bloomRadius = self.bloomRadius;
    pathButton.allowCenterButtonRotation = self.allowCenterButtonRotation;
    pathButton.bottomViewColor = [UIColor clearColor];
    pathButton.bloomDirection = kzzwPlusButtonBloomDirectionTop;
    pathButton.basicDuration = self.basicDuration;
    pathButton.bloomAngel = self.bloomAngel;
    pathButton.allowSounds = NO;
}

//重新绘制  自定义中间的按钮 以及 参数的配置
- (void)drawRect:(CGRect)rect {
    
    self.plusBtn = [[zzwPlusButton alloc]initWithCenterImage:[UIImage imageNamed:@"chooser-button-tab"]highlightedImage:[UIImage imageNamed:@"chooser-button-tab"]];
    self.plusBtn.delegate = self;
    [ZZWGlobal shareQSCGlobal].plusBtn = self.plusBtn ;
    
    [self setUpPathButton:self.plusBtn];
    self.plusBtn.ZYButtonCenter = CGPointMake(self.centerX, self.superview.height - 49);
    [self.plusBtn addPathItems:self.itemButtonArray];
    //必须加到父视图上
    [self.superview addSubview:self.plusBtn];

    
//    
//    UIButton *plusBtn = [UIButton buttonWithType:UIButtonTypeCustom];
//    [plusBtn setBackgroundImage:[UIImage imageNamed:@"post_normal"] forState:UIControlStateNormal];
//    [plusBtn setTitle:@"发布" forState:UIControlStateNormal];
//    [plusBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//    
//    plusBtn.titleLabel.font = [UIFont systemFontOfSize:10];
//    plusBtn.titleEdgeInsets = UIEdgeInsetsMake(78, 0, 0, 0);
//    plusBtn.size = plusBtn.currentBackgroundImage.size;
////    [plusBtn addTarget:self action:@selector(plusClick) forControlEvents:UIControlEventTouchUpInside];
//    [self addSubview:plusBtn];
//    self.plusBtn = plusBtn;
//    //1.设置自定义按钮的位置
//    self.plusBtn.centerX = self.width*0.5;
//    self.plusBtn.y = -25;

}


//重新布局，为中间的按钮留有位置
-(void)layoutSubviews{
    [super layoutSubviews];
    
    self.backgroundColor = [UIColor whiteColor];
    Class class = NSClassFromString(@"UITabBarButton");
    int btnIndex = 0;
    for (UIView *btn in self.subviews) {
        if ([btn isKindOfClass:class]) {
            btn.width = self.width*0.2;
            btn.x = btn.width*btnIndex;
            btnIndex++;
            if (btnIndex == 2) {
                btnIndex++;
            }

        }
    }  
    
}


- (void)pathButton:(zzwPlusButton *)zzwTabBar clickItemButtonAtIndex:(NSInteger )itemButtonIndex;
{
    if ([self.delegate respondsToSelector:@selector(pathButton:clickItemButtonAtIndex:)]) {
        [self.delegate pathButton:self clickItemButtonAtIndex:itemButtonIndex];
    }
}

@end
