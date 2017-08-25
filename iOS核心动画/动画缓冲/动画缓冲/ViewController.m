//
//  ViewController.m
//  动画缓冲
//
//  Created by xunan on 2017/8/25.
//  Copyright © 2017年 xunan. All rights reserved.
//

#import "ViewController.h"
#import "AnimationType.h"
#import "FirstViewController.h"
#import "SecondViewController.h"
#import "ThirdViewController.h"
#import "FourViewController.h"
#import "FiveViewController.h"

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (strong, nonatomic) NSMutableArray *dataSourceList;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    self.dataSourceList = [NSMutableArray array];

    NSArray *titleArr = @[@"使用缓冲函数",
                          @"UIKit动画的缓冲设置动画效果",
                          @"给关键帧动画设置CAMediaTimingFunction属性",
                          @"使用UIBezierPath绘制CAMediaTimingFunction",
                          @"使用关键帧实现反弹球的动画"];
    NSArray *detailArr = @[@"使用CAMediaTimingFunction缓冲函数firstVC第十章",
                           @"UIKit动画的缓冲设置动画效果secondVC第10章",
                           @"给关键帧动画设置CAMediaTimingFunction属性thirdVC第10章",
                           @"使用UIBezierPath绘制CAMediaTimingFunction,fourVC第10章",
                           @"使用关键帧实现反弹球的动画,fiveVC第10章"
                           ];
    
    
    for (NSInteger i =0; i< titleArr.count; i++) {
        AnimationType *type = [[AnimationType alloc] init];
        type.title = titleArr[i];
        type.detailTitle = detailArr[i];
        [self.dataSourceList addObject:type];
    }
    self.tableView.rowHeight = 60;
    [self.tableView reloadData];
}

#pragma mark - UITableViewDelegate

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataSourceList.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"aaaaa"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"aaaaa"];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    AnimationType *currentType = self.dataSourceList[indexPath.row];
    cell.textLabel.text = currentType.title;
    cell.detailTextLabel.text = currentType.detailTitle;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.row == 0) {
        FirstViewController *firstVC = [[FirstViewController alloc]init];
        [self.navigationController pushViewController:firstVC animated:YES];
    }else if(indexPath.row == 1){
        SecondViewController *secondVC = [[SecondViewController alloc]init];
        [self.navigationController pushViewController:secondVC animated:YES];
    }else if(indexPath.row == 2){
        ThirdViewController *thirdVC = [[ThirdViewController alloc]init];
        [self.navigationController pushViewController:thirdVC animated:YES];
    }else if(indexPath.row == 3){
        FourViewController *fourVC = [[FourViewController alloc]init];
        [self.navigationController pushViewController:fourVC animated:YES];
    }else if(indexPath.row == 4){
        FiveViewController *fiveVC = [[FiveViewController alloc]init];
        [self.navigationController pushViewController:fiveVC animated:YES];
    }
}


@end
