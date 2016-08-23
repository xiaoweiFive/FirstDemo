//
//  fishController.m
//  Zhang_tabBar
//
//  Created by zhangzhenwei on 16/8/19.
//  Copyright © 2016年 zhangzhenwei. All rights reserved.
//

#import "fishController.h"

@interface fishController(){
   UISegmentedControl * _mySegment;
}

@end


@implementation fishController
- (void)viewDidLoad
{
    [super viewDidLoad];
//    self.navigationItem.title = @"鱼塘";
    UISegmentedControl * mySegment;
    mySegment = [[UISegmentedControl alloc]
                 initWithFrame:CGRectMake((kDeviceWidth-100)/2, 5.0, 100.0f, 30.0f)];
    [mySegment insertSegmentWithTitle:@"发现" atIndex:0 animated:YES];
    [mySegment insertSegmentWithTitle:@"我的" atIndex:1 animated:YES];
    mySegment.segmentedControlStyle = UISegmentedControlStyleBar;
    [mySegment addTarget:self action:@selector(segAction:) forControlEvents:UIControlEventValueChanged];
    mySegment.selectedSegmentIndex = 0;
    _mySegment = mySegment;
    [self.navigationController.navigationBar addSubview: mySegment];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    _mySegment.selectedSegmentIndex = 0;
    self.view.backgroundColor = [UIColor darkGrayColor];

}


-(void)segAction:(UISegmentedControl *)sender{
    NSInteger Index = sender.selectedSegmentIndex;
    NSLog(@"Index %i", Index);
    switch (Index) {
        case 0:
            self.view.backgroundColor = [UIColor darkGrayColor];
            break;
        case 1:
            self.view.backgroundColor = [UIColor lightGrayColor];
            break;
            default:
            break;
            
    }
}
@end
