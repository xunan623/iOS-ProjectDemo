//
//  ViewController.m
//  Category添加属性的三种实现
//
//  Created by xunan on 2017/8/23.
//  Copyright © 2017年 xunan. All rights reserved.
//

#import "ViewController.h"
#import "NSObject+Associate.h"
#import "NSObject+Associate1.h"
#import "NSObject+Associate2.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSObject *nameObject = [NSObject new];
    nameObject.name = @"shit";
    NSLog(@"第一种:%@", nameObject.name);
    
    NSObject *addressObject = [NSObject new];
    addressObject.address = @"这是我的地址";
    NSLog(@"第二种:%@", addressObject.address);
    
    NSObject *phoneObject = [NSObject new];
    phoneObject.phone = @"15783838383";
    NSLog(@"第三种:%@", phoneObject.phone);

    
}

@end
