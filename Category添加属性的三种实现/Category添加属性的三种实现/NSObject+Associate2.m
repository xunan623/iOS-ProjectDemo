//
//  NSObject+Associate2.m
//  Category添加属性的三种实现
//
//  Created by xunan on 2017/8/24.
//  Copyright © 2017年 xunan. All rights reserved.
//

#import "NSObject+Associate2.h"
#import <objc/message.h>

@implementation NSObject (Associate2)

@dynamic test;

- (void)setPhone:(NSString *)phone {
    return objc_setAssociatedObject(self, @selector(phone), phone, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (NSString *)phone {
    return objc_getAssociatedObject(self, _cmd);
}


- (NSDictionary *)test {
    return objc_getAssociatedObject(self, _cmd) ?: ({
        NSDictionary *dict = NSDictionary.new;
        objc_setAssociatedObject(self, _cmd, dict, 2);
        dict;
    });
}


@end
