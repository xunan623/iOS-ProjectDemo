//
//  ViewController.m
//  图层时间
//
//  Created by xunan on 2017/8/28.
//  Copyright © 2017年 xunan. All rights reserved.
//

#import "ViewController.h"
#import "AnimationType.h"
#import "FirstViewController.h"
#import "SecondViewController.h"

@interface ViewController ()<UITableViewDataSource, UITableViewDelegate>
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
    
    NSArray *titleArr = @[@"使用autoreaverse实现门的自动开关",
                          @"通过设置timeoffset来设置动画效果"];
    NSArray *detailArr = @[@"使用autoreaverse实现门的自动开关firstVC第九章",
                           @"通过设置timeoffset来设置动画效果secondVC第九章"];
    for (NSInteger i = 0; i< titleArr.count; i++) {
        AnimationType *type = [[AnimationType alloc] init];
        type.title = titleArr[i];
        type.detailTitle = detailArr[i];
        [self.dataSourceList addObject:type];
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
    return 60;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        FirstViewController *firstVC = [[FirstViewController alloc]init];
        [self.navigationController pushViewController:firstVC animated:YES];
    }else if(indexPath.row == 1){
        SecondViewController *secondVC = [[SecondViewController alloc]init];
        [self.navigationController pushViewController:secondVC animated:YES];
    }
}
@end
