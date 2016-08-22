//
//  CustomTabBarViewController.m
//  Zhang_tabBar
//
//  Created by zhangzhenwei on 16/8/17.
//  Copyright © 2016年 zhangzhenwei. All rights reserved.
//


#import "CustomTabBarViewController.h"
#import "zzwTabbar.h"
#import "zzwItemButton.h"
#import "ZZWNavViewController.h"

#import "HomeController.h"
#import "fishController.h"
#import "meController.h"
#import "messageController.h"
#import "UIImage+Image.h"

@interface CustomTabBarViewController ()<ZZWTabBarDelegate>

@end

@implementation CustomTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpchildVC];
    [self configureZYPathButton];
    
    // 2.隐藏tabbar默认线条
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 6)
    {
        [[UITabBar appearance] setShadowImage:[[UIImage alloc] init]];
        UIImage* tabBarBackground = [UIImage createImageWithColor:RGB(255, 255, 255)];
        
        //        [UIImage imageNamed:@"tabarBackground"];
        
        [[UITabBar appearance] setBackgroundImage:tabBarBackground];//设置背景，修改颜色是没有用的
        
        [[UITabBar appearance] setSelectionIndicatorImage:tabBarBackground];
    }

}

- (void)configureZYPathButton {
    zzwTabbar *tabBar = [zzwTabbar new];
    tabBar.delegate = self;
    zzwItemButton *itemButton_1 = [[zzwItemButton alloc]initWithImage:[UIImage imageNamed:@"chooser-moment-icon-music"]highlightedImage:[UIImage imageNamed:@"chooser-moment-icon-music-highlighted"]backgroundImage:[UIImage imageNamed:@"chooser-moment-button"]backgroundHighlightedImage:[UIImage imageNamed:@"chooser-moment-button-highlighted"] andTitle:@"音乐"];
    zzwItemButton *itemButton_2 = [[zzwItemButton alloc]initWithImage:[UIImage imageNamed:@"chooser-moment-icon-place"]highlightedImage:[UIImage imageNamed:@"chooser-moment-icon-place-highlighted"]backgroundImage:[UIImage imageNamed:@"chooser-moment-button"]backgroundHighlightedImage:[UIImage imageNamed:@"chooser-moment-button-highlighted"] andTitle:@"位置"];
    
    zzwItemButton *itemButton_3 = [[zzwItemButton alloc]initWithImage:[UIImage imageNamed:@"chooser-moment-icon-camera"]highlightedImage:[UIImage imageNamed:@"chooser-moment-icon-camera-highlighted"]backgroundImage:[UIImage imageNamed:@"chooser-moment-button"]backgroundHighlightedImage:[UIImage imageNamed:@"chooser-moment-button-highlighted"] andTitle:@"相册"];
    
    zzwItemButton *itemButton_4 = [[zzwItemButton alloc]initWithImage:[UIImage imageNamed:@"chooser-moment-icon-thought"]highlightedImage:[UIImage imageNamed:@"chooser-moment-icon-thought-highlighted"]backgroundImage:[UIImage imageNamed:@"chooser-moment-button"]backgroundHighlightedImage:[UIImage imageNamed:@"chooser-moment-button-highlighted"] andTitle:nil];
    
    zzwItemButton *itemButton_5 = [[zzwItemButton alloc]initWithImage:[UIImage imageNamed:@"chooser-moment-icon-sleep"]highlightedImage:[UIImage imageNamed:@"chooser-moment-icon-sleep-highlighted"]backgroundImage:[UIImage imageNamed:@"chooser-moment-button"]backgroundHighlightedImage:[UIImage imageNamed:@"chooser-moment-button-highlighted"] andTitle:@"夜间"];
    tabBar.itemButtonArray = @[itemButton_1 , itemButton_2 , itemButton_3, itemButton_4 , itemButton_5];
    tabBar.basicDuration = 0.5;
    tabBar.allowSubItemRotation = YES;
    tabBar.bloomRadius = 100;
    tabBar.allowCenterButtonRotation = YES;
    tabBar.bloomAngel = 120;
    //kvc实质是修改了系统的_tabBar
    [self setValue:tabBar forKeyPath:@"tabBar"];
    
}


- (void)setUpchildVC {
    [super viewDidLoad];

    HomeController *homeVC = [[HomeController alloc]init];
    [self setUpChildVC:homeVC angImage:@"home_normal" selectedImage:@"home_highlight" andTitle:@"首页"];
    
    fishController *dymicVC = [[fishController alloc]init];
    [self setUpChildVC:dymicVC angImage:@"mycity_normal" selectedImage:@"mycity_highlight" andTitle:@"动态"];
    
    meController *messageVC = [[meController alloc]init];
    [self setUpChildVC:messageVC angImage:@"message_normal" selectedImage:@"message_highlight" andTitle:@"消息"];
    
    messageController *meVC = [[messageController alloc]init];
    [self setUpChildVC:meVC angImage:@"account_normal" selectedImage:@"account_highlight" andTitle:@"我的"];
}


- (void)setUpChildVC:(UIViewController *)VC angImage:(NSString *)image selectedImage:(NSString *)selectedImage andTitle:(NSString *)title
{
    ZZWNavViewController *nav = [[ZZWNavViewController alloc]initWithRootViewController:VC];
    nav.view.backgroundColor = [UIColor lightGrayColor];
    //[self randomColor];
    nav.tabBarItem.title = title;
    nav.tabBarItem.image = [UIImage imageNamed:image];
    
    // 如果是iOS7，不要渲染选中的图片
    if (iOS7) {
        nav.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    } else {
        nav.tabBarItem.selectedImage = [UIImage imageNamed:selectedImage];
    }
    
    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                                       [UIColor lightGrayColor], UITextAttributeTextColor,
                                                       nil] forState:UIControlStateNormal];
    UIColor *titleHighlightedColor = [UIColor blackColor];
    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                                       titleHighlightedColor, UITextAttributeTextColor,
                                                       nil] forState:UIControlStateSelected];
    [self addChildViewController:nav];

}



- (UIColor *)randomColor
{
    CGFloat r = arc4random_uniform(256);
    CGFloat g = arc4random_uniform(256);
    CGFloat b = arc4random_uniform(256);
    return [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1.0];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)pathButton:(zzwTabbar *)zzwTabBar clickItemButtonAtIndex:(NSInteger )itemButtonIndex
{
    NSLog(@" 点中了第%ld个按钮" , itemButtonIndex);
//    UINavigationController *Vc = [[UINavigationController alloc]initWithRootViewController:[ZYNewViewController new]];
//    Vc.view.backgroundColor = [self randomColor];
//    [self presentViewController:Vc animated:YES completion:nil];
}

@end
