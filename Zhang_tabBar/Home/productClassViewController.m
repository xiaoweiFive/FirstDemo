//
//  productClassViewController.m
//  Zhang_tabBar
//
//  Created by zhangzhenwei on 16/8/19.
//  Copyright © 2016年 zhangzhenwei. All rights reserved.
//

#import "productClassViewController.h"
#import "productClassCollectionViewCell.h"

#import "productClassModel.h"


#define collectionCell @"cell"


@interface productClassViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>

@property(nonatomic, strong)UICollectionView *collectionView;
@property(nonatomic, strong)NSMutableArray *mutableArray;

@end

@implementation productClassViewController

//-(NSMutableArray *)mutableArray{
//    if(_mutableArray==nil){
//        _mutableArray=[NSMutableArray array];
//    }
//    return _mutableArray;
//}


- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor greenColor];
   
    _mutableArray = [NSMutableArray array];
    
    productClassModel *model = [[productClassModel alloc]init];
    model.imageName = @"";
    model.iconTitle = @"re";
    [_mutableArray addObject:model];
    
    
    productClassModel *model1 = [[productClassModel alloc]init];
    model1.imageName = @"";
    model1.iconTitle = @"rdse";
    [_mutableArray addObject:model1];
    
//    productClassModel *model2 = [[productClassModel alloc]init];
//    model2.imageName = @"";
//    model2.iconTitle = @"re";
//    [_mutableArray addObject:model2];
//    
//    
//    productClassModel *model3 = [[productClassModel alloc]init];
//    model3.imageName = @"";
//    model3.iconTitle = @"rdse";
//    [_mutableArray addObject:model3];
    
    
    [self setCollectView];
    [self setRightItem:@"完成"];
}

- (void)setRightItem:(NSString *)rightTitle
{
    UIButton *rightButton = [[UIButton alloc]initWithFrame:CGRectMake(0,0,48,30)];
    rightButton.titleLabel.font = [UIFont systemFontOfSize: 15.0];
    [rightButton setTitle:rightTitle forState:UIControlStateNormal];
    [rightButton addTarget:self action:@selector(btnReleaseProjectClick)forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc]initWithCustomView:rightButton];
//    _rightButton = rightButton;
    self.navigationItem.rightBarButtonItem= rightItem;
}


-(void)btnReleaseProjectClick{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)setCollectView{
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];
    _collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, kDeviceWidth, KDeviceHeight-64) collectionViewLayout:flowLayout];
    _collectionView.backgroundColor = [UIColor redColor];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    [self.view addSubview:_collectionView];
    
    [_collectionView registerNib:[UINib nibWithNibName:@"productClassCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:collectionCell];

}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return _mutableArray.count%3 ? (_mutableArray.count/3+1)*3 : _mutableArray.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *identifier = collectionCell;
    productClassCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    cell.backgroundColor = [UIColor whiteColor];
    cell.iconTitle.hidden = NO;
    cell.iconImage.hidden = NO;
    
    
    if (indexPath.item >= _mutableArray.count) {

        cell.iconTitle.hidden = YES;
        cell.iconImage.hidden = YES;
        
        return cell;
    }else{
        productClassModel *model =  [_mutableArray objectAtIndex:indexPath.item];
        [cell initWithIconTitle:model];
    }
    return cell;
    
}


//定义每个UICollectionViewcell 的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake((kDeviceWidth - 2) / 3.0 , (kDeviceWidth - 2) / 3.0);
}

//每个item之间的间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 1;
}

//每个section中不同的行之间的行间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 1;
}
//定义每个Section 的 margin
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    
    return UIEdgeInsetsMake(0  , 0, 0, 0);
}



// 点击事件
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    MYLog(@"(long)indexPath.row ======  %ld",(long)indexPath.row);
}
@end
