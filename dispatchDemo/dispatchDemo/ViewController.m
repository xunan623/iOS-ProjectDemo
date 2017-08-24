//
//  ViewController.m
//  dispatchDemo
//
//  Created by xunan on 2017/8/24.
//  Copyright © 2017年 xunan. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self createDispatch];
    
//    [self dispatchBarrier];
    
//    [self dispatchGroup];
}

- (void)createDispatch {
    // 串行队列
    dispatch_queue_t serialDispatch = dispatch_queue_create("dispatch.serial", NULL);
    
    // 并行队列
    dispatch_queue_t concurrentDispatch = dispatch_queue_create("dispatch.concurrent", DISPATCH_QUEUE_CONCURRENT);
    
    dispatch_async(serialDispatch, ^{
        NSLog(@"异步操作");
    });
    
    // 系统提供的串行主队列, 只在主线程上执行代码
    dispatch_queue_t mainQueue = dispatch_get_main_queue();
    
    // 调用系统并行队列
    dispatch_queue_t globalQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    
    // 一般调用模式
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        // 这里执行异步处理
        
        // 处理结束后在主线程执行
        dispatch_async(dispatch_get_main_queue(), ^{
            
        });
    });
    
    dispatch_async(globalQueue, ^{
        
        dispatch_async(mainQueue, ^{
            
        });
    });
    
    
    // 通过dispatch_queue_create生成的队列优先级都是 DISPATCH_QUEUE_PRIORITY_DEFAULT
    // 可以通过函数设置优先级
    dispatch_queue_t newLevelQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0);
    
    // 将 serialDispatch 的优先级设置为 DISPATCH_QUEUE_PRIORITY_BACKGROUND
    dispatch_set_target_queue(serialDispatch, newLevelQueue);
    
    
    dispatch_time_t time = dispatch_time(DISPATCH_TIME_NOW, 3ull*NSEC_PER_SEC);
    dispatch_after(time, dispatch_get_main_queue(), ^{
        NSLog(@"延时3s");
    });
}

/**
 * 作用在并行队列中,等待前面的操作完成,然后执行 dispatch_barrier_async中的操作, 执行完后继续并行执行
 */
- (void)dispatchBarrier {
    
    dispatch_queue_t queue = dispatch_queue_create("dispatch.barrier", DISPATCH_QUEUE_CONCURRENT);
    
    dispatch_async(queue, ^{
        NSLog(@"读取数据1");
    });
    dispatch_async(queue, ^{
        NSLog(@"读取数据2");
    });
    dispatch_async(queue, ^{
        NSLog(@"读取数据3");
    });
    
    dispatch_barrier_async(queue, ^{
        NSLog(@"写入数据123");
    });
    
    dispatch_async(queue, ^{
        NSLog(@"读取数据4");
    });
    dispatch_async(queue, ^{
        NSLog(@"读取数据5");
    });
    dispatch_async(queue, ^{
        NSLog(@"读取数据6");
    });  dispatch_async(queue, ^{
        NSLog(@"读取数据7");
    });  dispatch_async(queue, ^{
        NSLog(@"读取数据8");
    });
    
}

- (void)dispatchGroup {
    
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_group_t group = dispatch_group_create();
    
    dispatch_group_async(group, queue, ^{
        NSLog(@"线程0");
    });
    
    dispatch_group_async(group, queue, ^{
        NSLog(@"线程1");
    });
    
    dispatch_group_async(group, queue, ^{
        NSLog(@"线程2");
    });
    
    // group中所有任务都结束以后, 才开始执行这里的任务,group执行完以后才能把任务加入主队列
    dispatch_group_notify(group, dispatch_get_main_queue(), ^{
        NSLog(@"完成");
    });
    
    // 这个函数用于判断经过指定时间后,group里面的任务是否完成,如果完成返回0
    dispatch_time_t time = dispatch_time(DISPATCH_TIME_NOW, 1ull*NSEC_PER_SEC);
    long result = dispatch_group_wait(group, time);
    if (result == 0) {
        NSLog(@"线程执行完成");
    } else {
        NSLog(@"线程没有执行完成");
    }
    
}


@end
