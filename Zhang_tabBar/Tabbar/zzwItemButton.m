//
//  zzwItemButton.m
//  Zhang_tabBar
//
//  Created by zhangzhenwei on 16/8/17.
//  Copyright © 2016年 zhangzhenwei. All rights reserved.
//

#import "zzwItemButton.h"


@interface zzwItemButton()

@property (strong, nonatomic) UIImageView *backgroundImageView;
@property (strong, nonatomic) UILabel *titleLable;

@end

@implementation zzwItemButton


-(instancetype)initWithImage:(UIImage *)image highlightedImage:(UIImage *)highlightedImage backgroundImage:(UIImage *)backgroundImage backgroundHighlightedImage:(UIImage *)backgroundHighlightedImage  andTitle:(NSString *)title
{
    if (self = [super init]) {
        CGRect itemFrame = CGRectMake(0, 0, backgroundImage.size.width, backgroundImage.size.height);
        if (!backgroundImage || !backgroundHighlightedImage) {
            itemFrame = CGRectMake(0, 0, image.size.width, image.size.height);
        }
        
        self.frame = itemFrame;
        
        
        //设置背景图片
        [self setImage:backgroundImage forState:UIControlStateNormal];
        [self setImage:backgroundHighlightedImage forState:UIControlStateHighlighted];
        
        //设置该button 的图片
        _backgroundImageView = [[UIImageView alloc]initWithImage:image
                                                highlightedImage:highlightedImage];
        

        if (!title.length) {
            _backgroundImageView.center = CGPointMake(self.bounds.size.width/2, self.bounds.size.height/2);
        }else{
//            _backgroundImageView.center = CGPointMake(self.bounds.size.width/2, self.bounds.size.height/2);
            _titleLable = [[UILabel alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(_backgroundImageView.frame), self.bounds.size.width, image.size.height/2)];
            _titleLable.font = [UIFont systemFontOfSize:9];
            _titleLable.textAlignment = NSTextAlignmentCenter;
            _titleLable.text = title;
            [self addSubview:_titleLable];
        }
//        _titleLable = [[UILabel alloc]initWithFrame:CGRectMake(0, backgroundImage.size.height, self.bounds.size.width, 20)];
//        _titleLable.font = [UIFont systemFontOfSize:9];
//        _titleLable.textAlignment = NSTextAlignmentCenter;
//        _titleLable.text = title;
//        [self addSubview:_titleLable];

        [self addSubview:_backgroundImageView];
        
        [self addTarget:_delegate action:@selector(itemButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return self;
}

@end
