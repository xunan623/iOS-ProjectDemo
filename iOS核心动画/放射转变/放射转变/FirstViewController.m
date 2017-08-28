//
//  FirstViewController.m
//  放射转变
//
//  Created by xunan on 2017/8/28.
//  Copyright © 2017年 xunan. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *layerView;

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor lightGrayColor];
    switch (self.type) {
        case 0: {
            [self rotate45];
        }
            break;
        case 1: {
            [self commonAnimation];
        }
            break;
        case 2: {
            [self the3DTransform];
        }
            break;
        default:
            break;
    }
}

- (void)rotate45 {
    CGAffineTransform transform = CGAffineTransformMakeRotation(M_PI_4);
    self.layerView.layer.affineTransform = transform;
}

- (void)commonAnimation {
    CGAffineTransform transform = CGAffineTransformIdentity;
    // 缩小50%
    transform = CGAffineTransformScale(transform, 0.5, 0.5);
    // 旋转30度
    transform = CGAffineTransformRotate(transform, M_PI/180.0*30.0);
    // 右移动200像素
    transform = CGAffineTransformTranslate(transform, 200, 0);
    self.layerView.layer.affineTransform = transform;
}

- (void)the3DTransform {
    CATransform3D transform = CATransform3DIdentity;
    transform.m34 = - 1.0/500.0;
    
    transform = CATransform3DRotate(transform, M_PI_4, 0, 1, 0);
    self.layerView.layer.transform = transform;
}

@end
