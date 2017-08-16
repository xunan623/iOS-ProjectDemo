//
//  ViewController.m
//  MVPDemo
//
//  Created by xunan on 2017/8/16.
//  Copyright © 2017年 xunan. All rights reserved.
//

#import "ViewController.h"
#import "MVPController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}
- (IBAction)btnClick:(UIButton *)sender {
    MVPController *mvpVC = [[MVPController alloc] init];
    [self presentViewController:mvpVC animated:YES completion:nil];
}

@end
