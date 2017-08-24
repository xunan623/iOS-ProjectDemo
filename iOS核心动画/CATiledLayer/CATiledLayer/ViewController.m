//
//  ViewController.m
//  CATiledLayer
//
//  Created by xunan on 2017/8/24.
//  Copyright © 2017年 xunan. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<CALayerDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    CATiledLayer *tiledLayer = [CATiledLayer layer];
    tiledLayer.frame = CGRectMake(0, 0, 2048, 2048);
    tiledLayer.delegate = self;
    [self.scrollView.layer addSublayer:tiledLayer];
    self.scrollView.contentSize = tiledLayer.frame.size;
    tiledLayer.contentsScale = [UIScreen mainScreen].scale;
    
    [tiledLayer setNeedsDisplay];
}

#pragma mark - CALayerDelegate

- (void)drawLayer:(CATiledLayer *)layer inContext:(CGContextRef)ctx {
    
    CGRect bounds = CGContextGetClipBoundingBox(ctx);
    CGFloat scale = [UIScreen mainScreen].scale;
    NSInteger x = floor(bounds.origin.x / layer.tileSize.width * scale);
    NSInteger y = floor(bounds.origin.y / layer.tileSize.height * scale);
    
    NSString *imageName = [NSString stringWithFormat:@"Snowman_%02li_%02li", (long)x, (long)y];
    NSString *imagePath = [[NSBundle mainBundle] pathForResource:imageName ofType:@"jpg"];
    UIImage *tileImage = [UIImage imageWithContentsOfFile:imagePath];
    
    // draw tile
    UIGraphicsPushContext(ctx);
    [tileImage drawInRect:bounds];
    UIGraphicsPopContext();
}

@end
