//
//  NSObject+Associate.m
//  Category添加属性的三种实现
//
//  Created by xunan on 2017/8/23.
//  Copyright © 2017年 xunan. All rights reserved.
//

#import "NSObject+Associate.h"

@implementation NSObject (Associate)

static NSString *_name = nil;

- (void)setName:(NSString *)name {
    _name = name;
}

- (NSString *)name {
    return _name;
}

@end
