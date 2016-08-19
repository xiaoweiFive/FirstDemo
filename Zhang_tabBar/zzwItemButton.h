//
//  zzwItemButton.h
//  Zhang_tabBar
//
//  Created by zhangzhenwei on 16/8/17.
//  Copyright © 2016年 zhangzhenwei. All rights reserved.
//






#import <UIKit/UIKit.h>
@class zzwItemButton;


@protocol ZZWItemButtonDelegate <NSObject>

-(void)itemButtonTapped:(zzwItemButton *)itemButton;

@end


@interface zzwItemButton : UIButton



@property (nonatomic, assign) NSUInteger index;

@property (nonatomic, assign)id<ZZWItemButtonDelegate> delegate;



- (instancetype)initWithImage:(UIImage *)image
             highlightedImage:(UIImage *)highlightedImage
              backgroundImage:(UIImage *)backgroundImage
   backgroundHighlightedImage:(UIImage *)backgroundHighlightedImage
                     andTitle:(NSString *)title;


@end
