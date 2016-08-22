//
//  ZZWViewController.h
//  Zhang_tabBar
//
//  Created by zhangzhenwei on 16/8/19.
//  Copyright © 2016年 zhangzhenwei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZZWViewController : UIViewController

@property (nonatomic,strong) UIView *backView;
@property (nonatomic,strong) UIImageView *BCimageView;
@property (nonatomic,strong) UILabel *BCDetailLabel;
@property (nonatomic,strong) UIButton *btn;

- (void)showBackViewWithNoListImage:(BOOL)show detailMessage:(NSString *)message imageName:(NSString *)imageName;
- (void)showBackViewWithNoListImage:(BOOL)show detailMessage:(NSString *)message imageName:(NSString *)imageName btnHidden:(BOOL)hidden;

/**
 *  隐藏背景图
 */
- (void)hiddenBackgroundView:(BOOL)hidden;


@end



@interface ZZWTableViewController : UITableViewController


@property (nonatomic,strong) UIView *backView;
@property (nonatomic,strong) UIImageView *BCimageView;
@property (nonatomic,strong) UILabel *BCDetailLabel;
@property (nonatomic,strong) UIButton *btn;

- (void)showBackViewWithNoListImage:(BOOL)show detailMessage:(NSString *)message imageName:(NSString *)imageName;
- (void)showBackViewWithNoListImage:(BOOL)show detailMessage:(NSString *)message imageName:(NSString *)imageName btnHidden:(BOOL)hidden;

/**
 *  隐藏背景图
 */
- (void)hiddenBackgroundView:(BOOL)hidden;


@end
