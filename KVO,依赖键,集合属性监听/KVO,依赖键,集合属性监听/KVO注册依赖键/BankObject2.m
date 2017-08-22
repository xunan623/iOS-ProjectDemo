//
//  BankObject2.m
//  KVO,依赖键,集合属性监听
//
//  Created by xunan on 2017/8/22.
//  Copyright © 2017年 xunan. All rights reserved.
//

#import "BankObject2.h"

@implementation BankObject2

- (NSString *)accountForBank {
    return [NSString stringWithFormat:@"account for %@ is %d", self.bankCodeEn, self.accountBalance];
}

+ (NSSet<NSString *> *)keyPathsForValuesAffectingAccountForBank {
    return [NSSet setWithObjects:@"accountBalance", @"bankCodeEn", nil];
}

@end
