//
//  FourViewController.m
//  KVO,依赖键,集合属性监听
//
//  Created by xunan on 2017/8/22.
//  Copyright © 2017年 xunan. All rights reserved.
//

#import "FourViewController.h"
#import "PersonObject.h"
#import "BankObject3.h"

@interface FourViewController ()

@end

@implementation FourViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    BankObject3 *bank = [[BankObject3 alloc] init];
    
    PersonObject *person = [[PersonObject alloc] init];
    
    [bank addObserver:person
           forKeyPath:@"departments"
              options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld
              context:NULL];
    
    bank.departments = [[NSMutableArray alloc] init];
    
    NSMutableArray *departments = [bank mutableArrayValueForKey:@"departments"];
    [departments insertObject:@"departments 0" atIndex:0];
    
    [bank removeObserver:person forKeyPath:@"departments"];
}

@end
