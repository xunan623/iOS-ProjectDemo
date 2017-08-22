//
//  BankObject2.h
//  KVO,依赖键,集合属性监听
//
//  Created by xunan on 2017/8/22.
//  Copyright © 2017年 xunan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BankObject2 : NSObject

@property (nonatomic, assign) int accountBalance;
@property (nonatomic, copy) NSString *bankCodeEn;
@property (nonatomic, strong) NSMutableArray *departments;
//这个属性的值依赖与其他属性
@property (nonatomic, copy) NSString *accountForBank;

@end
