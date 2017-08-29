//
//  FifthViewController.m
//  图层相关知识
//
//  Created by xunan on 2017/8/28.
//  Copyright © 2017年 xunan. All rights reserved.
//

#import "FifthViewController.h"

@interface FifthViewController ()

@property (nonatomic, strong) UIView *layerView;
@property (nonatomic, strong) CALayer *blueLayer;

@end

@implementation FifthViewController

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
    [self.layerView.layer addSublayer:self.blueLayer];
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    CGPoint point = [[touches anyObject] locationInView:self.view];
    
    CALayer *layer = [self.layerView.layer hitTest:point];
    if (layer == self.blueLayer) {
        [[[UIAlertView alloc]initWithTitle:@"绿色" message:nil delegate:nil cancelButtonTitle:@"ok" otherButtonTitles:nil, nil] show];
    }else if(layer == self.layerView.layer){
        [[[UIAlertView alloc]initWithTitle:@"白色" message:nil delegate:nil cancelButtonTitle:@"ok" otherButtonTitles:nil, nil] show];
    }

}

@end
