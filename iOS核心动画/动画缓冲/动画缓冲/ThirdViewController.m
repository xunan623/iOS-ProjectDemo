//
//  ThirdViewController.m
//  动画缓冲
//
//  Created by xunan on 2017/8/25.
//  Copyright © 2017年 xunan. All rights reserved.
//

#import "ThirdViewController.h"

@interface ThirdViewController ()

@property (weak, nonatomic) IBOutlet UIView *layerView;
@property (strong, nonatomic) CALayer *colorLayer;

@end

@implementation ThirdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.colorLayer = [CALayer layer];
    self.colorLayer.frame = CGRectMake(0.0f, 0, 100.0, 100.0);
    self.colorLayer.backgroundColor = [UIColor blueColor].CGColor;
    [self.layerView.layer addSublayer:self.colorLayer];
}

- (IBAction)changeColor:(id)sender {
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animation];
    animation.keyPath = @"backgroundColor";
    animation.duration = 2.0;
    animation.values = @[
                         (__bridge id)[UIColor blueColor].CGColor,
                         (__bridge id)[UIColor redColor].CGColor,
                         (__bridge id)[UIColor greenColor].CGColor,
                         (__bridge id)[UIColor blueColor].CGColor];
    CAMediaTimingFunction *fn = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    // 数组个数一定是函数个数加一, 因为函数描述的是帧之间的过度
    animation.timingFunctions = @[fn, fn, fn];
    [self.colorLayer addAnimation:animation forKey:nil];
}

@end
