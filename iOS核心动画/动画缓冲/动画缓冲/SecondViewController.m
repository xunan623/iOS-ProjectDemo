//
//  SecondViewController.m
//  动画缓冲
//
//  Created by xunan on 2017/8/25.
//  Copyright © 2017年 xunan. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()
@property (nonatomic, strong) UIView *colorView;

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.colorView = [[UIView alloc] init];
    self.colorView.frame = CGRectMake(0, 0, 100, 100);
    self.colorView.center = CGPointMake(self.view.bounds.size.width / 2.0,self.view.bounds.size.height / 2.0);
    self.colorView.backgroundColor = [UIColor redColor];
    [self.view addSubview:self.colorView];

}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [UIView animateWithDuration:1.0 delay:0.0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        self.colorView.center = [[touches anyObject] locationInView:self.view];
    } completion:^(BOOL finished) {
        
    }];
}


@end
