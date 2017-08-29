//
//  ViewController.m
//  图层相关知识
//
//  Created by xunan on 2017/8/28.
//  Copyright © 2017年 xunan. All rights reserved.
//

#import "ViewController.h"
#import "AnimationType.h"
#import "FirstViewController.h"
#import "SecondViewController.h"
#import "ThirdViewController.h"
#import "FourthViewController.h"
#import "FifthViewController.h"
#import "SixthViewController.h"
#import "SeventhViewController.h"
#import "EightthViewController.h"
#import "NinethViewController.h"


@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSMutableArray *dataSourceList;

@end

@implementation ViewController

- (NSMutableArray *)dataSourceList {
    if (!_dataSourceList) {
        _dataSourceList = [NSMutableArray array];
    }
    return _dataSourceList;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    self.automaticallyAdjustsScrollViewInsets = NO;
    
    NSArray *titleArr = @[@"关于图层",
                         @"图片拼接",
                         @"图片拉伸",
                         @"绘制图片",
                         @"点击某点判断是否在图层内",
                         @"为视图添加阴影",
                         @"通过图层生成蒙版",
                         @"通过contentsGravity来设置图片的的拉伸",
                         @"视图透明度"];
    NSArray *detailArr = @[@"把一个CALayer添加到视图中FirstVC第一章",
                           @"图片切割拼接SecondVC第二章",
                           @"图片拉伸ThirtdVC第二章",
                           @"CALayer绘制图片FourthVC第二章",
                           @"点击某点判断是否在图层内FifthVC第三章",
                           @"为视图添加阴影sixthVC第四章",
                           @"通过图层来实现对视图的不规则切割seventhVC第四章",
                           @"通过contentsGravity来设置图片的显示模式eightthVC第四章",
                           @"视图与其子视图透明度重叠问题解决ninethVC第四章"
                           ];
    
    for (NSInteger i = 0; i< titleArr.count; i++) {
        AnimationType *type = [[AnimationType alloc] init];
        type.title = titleArr[i];
        type.detailTitle =detailArr[i];
        [self.dataSourceList addObject:type];
    }
    [self.tableView reloadData];
}

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

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 60;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {//使用图层
        FirstViewController *firstVC = [[FirstViewController alloc]init];
        [self.navigationController pushViewController:firstVC animated:YES];
    }else if(indexPath.row == 1){
        SecondViewController *secondVC = [[SecondViewController alloc]init];
        [self.navigationController pushViewController:secondVC animated:YES];
    }else if(indexPath.row == 2){
        ThirdViewController *thirdVC = [[ThirdViewController alloc]init];
        [self.navigationController pushViewController:thirdVC animated:YES];
    }else if(indexPath.row == 3){
        FourthViewController *fourthVC = [[FourthViewController alloc]init];
        [self.navigationController pushViewController:fourthVC animated:YES];
    }else if(indexPath.row == 4){
        FifthViewController *fifthVC = [[FifthViewController alloc]init];
        [self.navigationController pushViewController:fifthVC animated:YES];
    }else if(indexPath.row == 5){
        SixthViewController *sixthVC = [[SixthViewController alloc]init];
        [self.navigationController pushViewController:sixthVC animated:YES];
    }else if (indexPath.row == 6){
        SeventhViewController *seventhVC = [[SeventhViewController alloc]init];
        [self.navigationController pushViewController:seventhVC animated:YES];
    }else if (indexPath.row == 7){
        EightthViewController *eightthVC = [[EightthViewController alloc]init];
        [self.navigationController pushViewController:eightthVC animated:YES];
    }else if (indexPath.row == 8){
        NinethViewController *ninethVC = [[NinethViewController alloc]init];
        [self.navigationController pushViewController:ninethVC animated:YES];
    }
    
    
}

@end
