//
//  SeventhViewController.m
//  图层相关知识
//
//  Created by xunan on 2017/8/28.
//  Copyright © 2017年 xunan. All rights reserved.
//

#import "SeventhViewController.h"

@interface SeventhViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation SeventhViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CALayer *maskLayer = [CALayer layer];
    maskLayer.frame = self.imageView.bounds;
    UIImage *maskImage = [UIImage imageNamed:@"Cone.png"];
    maskLayer.contents = (__bridge id)maskImage.CGImage;
    // mask指定了父layer的可见区域
    self.imageView.layer.mask = maskLayer;
}


@end
