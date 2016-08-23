//
//  productClassCollectionViewCell.m
//  Zhang_tabBar
//
//  Created by zhangzhenwei on 16/8/19.
//  Copyright © 2016年 zhangzhenwei. All rights reserved.
//

#import "productClassCollectionViewCell.h"

@implementation productClassCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}


-(void)initWithIconTitle:(productClassModel *)model{
    self.iconImage.image = [UIImage imageNamed:model.imageName];
    self.iconTitle.text = model.iconTitle;

}



@end
