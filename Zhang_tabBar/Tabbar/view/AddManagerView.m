//
//  AddManagerView.m
//  XianYu
//
//  Created by zhangzhenwei on 16/8/23.
//  Copyright © 2016年 li  bo. All rights reserved.
//


#define WINDOW [[[UIApplication sharedApplication] delegate] window]
#define kDeviceWidth [UIScreen mainScreen].bounds.size.width
#define kDeviceScale [UIScreen mainScreen].scale
#define kDeviceWidthPoint (kDeviceWidth * kDeviceScale)
#define KDeviceHeight [[[UIDevice currentDevice] systemVersion] floatValue] < 7.0?[UIScreen mainScreen].bounds.size.height - 20 : [UIScreen mainScreen].bounds.size.height

#import "AddManagerView.h"


@interface AddManagerView()<UIGestureRecognizerDelegate>{
    UITapGestureRecognizer *_tapGesture;
    UIView *_backgroundView;
    UIButton *_pathCenterButton;
    NSMutableArray *_array;
}

@end

@implementation AddManagerView


-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self setup];
    }
    return self;
}

-(void)loadDataSource{
    NSMutableArray *array = [NSMutableArray array];
    [array addObject:@"pengyouquan.png"];
    [array addObject:@"QQfirend.png"];
    [array addObject:@"sinaWeiBo.png"];
    [array addObject:@"QQkongjian.png"];
    _array = array;
}


-(void)setup{
    
    [self loadDataSource];
    CGRect frame = [UIScreen mainScreen].bounds;
    self.frame = frame;

    //遮盖
    _backgroundView = [[UIView alloc] initWithFrame:frame];
    _backgroundView.backgroundColor = [UIColor lightGrayColor];
    
    
    UIView *bottomView = [[UIView alloc]initWithFrame:CGRectMake(0, [UIScreen mainScreen].bounds.size.height-50, [UIScreen mainScreen].bounds.size.width, 50)];
    bottomView.backgroundColor = [UIColor whiteColor];
    [_backgroundView addSubview:bottomView];
    
    
    _pathCenterButton = [[UIButton alloc] initWithFrame:CGRectMake((kDeviceWidth-30)/2, 10, 30, 30)];
    //    _pathCenterButton.backgroundColor = [UIColor redColor];
    //    _pathCenterButton.center = bottomView.center;
    [_pathCenterButton setImage:[UIImage imageNamed:@"faQiAdd.png"] forState:UIControlStateNormal];
    [_pathCenterButton setImage:[UIImage imageNamed:@"faQiAdd.png"] forState:UIControlStateHighlighted];
    [_pathCenterButton addTarget:self action:@selector(backViewClikc) forControlEvents:UIControlEventTouchUpInside];
    [bottomView addSubview:_pathCenterButton];
    
    //点击事件
    _tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(backViewClikc)];
    _tapGesture.delegate = self;
    [_backgroundView addGestureRecognizer:_tapGesture];
    [self addSubview:_backgroundView];

    [WINDOW addSubview:self];


}

#pragma mark --- 遮盖背景点击方法
- (void)backViewClikc {
    
    [self sildeOut];
}

- (void)sildeIn {
    
    _tapGesture.enabled = YES;
    _backgroundView.alpha = 1.f;
    [UIView animateWithDuration:0.2 delay:0.f options:UIViewAnimationOptionCurveEaseIn animations:^{
        
        _backgroundView.alpha = 1.f;
        
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.1575f
                         animations:^{
                             _pathCenterButton.transform = CGAffineTransformMakeRotation(-0.75f * M_PI);
                         }];
        
        
        CGFloat plain = (kDeviceWidth-50*4)/8;
        for (int i = 0; i<_array.count; i++) {
            UIButton *pathItemButton  = [self btnAnimateWithFrame:CGRectMake((kDeviceWidth-20)/2, _backgroundView.frame.size.height-25, 10, 10)
                                                        imageName:@"img_wechat_logo"
                                                     animateFrame:CGRectMake(plain+(50+2*plain)*i, KDeviceHeight-50-100, 50, 50) delay:0.15*(i+1)];
            
            [pathItemButton setBackgroundImage:[UIImage imageNamed:_array[i]] forState:UIControlStateNormal];
            pathItemButton.tag = i;
            [pathItemButton addTarget:self action:@selector(itemClick:) forControlEvents:UIControlEventTouchUpInside];
            
        }
    }];
    
}

-(void)itemClick:(id)sender
{
    [self sildeOut];

    //通知代理
    if ([self.delegate respondsToSelector:@selector(tabBarDidClickPlusButton:)]) {
        [self.delegate tabBarDidClickPlusButton:sender];
    }
}




-(UIButton *)btnAnimateWithFrame:(CGRect)frame imageName:(NSString *)imageName animateFrame:(CGRect)aniFrame   delay:(CGFloat)delay
{
    UIButton * btn =[[UIButton alloc]init];
    btn.frame = frame;
    btn.alpha = 0;
    [btn setBackgroundImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    [_backgroundView  addSubview:btn];
    
    //距离不同   时间不同    感觉比较融合
    CGFloat time ;
    if (btn.tag == 0 || btn.tag == 3) {
        time = 0.6;
    }else{
        time = 0.4;
    }
    
    [UIView animateWithDuration:time delay:delay usingSpringWithDamping:0.6 initialSpringVelocity:0.25 options:UIViewAnimationOptionAllowUserInteraction animations:^{
        btn.alpha = 1;
        btn.frame  = aniFrame;
        
    } completion:^(BOOL finished) {
        [btn setTitle:[NSString stringWithFormat:@"%ld",(long)btn.tag] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        
        btn.titleLabel.font = [UIFont systemFontOfSize:10];
        btn.titleEdgeInsets = UIEdgeInsetsMake(78, 0, 0, 0);
    }];
    return btn;
    
    //usingSpringWithDamping :弹簧动画的阻尼值，也就是相当于摩擦力的大小，该属性的值从0.0到1.0之间，越靠近0，阻尼越小，弹动的幅度越大，反之阻尼越大，弹动的幅度越小，如果大道一定程度，会出现弹不动的情况。
    //initialSpringVelocity :弹簧动画的速率，或者说是动力。值越小弹簧的动力越小，弹簧拉伸的幅度越小，反之动力越大，弹簧拉伸的幅度越大。这里需要注意的是，如果设置为0，表示忽略该属性，由动画持续时间和阻尼计算动画的效果。
    
}


//渐出
- (void)sildeOut {
    
    _tapGesture.enabled = NO;
    
    [UIView animateWithDuration:0.9 delay:0.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        _pathCenterButton.transform = CGAffineTransformMakeRotation(0);
        
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
        [_backgroundView removeFromSuperview];
    }];
    
    
    for (NSInteger i = 0; i<_backgroundView.subviews.count; i++)
    {
        UIView *view = _backgroundView.subviews[i];
        [view bringSubviewToFront:_pathCenterButton];
        
        if ([view isKindOfClass:[UIButton class]])
        {
            [(UIButton *)view setTitle:@"" forState:UIControlStateNormal];
            [UIView animateWithDuration:0.5 delay:0.5-0.1*i options:UIViewAnimationOptionTransitionCurlDown animations:^{
                view.frame = CGRectMake((kDeviceWidth-20)/2, KDeviceHeight-25, 10, 10);
                view.alpha = 0;
            } completion:^(BOOL finished) {
                
            }];
        }
    }
}


@end
