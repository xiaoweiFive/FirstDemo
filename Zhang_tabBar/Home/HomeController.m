//
//  HomeController.m
//  Zhang_tabBar
//
//  Created by zhangzhenwei on 16/8/19.
//  Copyright © 2016年 zhangzhenwei. All rights reserved.
//

#import "HomeController.h"
#import "UIImage+Extension.h"
#import "UIBarButtonItem+myAdd.h"
#import "productClassViewController.h"


@implementation HomeController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self setNav];
}


- (void)setNav{
    self.navigationItem.title = @"";
    
//    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageWithColor:[UIColor yellowColor]] forBarMetrics:UIBarMetricsDefault];
    
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithTarget:self action:@selector(clickLeftBtn) icon:@"scan_icon" hightLightIcon:@"scan_icon"];

    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithTarget:self action:@selector(clickRightBtn) icon:@"icon_fishpond_search" hightLightIcon:@"icon_fishpond_search"];
    
}


- (void)clickLeftBtn{
    MYLog(@"2834023984992843");
}

- (void)clickRightBtn{
    productClassViewController *productClass = [[productClassViewController alloc]init];
    
    /*
       神技能  
     
     获取到当前页面所有导航栏对应的控制器列表，当把本页面控制器，也就是self删除的时候，push到下一个页面，则当前控制器已不存在，自然左上角按钮不会出现，这是从根本上彻底删除的方法
     
    NSMutableArray *mArray =[self.navigationController.viewControllers mutableCopy];
    [mArray removeObject:self];
    [mArray addObject:productClass];
    [self.navigationController setViewControllers:mArray animated:YES];
   */
    
    [self.navigationController pushViewController:productClass animated:YES];
}


@end
