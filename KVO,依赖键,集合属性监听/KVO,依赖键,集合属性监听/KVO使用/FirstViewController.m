//
//  FirstViewController.m
//  KVO,依赖键,集合属性监听
//
//  Created by xunan on 2017/8/22.
//  Copyright © 2017年 xunan. All rights reserved.
//

#import "FirstViewController.h"
#import "PersonObject.h"
#import "BankObject.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    PersonObject *person = [[PersonObject alloc] init];
    BankObject *bank = [[BankObject alloc] init];
    
    [bank addObserver:person forKeyPath:@"accountBalance"
              options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld
              context:NULL];
    [bank addObserver:person forKeyPath:@"accountBalance"
              options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld
              context:NULL];
    [bank addObserver:person forKeyPath:@"accountBalance"
              options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld
              context:@"person instance"];
    [bank addObserver:person forKeyPath:@"accountBalance"
              options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld
              context:@"person instance 2"];
    bank.accountBalance = 10;
    
    // 一个良好的实践是在观察者不在需要监听属性变化时, 必须调用removeObsever:forkeyPath 或 removeObserver:forKeyPath:context 移除观察者
    // 在对象呗卸载之前,需要手移除观察者
    [bank removeObserver:person forKeyPath:@"accountBalance"];
    [bank removeObserver:person forKeyPath:@"accountBalance"];
    [bank removeObserver:person forKeyPath:@"accountBalance" context:NULL];
    [bank removeObserver:person forKeyPath:@"accountBalance" context:NULL];

}

@end
