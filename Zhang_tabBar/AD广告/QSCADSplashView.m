//
//  QSCADSplashView.m
//  qingsongchou
//
//  Created by zhangzhenwei on 16/4/14.
//  Copyright © 2016年 Chai. All rights reserved.
//

#import "QSCADSplashView.h"
#import "AppDelegate.h"
#import "ZZWCircleProgressButton.h"


#define ADSplashViewFireTiem 5

@interface QSCADSplashView() {
    UIImageView *_splashImageView;
    NSMutableArray *_protectOptionArray;
}
@property (nonatomic, strong)ZZWCircleProgressButton *drawCircleView ;


@end

@implementation QSCADSplashView

+ (void)saveImageWithName:(NSString *)imageUrl andImageID:(NSString *)imageID{
    //不为空
    if (imageUrl.length) {
        //图片名字一样  不用管
        if (![imageID isEqualToString:[[NSUserDefaults standardUserDefaults] objectForKey:@"ADImageID"]]) {
            NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:imageUrl]];
            
            NSString *documentsDirectory = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject;
            
            NSString *imagePath = [documentsDirectory stringByAppendingPathComponent:@"addSplaceImage.png"];
            
            // 将图片写入文件
            [data writeToFile:imagePath atomically:NO];
            
            [[NSUserDefaults standardUserDefaults] setObject:imageID forKey:@"ADImageID"];
         
            
            [[NSUserDefaults standardUserDefaults] synchronize];
            
        }
    }
}


