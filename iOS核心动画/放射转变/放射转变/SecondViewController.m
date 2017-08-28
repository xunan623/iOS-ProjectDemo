//
//  SecondViewController.m
//  放射转变
//
//  Created by xunan on 2017/8/28.
//  Copyright © 2017年 xunan. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@property (weak, nonatomic) IBOutlet UIView *containerView;
@property (weak, nonatomic) IBOutlet UIImageView *layerView1;
@property (weak, nonatomic) IBOutlet UIImageView *layerView2;

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 创建一个3D动画
    CATransform3D perspective = CATransform3DIdentity;
    // 设置灭点
    perspective.m34 = -1.0/500.0;
    // 让他的子视图有同样的灭点
    self.containerView.layer.sublayerTransform = perspective;
    // 子视图一旋转45度
    CATransform3D transform1 = CATransform3DMakeRotation(M_PI_4, 0, 1, 0);
    self.layerView1.layer.transform = transform1;
    
    CATransform3D transform2 = CATransform3DMakeRotation(-M_PI_4, 0, 1, 0);
    self.layerView2.layer.transform = transform2;
    
}


@end
