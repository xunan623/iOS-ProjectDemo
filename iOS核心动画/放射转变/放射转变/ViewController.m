//
//  ViewController.m
//  放射转变
//
//  Created by xunan on 2017/8/25.
//  Copyright © 2017年 xunan. All rights reserved.
//

#import "ViewController.h"
#import "AnimationType.h"
#import "FirstViewController.h"
#import "SecondViewController.h"

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>
@property(nonatomic,strong)NSMutableArray *dataSourceList;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

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
    
    NSArray *titleArr = @[@"旋转/缩小/移动",
                          @"3D旋转",
                          @"子视图有相投的灭点"];
    NSArray *detailArr = @[@"旋转/缩小/移动FirstVC第五章",
                           @"围绕Y轴做45度角的旋转FirstVC第五章",
                           @"子视图有相同的灭点SecondVC第五章"
                           ];
    for (NSInteger i = 0; i < titleArr.count; i++) {
        AnimationType *anmType = [[AnimationType alloc] init];
        anmType.title = titleArr[i];
        anmType.detailTitle = detailArr[i];
        [self.dataSourceList addObject:anmType];
    }
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

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 40;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {//旋转45度
        FirstViewController *firstVC = [[FirstViewController alloc]init];
        firstVC.type = 1;
        [self.navigationController pushViewController:firstVC animated:YES];
    }else if(indexPath.row == 1){
        FirstViewController *firstVC = [[FirstViewController alloc]init];
        firstVC.type = 2;
        [self.navigationController pushViewController:firstVC animated:YES];
    }else if(indexPath.row == 2){
        SecondViewController *secondVC = [[SecondViewController alloc]init];
        [self.navigationController pushViewController:secondVC animated:YES];
    }
}

@end
