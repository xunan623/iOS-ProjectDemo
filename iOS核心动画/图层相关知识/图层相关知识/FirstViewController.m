//
//  FirstViewController.m
//  图层相关知识
//
//  Created by xunan on 2017/8/28.
//  Copyright © 2017年 xunan. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController ()

@property (nonatomic, strong) UIView *layerView;

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    UIView *layerView = [[UIView alloc] init];
    layerView.backgroundColor = [UIColor whiteColor];
    layerView.bounds = CGRectMake(0, 0, 200, 200);
    layerView.center = self.view.center;
    [self.view addSubview:layerView];
    self.layerView = layerView;
    
    UIImage *image = [UIImage imageNamed:@"Snowman.png"];
    // 拉伸图片适应图层
    self.layerView.layer.contentsGravity = kCAGravityCenter;
    // 如果image.scale是2, 那个就表示每个点放两个像素
    self.layerView.layer.contents = (__bridge id)image.CGImage;
    
    // 当用代码的方式来处理寄宿图时, 一定要记住手动设置图层的contensScale属性
    self.layerView.layer.contentsScale = [UIScreen mainScreen].scale;
    
    // 截断超过视图大小的内容, UIView对应的事cliptobounds
    self.layerView.layer.masksToBounds = YES;
}


@end
