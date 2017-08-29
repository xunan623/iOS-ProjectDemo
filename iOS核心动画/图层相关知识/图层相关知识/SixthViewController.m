//
//  SixthViewController.m
//  图层相关知识
//
//  Created by xunan on 2017/8/28.
//  Copyright © 2017年 xunan. All rights reserved.
//

#import "SixthViewController.h"

@interface SixthViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *layerView1;
@property (weak, nonatomic) IBOutlet UIImageView *layerView2;

@end

@implementation SixthViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 边框阴影透明度
    self.layerView1.layer.shadowOpacity = 0.8f;
    self.layerView2.layer.shadowOpacity = 0.8f;
    
    CGMutablePathRef squarePath = CGPathCreateMutable();
    // 一个方形的阴影
    CGPathAddRect(squarePath, NULL, self.layerView1.bounds);
    self.layerView1.layer.shadowPath = squarePath;
    CGPathRelease(squarePath);
    
    CGMutablePathRef circlePath = CGPathCreateMutable();
    // 一个圆形的阴影
    CGPathAddEllipseInRect(circlePath, NULL, self.layerView2.bounds);
    self.layerView2.layer.shadowPath = circlePath;
    CGPathRelease(circlePath);
    
}

@end
