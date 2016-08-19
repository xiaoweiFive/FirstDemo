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
    [self setNav];
}


- (void)setNav{
    self.navigationItem.title = @"";
    
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageWithColor:[UIColor yellowColor]] forBarMetrics:UIBarMetricsDefault];
    
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithTarget:self action:@selector(clickLeftBtn) icon:@"scan_icon" hightLightIcon:@"scan_icon"];

    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithTarget:self action:@selector(clickRightBtn) icon:@"icon_fishpond_search" hightLightIcon:@"icon_fishpond_search"];
    
}


- (void)clickLeftBtn{
    MYLog(@"2834023984992843");
}

- (void)clickRightBtn{
    productClassViewController *productClass = [[productClassViewController alloc]init];
    [self.navigationController pushViewController:productClass animated:YES];
}


@end
