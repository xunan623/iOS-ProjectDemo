//
//  XNKeyChainManager.m
//  KeyChain增删改查
//
//  Created by xunan on 2017/8/18.
//  Copyright © 2017年 xunan. All rights reserved.
//

#import "XNKeyChainManager.h"

@implementation XNKeyChainManager

+ (instancetype)shareInstance {
    static XNKeyChainManager *_manager;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _manager = [[XNKeyChainManager alloc] init];
    });
    return _manager;
}

/** 增加keyChain值 */
- (BOOL)addKeyChainWithKey:(NSString *)key value:(NSString *)value {
    
    NSData *valueData = [value dataUsingEncoding:NSUTF8StringEncoding];
    NSString *service = [[NSBundle mainBundle] bundleIdentifier];

    NSDictionary *secItem = @{
                              (__bridge id)kSecClass : (__bridge id)kSecClassGenericPassword,
                              (__bridge id)kSecAttrService : service,
                              (__bridge id)kSecAttrAccount : key,
                              (__bridge id)kSecValueData : valueData
                              };
    CFTypeRef result = NULL;
    OSStatus status = SecItemAdd((__bridge CFDictionaryRef)secItem, &result);
    
    if (status == errSecSuccess) {
        NSLog(@"添加成功:%@---%@", key, value);
        return YES;
    } else {
        NSLog(@"添加失败");
        return NO;
    }
    
    return NO;
}
/** 删 */
- (BOOL)deleteKeyChainWithKey:(NSString *)key value:(NSString *)value {
    
    NSString *service = [[NSBundle mainBundle] bundleIdentifier];
    
    NSDictionary *query = @{
                            (__bridge id)kSecClass : (__bridge id)kSecClassGenericPassword,
                            (__bridge id)kSecAttrService : service,
                            (__bridge id)kSecAttrAccount : key
                            };
    OSStatus foundExisting = SecItemCopyMatching((__bridge CFDictionaryRef)query, NULL);
    
    if (foundExisting == errSecSuccess) {
        OSStatus deleted = SecItemDelete((__bridge CFDictionaryRef)query);
        if (deleted == errSecSuccess) {
            NSLog(@"删除成功:%@", key);
            return YES;
        } else {
            NSLog(@"删除失败");
            return NO;
        }
    } else {
        NSLog(@"没存过");
        return NO;
    }
    
    return NO;
}
/** 改 */
- (BOOL)updateKeyChainWithKey:(NSString *)key value:(NSString *)value {
    
    NSString *keyToSearchFor = key;
    NSString *service = [[NSBundle mainBundle] bundleIdentifier];
    
    NSDictionary *query = @{
                            (__bridge id)kSecClass : (__bridge id)kSecClassGenericPassword,
                            (__bridge id)kSecAttrService : service,
                            (__bridge id)kSecAttrAccount : keyToSearchFor
                            };
    OSStatus found = SecItemCopyMatching((__bridge CFDictionaryRef)query, NULL);
    
    if (found == errSecSuccess) {
        
        NSData *newData = [value dataUsingEncoding:NSUTF8StringEncoding];
        
        NSDictionary *update = @{
                                 (__bridge id)kSecValueData : newData,
                                 (__bridge id)kSecAttrComment : keyToSearchFor
                                 };
        OSStatus updated = SecItemUpdate((__bridge CFDictionaryRef)query, (__bridge CFDictionaryRef)update);
        
        if (updated == errSecSuccess) {
            NSLog(@"更新成功");
            [self selectKeyChainWithKey:key];
            return YES;
        } else {
            return NO;
        }
    } else {
        NSLog(@"更新失败");
        return NO;
    }
    
    
    return NO;
}
/** 查 */
- (id)selectKeyChainWithKey:(NSString *)key {
    
    NSString *keyToSearchFor = key;
    NSString *service = [[NSBundle mainBundle] bundleIdentifier];
    
    NSDictionary *query = @{
                            (__bridge id)kSecClass : (__bridge id)kSecClassGenericPassword,
                            (__bridge id)kSecAttrService : service,
                            (__bridge id)kSecAttrAccount : keyToSearchFor,
                            (__bridge id)kSecReturnData : (__bridge id)kCFBooleanTrue,
                            (__bridge id)kSecMatchLimit :(__bridge id)kSecMatchLimitAll
                            };
    CFArrayRef allCFMatches = NULL;
    OSStatus results = SecItemCopyMatching((__bridge CFDictionaryRef)query, (CFTypeRef *)&allCFMatches);
    if (results == errSecSuccess){
        
        NSArray *allMatches = (__bridge_transfer NSArray *)allCFMatches;
        
        for (NSData *itemData in allMatches){
            NSString *value = [[NSString alloc]
                               initWithData:itemData
                               encoding:NSUTF8StringEncoding];
            NSLog(@"获取成：%@-- %@",key, value);
            return value;
        }
        
    } else {
        NSLog(@"获取失败");
        return nil;
    }
    return nil;
    return NO;
}




















@end
