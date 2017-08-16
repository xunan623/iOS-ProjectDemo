//
//  MVPPresenter.m
//  MVPDemo
//
//  Created by xunan on 2017/8/16.
//  Copyright © 2017年 xunan. All rights reserved.
//

#import "MVPPresenter.h"

@interface MVPPresenter()

@property (nonatomic, weak) MVPController *mvpController;

@end

@implementation MVPPresenter

- (instancetype)initPersenterWithVC:(MVPController *)vc {
    if (self = [super init]) {
        self.mvpController = vc;
    }
    return self;
}

- (void)reloadData {
    self.mvpController.label.text = @"哈哈哈";
}

@end
