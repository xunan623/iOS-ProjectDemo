//
//  BankObject3.m
//  KVO,依赖键,集合属性监听
//
//  Created by xunan on 2017/8/22.
//  Copyright © 2017年 xunan. All rights reserved.
//

#import "BankObject3.h"

@implementation BankObject3

-(instancetype)init{
    self = [super init];
    if (self) {
        _departments = [NSMutableArray array];
    }
    return self;
}
//在KVC中，我们可以使用集合代理对象(collection proxy object)来处理集合相关的操作。我们以数组为例，在我们的BankObject类中有一个departments数组属性，如果我们希望通过集合代理对象来负责响应departments所有的方法
#pragma mark - 下面两个集合代理对象方法必须实现
- (NSUInteger)countOfDepartments {
    
    return [_departments count];
}
- (id)objectInDepartmentsAtIndex:(NSUInteger)index {
    
    return [_departments objectAtIndex:index];
}

@end
