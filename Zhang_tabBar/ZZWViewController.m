//
//  ZZWViewController.m
//  Zhang_tabBar
//
//  Created by zhangzhenwei on 16/8/19.
//  Copyright © 2016年 zhangzhenwei. All rights reserved.
//

#import "ZZWViewController.h"

@interface ZZWViewController ()

@end

@implementation ZZWViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addBackView];

}

- (void)addBackView
{
    CGFloat imageWith = 140.0;
    _backView  = [[UIView alloc]initWithFrame:self.view.frame];
    
    UIImageView *imageView;
    if (iPhone4) {
        imageView = [[UIImageView alloc]initWithFrame:CGRectMake((kDeviceWidth - imageWith) / 2 , 144 - 64 - 40, imageWith, imageWith)];
    }else{
        imageView = [[UIImageView alloc]initWithFrame:CGRectMake((kDeviceWidth - imageWith) / 2 , 144 - 64, imageWith, imageWith)];
    }
    
    _BCimageView = imageView;
    _BCimageView.hidden = YES;
    [_backView addSubview:imageView];
    
    UILabel *detailLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(_BCimageView.frame) + 20, kDeviceWidth, 44)];
    _BCDetailLabel = detailLabel;
    _BCDetailLabel.hidden = YES;
    detailLabel.textColor = [UIColor lightGrayColor];
    [detailLabel setTextAlignment:NSTextAlignmentCenter];
    detailLabel.font = [UIFont systemFontOfSize:15];
    _backView.backgroundColor =[UIColor whiteColor];
    [_backView addSubview:detailLabel];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    _btn = btn;
    //    btn.frame = CGRectMake(imageView.frame.origin.x, CGRectGetMaxY(detailLabel.frame) + 20, imageWith, 44);
    btn.frame = CGRectMake(15, KDeviceHeight - 20 - 40 - 64, kDeviceWidth - 30, 40);
    [btn setTitle:@"重新加载" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    btn.backgroundColor = QSCTextColor;
    btn.layer.cornerRadius = 20;
    //    [btn.layer setBorderWidth:1];
    //    btn.layer.borderColor = [[UIColor lightGrayColor] CGColor]; // 边框颜色
    btn.layer.masksToBounds = YES;
    
    btn.hidden = YES;
    [_backView addSubview:btn];
    
    [btn addTarget:self action:@selector(reloadTheData) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:_backView];
    _backView.hidden = YES;
}



- (void)showBackViewWithNoListImage:(BOOL)show detailMessage:(NSString *)message imageName:(NSString *)imageName
{
    [self.view bringSubviewToFront:_backView];
    if (show == YES) {
        _backView.hidden = NO;
        _BCimageView.hidden = NO;
        _BCDetailLabel.hidden = NO;
        _BCimageView.image = [UIImage imageNamed:imageName];
        _btn.hidden = YES;
        _BCDetailLabel.text = message;
    }else if(show == NO){
        _backView.hidden = NO;
        _BCimageView.hidden = YES;
        _BCDetailLabel.hidden = NO;
        _BCDetailLabel.frame = CGRectMake(0, 100, kDeviceWidth, 44);
        _BCDetailLabel.text = message;
        _btn.hidden = YES;
    }
}

- (void)showBackViewWithNoListImage:(BOOL)show detailMessage:(NSString *)message imageName:(NSString *)imageName btnHidden:(BOOL)hidden
{
    [self.view bringSubviewToFront:_backView];
    if (show == YES) {
        _backView.hidden = NO;
        _BCimageView.hidden = NO;
        _BCDetailLabel.hidden = NO;
        _BCDetailLabel.frame = CGRectMake(0, CGRectGetMaxY(_BCimageView.frame) + 20, kDeviceWidth, 44);
        _BCimageView.image = [UIImage imageNamed:imageName];
        _btn.hidden = hidden;
        _BCDetailLabel.text = message;
    }else if(show == NO){
        _backView.hidden = NO;
        _BCimageView.hidden = YES;
        _BCDetailLabel.hidden = NO;
        _BCDetailLabel.frame = CGRectMake(0, 100, kDeviceWidth, 44);
        _BCDetailLabel.text = message;
        _btn.hidden = hidden;
    }
    
}


