//
//  EightthViewController.m
//  图层相关知识
//
//  Created by xunan on 2017/8/28.
//  Copyright © 2017年 xunan. All rights reserved.
//

#import "EightthViewController.h"

@interface EightthViewController ()

@property (strong, nonatomic) IBOutletCollection(UIView) NSArray *digitViews;
@property (weak, nonatomic) NSTimer *timer;

@end

@implementation EightthViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIImage *digits = [UIImage imageNamed:@"Digits.png"];
    
    for (UIView *view in self.digitViews) {
        view.layer.contents = (__bridge id)digits.CGImage;
        view.layer.contentsRect = CGRectMake(0, 0, 0.1, 0.1);
        view.layer.contentsGravity = kCAGravityResizeAspect;
        
        // 图片的拉伸, 下面设置增大图片的时候, 图片拉伸的模式
        view.layer.magnificationFilter = kCAFilterNearest;
    }
    
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0
                                                  target:self
                                                selector:@selector(tick)
                                                userInfo:nil
                                                 repeats:YES];
    [self tick];
}

- (void)tick {
    
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSUInteger units = NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit;
    NSDateComponents *componets = [calendar components:units fromDate:[NSDate date]];
    
    
    //set hours
    [self setDigit:componets.hour / 10 forView:self.digitViews[0]];
    [self setDigit:componets.hour % 10 forView:self.digitViews[1]];
    
    //set minutes
    [self setDigit:componets.minute / 10 forView:self.digitViews[2]];
    [self setDigit:componets.minute % 10 forView:self.digitViews[3]];
    
    //set seconds
    [self setDigit:componets.second / 10 forView:self.digitViews[4]];
    [self setDigit:componets.second % 10 forView:self.digitViews[5]];

    
}

- (void)setDigit:(NSInteger)digit forView:(UIView *)view {
    view.layer.contentsRect = CGRectMake(digit * 0.1, 0, 0.1, 1.0);
}

@end
