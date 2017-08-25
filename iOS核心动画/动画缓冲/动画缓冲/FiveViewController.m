//
//  FiveViewController.m
//  动画缓冲
//
//  Created by xunan on 2017/8/25.
//  Copyright © 2017年 xunan. All rights reserved.
//

#import "FiveViewController.h"

@interface FiveViewController ()
@property (weak, nonatomic) IBOutlet UIView *containerView;
@property (strong, nonatomic) UIImageView *ballView;
@end

@implementation FiveViewController

- (void)viewDidLoad {
    [super viewDidLoad];
 
    self.ballView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Ball.png"]];
    [self.containerView addSubview:self.ballView];
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self animate];
}

- (void)animate {
    self.ballView.center = CGPointMake(150, 32);
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animation];
    animation.keyPath = @"position";
    animation.duration = 2.0;
    animation.values = @[
                         [NSValue valueWithCGPoint:CGPointMake(150, 32)],
                         [NSValue valueWithCGPoint:CGPointMake(150, 268)],
                         [NSValue valueWithCGPoint:CGPointMake(150, 140)],
                         [NSValue valueWithCGPoint:CGPointMake(150, 268)],
                         [NSValue valueWithCGPoint:CGPointMake(150, 220)],
                         [NSValue valueWithCGPoint:CGPointMake(150, 268)],
                         [NSValue valueWithCGPoint:CGPointMake(150, 250)],
                         [NSValue valueWithCGPoint:CGPointMake(150, 268)]
                         ];
    animation.timingFunctions = @[
                                  [CAMediaTimingFunction functionWithName: kCAMediaTimingFunctionEaseIn],
                                  [CAMediaTimingFunction functionWithName: kCAMediaTimingFunctionEaseOut],
                                  [CAMediaTimingFunction functionWithName: kCAMediaTimingFunctionEaseIn],
                                  [CAMediaTimingFunction functionWithName: kCAMediaTimingFunctionEaseOut],
                                  [CAMediaTimingFunction functionWithName: kCAMediaTimingFunctionEaseIn],
                                  [CAMediaTimingFunction functionWithName: kCAMediaTimingFunctionEaseOut],
                                  [CAMediaTimingFunction functionWithName: kCAMediaTimingFunctionEaseIn]
                                  ];
    animation.keyTimes = @[@0.0, @0.3, @0.5, @0.7, @0.8, @0.9, @0.95, @1.0];
    self.ballView.layer.position = CGPointMake(150, 268);
    [self.ballView.layer addAnimation:animation forKey:nil];
}

@end
