//
//  NSObject+Associate1.m
//  Category添加属性的三种实现
//
//  Created by xunan on 2017/8/24.
//  Copyright © 2017年 xunan. All rights reserved.
//

#import "NSObject+Associate1.h"
#import <UIKit/UIKit.h>

@implementation NSObject (Associate1)

static NSMutableDictionary *_dic;
static NSString *const addressID = @"addressID";

+ (void)load {
    _dic = [NSMutableDictionary dictionary];
}

- (void)setAddress:(NSString *)address {
    [_dic setObject:address forKey:addressID];
}

- (NSString *)address {
    return [_dic objectForKey:addressID];
}

@end
