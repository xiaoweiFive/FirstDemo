//
//  AddManagerView.h
//  XianYu
//
//  Created by zhangzhenwei on 16/8/23.
//  Copyright © 2016年 li  bo. All rights reserved.
//



/*使用方法  闲鱼目前的样式
 
AddManagerView *addView = [[AddManagerView alloc]initWithFrame:[UIScreen mainScreen].bounds];
addView.delegate = self;
[addView sildeIn];
 
 
 //代理方法
-(void)tabBarDidClickPlusButton:(NSIndexPath *)clickIndex{
    
    NSLog(@"123456866754321456785");
}
 
*/


#import <UIKit/UIKit.h>


@protocol clickBtnDelegate <NSObject>
@optional
-(void)tabBarDidClickPlusButton:(NSIndexPath *)clickIndex;
@end

@interface AddManagerView : UIView

@property (nonatomic, assign)id <clickBtnDelegate> delegate;

- (void)sildeIn ;
@end
