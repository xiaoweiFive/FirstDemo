//
//  QSCADSplashView.h
//  qingsongchou
//
//  Created by zhangzhenwei on 16/4/14.
//  Copyright © 2016年 Chai. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface QSCADSplashView : NSObject

//服务器返回的url，保存图片］］
+ (void)saveImageWithName:(NSString *)imageUrl
               andImageID:(NSString *)imageID;

//设置闪屏广告
- (void)splashView:(NSString *)ADimageUrl;
@end
