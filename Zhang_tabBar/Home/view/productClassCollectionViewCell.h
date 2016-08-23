//
//  productClassCollectionViewCell.h
//  Zhang_tabBar
//
//  Created by zhangzhenwei on 16/8/19.
//  Copyright © 2016年 zhangzhenwei. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "productClassModel.h"


@interface productClassCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *iconImage;

@property (weak, nonatomic) IBOutlet UILabel *iconTitle;



-(void)initWithIconTitle:(productClassModel *)model;

@end