@end














@implementation ZZWTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addBackView];
    
}

- (void)addBackView
{
    CGFloat imageWith = 140.0;
    _backView  = [[UIView alloc]initWithFrame:self.view.frame];
    
    UIImageView *imageView;
    if (iPhone4) {
        imageView = [[UIImageView alloc]initWithFrame:CGRectMake((kDeviceWidth - imageWith) / 2 , 144 - 64 - 40, imageWith, imageWith)];
    }else{
        imageView = [[UIImageView alloc]initWithFrame:CGRectMake((kDeviceWidth - imageWith) / 2 , 144 - 64, imageWith, imageWith)];
    }
    
    _BCimageView = imageView;
    _BCimageView.hidden = YES;
    [_backView addSubview:imageView];
    
    UILabel *detailLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(_BCimageView.frame) + 20, kDeviceWidth, 44)];
    _BCDetailLabel = detailLabel;
    _BCDetailLabel.hidden = YES;
    detailLabel.textColor = [UIColor lightGrayColor];
    [detailLabel setTextAlignment:NSTextAlignmentCenter];
    detailLabel.font = [UIFont systemFontOfSize:15];
    _backView.backgroundColor =[UIColor whiteColor];
    [_backView addSubview:detailLabel];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    _btn = btn;
    //    btn.frame = CGRectMake(imageView.frame.origin.x, CGRectGetMaxY(detailLabel.frame) + 20, imageWith, 44);
    btn.frame = CGRectMake(15, KDeviceHeight - 20 - 40 - 64, kDeviceWidth - 30, 40);
    [btn setTitle:@"重新加载" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    btn.backgroundColor = QSCTextColor;
    btn.layer.cornerRadius = 20;
    //    [btn.layer setBorderWidth:1];
    //    btn.layer.borderColor = [[UIColor lightGrayColor] CGColor]; // 边框颜色
    btn.layer.masksToBounds = YES;
    
    btn.hidden = YES;
    [_backView addSubview:btn];
    
    [btn addTarget:self action:@selector(reloadTheData) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:_backView];
    _backView.hidden = YES;
}



- (void)showBackViewWithNoListImage:(BOOL)show detailMessage:(NSString *)message imageName:(NSString *)imageName
{
    [self.view bringSubviewToFront:_backView];
    if (show == YES) {
        _backView.hidden = NO;
        _BCimageView.hidden = NO;
        _BCDetailLabel.hidden = NO;
        _BCimageView.image = [UIImage imageNamed:imageName];
        _btn.hidden = YES;
        _BCDetailLabel.text = message;
    }else if(show == NO){
        _backView.hidden = NO;
        _BCimageView.hidden = YES;
        _BCDetailLabel.hidden = NO;
        _BCDetailLabel.frame = CGRectMake(0, 100, kDeviceWidth, 44);
        _BCDetailLabel.text = message;
        _btn.hidden = YES;
    }
}

- (void)showBackViewWithNoListImage:(BOOL)show detailMessage:(NSString *)message imageName:(NSString *)imageName btnHidden:(BOOL)hidden
{
    [self.view bringSubviewToFront:_backView];
    if (show == YES) {
        _backView.hidden = NO;
        _BCimageView.hidden = NO;
        _BCDetailLabel.hidden = NO;
        _BCDetailLabel.frame = CGRectMake(0, CGRectGetMaxY(_BCimageView.frame) + 20, kDeviceWidth, 44);
        _BCimageView.image = [UIImage imageNamed:imageName];
        _btn.hidden = hidden;
        _BCDetailLabel.text = message;
    }else if(show == NO){
        _backView.hidden = NO;
        _BCimageView.hidden = YES;
        _BCDetailLabel.hidden = NO;
        _BCDetailLabel.frame = CGRectMake(0, 100, kDeviceWidth, 44);
        _BCDetailLabel.text = message;
        _btn.hidden = hidden;
    }
    
}


- (void)hiddenBackgroundView:(BOOL)hidden
{
    if (hidden == YES) {
        _backView.hidden = YES;
    }else{
        _backView.hidden = NO;
    }
    
}



@end

