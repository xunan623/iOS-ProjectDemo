//
//  FourthViewController.m
//  图层相关知识
//
//  Created by xunan on 2017/8/28.
//  Copyright © 2017年 xunan. All rights reserved.
//

#import "FourthViewController.h"


@interface FourthViewController ()<CALayerDelegate>

@property (nonatomic, strong) UIView *layerView;
@property (nonatomic, strong) CALayer *blueLayer;

@end

@implementation FourthViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor lightGrayColor];
    UIView *layerView = [[UIView alloc] init];
    layerView.backgroundColor = [UIColor whiteColor];
    layerView.bounds = CGRectMake(0, 0, 200, 200);
    layerView.center = self.view.center;
    [self.view addSubview:layerView];
    self.layerView = layerView;
    
    self.blueLayer = [CALayer layer];
    self.blueLayer.frame = CGRectMake(50, 50, 100, 100);
    self.blueLayer.backgroundColor = [UIColor blueColor].CGColor;
    self.blueLayer.delegate = self;
    [self.layerView.layer addSublayer:self.blueLayer];
    // 调用代理方法绘制图像
    [self.blueLayer display];
}

- (void)drawLayer:(CALayer *)layer inContext:(CGContextRef)ctx {
    // 绘制一个红色的圆圈
    CGContextSetLineWidth(ctx, 10);
    CGContextSetStrokeColorWithColor(ctx, [UIColor redColor].CGColor);
    CGContextStrokeEllipseInRect(ctx, layer.bounds);
}

@end