//设置闪屏广告
- (void)splashView:(NSString *)ADimageUrl
{
       AppDelegate *appDelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    appDelegate.window.rootViewController.view.alpha = 0;
    UIImageView *splashImageView = [[UIImageView alloc]initWithFrame:appDelegate.window.frame];
    _splashImageView = splashImageView;
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    NSString *documentsDirectory = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject;
    
    NSString *imagePath = [documentsDirectory stringByAppendingPathComponent:@"addSplaceImage.png"];
    
  //  if ([[[NSUserDefaults standardUserDefaults] objectForKey:@"isShowSplash"] boolValue]) {
        //闪屏广告时，判断本地是否保存有上次的图片，如果有就显示
        if ([fileManager fileExistsAtPath:imagePath]) {
            UIImage *image = [UIImage imageWithContentsOfFile:imagePath];
            splashImageView.image = image;
        }
//    }
//    else{
//        splashImageView.image = [UIImage imageNamed:@"splaceImage.png"];
//    }
//    
    //更改 只显示本地的图片
        splashImageView.image = [UIImage imageNamed:@"splaceImage.png"];
    
    [appDelegate.window addSubview:splashImageView];
    splashImageView.userInteractionEnabled = YES;
    
    double delayInSeconds = [[[NSUserDefaults standardUserDefaults]objectForKey:@"ADFireTime" ] integerValue];
    
    delayInSeconds = ADSplashViewFireTiem;
    
//    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
//    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
//        [self deleteSplashView];
//        
//    });
 
    /*
    UIButton *delegateBtn = [[UIButton alloc]initWithFrame:CGRectMake(kDeviceWidth-(24+88)*kDeviceWidth/375, 33*kDeviceWidth/375, 88, 40)];
    NSString *titleStr = @"跳过 ";
    titleStr = [titleStr stringByAppendingFormat:@"%ld",[[[NSUserDefaults standardUserDefaults]objectForKey:@"ADFireTime" ] integerValue]];
    
    [delegateBtn setTitle:titleStr forState: UIControlStateNormal];
    [self getNumberButtonSelect:delegateBtn];
    [delegateBtn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    delegateBtn.layer.cornerRadius = 20;
    delegateBtn.layer.borderColor = [[UIColor lightGrayColor] CGColor];
    delegateBtn.layer.borderWidth = 0.5f;
    [delegateBtn addTarget:self action:@selector(deleteSplashView) forControlEvents:UIControlEventTouchUpInside];
    [splashImageView addSubview:delegateBtn];
   */
    
    ZZWCircleProgressButton *drawCircleView = [[ZZWCircleProgressButton alloc]initWithFrame:CGRectMake(kDeviceWidth - 55, 30, 40, 40)];
    drawCircleView.lineWidth = 2;
    drawCircleView.fillColor = [UIColor greenColor];
    drawCircleView.progressColor = [UIColor yellowColor];

    drawCircleView.trackColor = [UIColor blueColor];

    
    
    
    
    
    [drawCircleView setTitle:@"跳过" forState:UIControlStateNormal];
    [drawCircleView setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    drawCircleView.titleLabel.font = [UIFont systemFontOfSize:14];
    self.drawCircleView = drawCircleView;
    [drawCircleView addTarget:self action:@selector(removeProgress) forControlEvents:UIControlEventTouchUpInside];
    
    /**
     *  progress 完成时候的回调
     */
//    __weak ViewController *weakSelf = self;
    [drawCircleView startAnimationDuration:ADSplashViewFireTiem withBlock:^{
        [self removeProgress];
    }];
    
    [splashImageView addSubview:drawCircleView];
    
    
    //整个页面可以点击
    UITapGestureRecognizer *tap =[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(jumpToView:)];
    [splashImageView addGestureRecognizer:tap];
    

    
}


- (void)removeProgress
{
    _splashImageView.transform = CGAffineTransformMakeScale(1, 1);
    _splashImageView.alpha = 1;
    AppDelegate *appDelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;

    [UIView animateWithDuration:0.7 animations:^{
        _splashImageView.alpha = 0.3;
        _splashImageView.transform = CGAffineTransformMakeScale(2, 2);
        appDelegate.window.rootViewController.view.alpha = 1.0;

    } completion:^(BOOL finished) {
        [self.drawCircleView removeFromSuperview];
        [_splashImageView removeFromSuperview];
    }];
}

- (void)getNumberButtonSelect:(UIButton *)button {

//    __block int timeout = [[[NSUserDefaults standardUserDefaults] objectForKey:@"ADFireTime"] integerValue]; //倒计时时间
    __block int timeout =[[[NSUserDefaults standardUserDefaults]objectForKey:@"ADFireTime" ] integerValue]; //倒计时时间
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_source_t _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0,queue);
    dispatch_source_set_timer(_timer,dispatch_walltime(NULL, 0),1.0*NSEC_PER_SEC, 0); //每秒执行
    dispatch_source_set_event_handler(_timer, ^{
        if(timeout<=0){ //倒计时结束，关闭
            dispatch_source_cancel(_timer);
//            dispatch_async(dispatch_get_main_queue(), ^{
//                //设置界面的按钮显示 根据自己需求设置
//                [button setTitle:@"发送验证码" forState:UIControlStateNormal];
//                button.userInteractionEnabled = YES;
//            });
        }else{
            int seconds = timeout % 60;
            NSString *strTime = [NSString stringWithFormat:@"%d", seconds];
            dispatch_async(dispatch_get_main_queue(), ^{
                //设置界面的按钮显示 根据自己需求设置
                //NSLog(@"____%@",strTime);
                [UIView beginAnimations:nil context:nil];
                [UIView setAnimationDuration:1];
                [button setTitle:[NSString stringWithFormat:@"跳过 %@",strTime] forState:UIControlStateNormal];
                [UIView commitAnimations];
                button.userInteractionEnabled = YES;
            });
            timeout--;
        }
    });
    dispatch_resume(_timer);
    
}


- (void)deleteSplashView{
    [self removeProgress];

}

//点击广告位图片 的触发事件
- (void)jumpToView:(id )sender{
    [self deleteSplashView];
  
    [self getNewProtectInfo];
}



- (void)getNewProtectInfo
{

    [ProgressHUD showSuccess:@"进入某个页面"];
    
}


@end
