//
//  SecondViewController.m
//  KVO,依赖键,集合属性监听
//
//  Created by xunan on 2017/8/22.
//  Copyright © 2017年 xunan. All rights reserved.
//

#import "SecondViewController.h"
#import "PersonObject.h"
#import "BankObject1.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    PersonObject *person = [[PersonObject alloc] init];
    BankObject1 *bank = [[BankObject1 alloc] init];
    [bank addObserver:person forKeyPath:@"bankCodeEn" options:NSKeyValueObservingOptionNew context:@"123"];
    
    NSString *bankCodeEn = @"hhhh";
    bank.bankCodeEn = bankCodeEn;
    bank.bankCodeEn = bankCodeEn;
    // 手动实现kvo不需要手动移除
}

- (void)dealloc {
    NSLog(@"11111");
}

@end
