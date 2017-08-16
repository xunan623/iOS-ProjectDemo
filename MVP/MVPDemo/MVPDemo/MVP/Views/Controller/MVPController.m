//
//  MVPController.m
//  MVPDemo
//
//  Created by xunan on 2017/8/16.
//  Copyright © 2017年 xunan. All rights reserved.
//

#import "MVPController.h"
#import "MVPPresenter.h"

@interface MVPController ()

@property (strong, nonatomic) MVPPresenter *mvpPersenter;


@end

@implementation MVPController

- (MVPPresenter *)mvpPersenter {
    if (!_mvpPersenter) {
        _mvpPersenter = [[MVPPresenter alloc] initPersenterWithVC:self];
    }
    return _mvpPersenter;
}

- (void)viewDidLoad {
    [super viewDidLoad];
}
- (IBAction)btnClick:(UIButton *)sender {
    [self.mvpPersenter reloadData];
}
- (IBAction)backClick:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)dealloc {
    NSLog(@"%s", __func__);
}

@end
