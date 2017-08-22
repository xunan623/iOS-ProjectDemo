//
//  ThirdViewController.m
//  KVO,依赖键,集合属性监听
//
//  Created by xunan on 2017/8/22.
//  Copyright © 2017年 xunan. All rights reserved.
//

#import "ThirdViewController.h"
#import "PersonObject.h"
#import "BankObject2.h"

@interface ThirdViewController ()

@end

@implementation ThirdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    PersonObject *person = [[PersonObject alloc] init];
    BankObject2 *bank = [[BankObject2 alloc] init];
    
    [bank addObserver:person forKeyPath:@"accountForBank" options:NSKeyValueObservingOptionNew context:NULL];
    bank.accountBalance = 10;
    bank.bankCodeEn = @"gggg";
    
    [bank removeObserver:person forKeyPath:@"accountForBank"];
}


@end
