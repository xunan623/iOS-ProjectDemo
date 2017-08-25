//
//  FirstViewController.m
//  动画缓冲
//
//  Created by xunan on 2017/8/25.
//  Copyright © 2017年 xunan. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController ()

@property (nonatomic, strong) CALayer *colorLayer;

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.colorLayer = [CALayer layer];
    self.colorLayer.frame = CGRectMake(0, 0, 100, 100);
    self.colorLayer.position = CGPointMake(self.view.bounds.size.width / 2.0, self.view.bounds.size.height / 2.0);
    self.colorLayer.backgroundColor = [UIColor redColor].CGColor;
    [self.view.layer addSublayer:self.colorLayer];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [CATransaction begin];
    [CATransaction setAnimationDuration:1.0];
    [CATransaction setAnimationTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut]];
    self.colorLayer.position= [[touches anyObject] locationInView:self.view];
    [CATransaction commit];
}

@end
