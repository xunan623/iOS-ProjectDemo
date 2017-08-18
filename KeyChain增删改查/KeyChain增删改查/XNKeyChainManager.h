//
//  XNKeyChainManager.h
//  KeyChain增删改查
//
//  Created by xunan on 2017/8/18.
//  Copyright © 2017年 xunan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XNKeyChainManager : NSObject

+ (instancetype)shareInstance;

/** 增加keyChain值 */
- (BOOL)addKeyChainWithKey:(NSString *)key value:(NSString *)value;
/** 删 */
- (BOOL)deleteKeyChainWithKey:(NSString *)key value:(NSString *)value;
/** 改 */
- (BOOL)updateKeyChainWithKey:(NSString *)key value:(NSString *)value;
/** 查 */
- (id)selectKeyChainWithKey:(NSString *)key;

@end
