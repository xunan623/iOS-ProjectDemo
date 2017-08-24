//
//  ViewController.m
//  闹钟
//
//  Created by xunan on 2017/8/24.
//  Copyright © 2017年 xunan. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *hourHand;
@property (weak, nonatomic) IBOutlet UIImageView *secondHand;
@property (weak, nonatomic) IBOutlet UIImageView *minuteHand;

@property (weak, nonatomic) NSTimer *timer;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(tick) userInfo:nil repeats:YES];
    
    // 更改视图的anchorPoint来调整旋转
    self.secondHand.layer.anchorPoint = CGPointMake(0.5f, 0.9f);
    self.minuteHand.layer.anchorPoint = CGPointMake(0.5, 0.9);
    self.hourHand.layer.anchorPoint = CGPointMake(0.5, 0.9);
    // 改变控制器的前后关系
    self.secondHand.layer.zPosition = 1.0;
    [self tick];
}

- (void)tick {
    
    NSCalendar *calendar = [[NSCalendar alloc]initWithCalendarIdentifier:NSGregorianCalendar];
    NSUInteger units = NSHourCalendarUnit|NSMinuteCalendarUnit|NSSecondCalendarUnit;
    NSDateComponents *components = [calendar components:units fromDate:[NSDate date]];
    CGFloat hoursAngle = (components.hour / 12.0) * M_PI * 2.0;
    CGFloat minsAngle = (components.minute / 60.0) * M_PI *2.0;
    CGFloat secsAngle = (components.second / 60.0) *M_PI *2.0;
    
    self.hourHand.transform = CGAffineTransformMakeRotation(hoursAngle);
    self.minuteHand.transform = CGAffineTransformMakeRotation(minsAngle);
    self.secondHand.transform = CGAffineTransformMakeRotation(secsAngle);

    
}

@end
