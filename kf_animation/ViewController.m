//
//  ViewController.m
//  kf_animation
//
//  Created by Bytedance on 2020/8/4.
//  Copyright © 2020 Bytedance. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property(nonatomic, strong) IBOutlet UIView *colorview;
@property(nonatomic, strong) CALayer *shipLayer;
@property(nonatomic, strong) UIBezierPath *bezierPath;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIBezierPath *bPath = [[UIBezierPath alloc] init];
    [bPath moveToPoint:CGPointMake(0, 150)];
    [bPath addCurveToPoint:CGPointMake(300, 150) controlPoint1:CGPointMake(75, 0) controlPoint2:CGPointMake(225, 300)];
    
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.path = bPath.CGPath;
    shapeLayer.fillColor = [UIColor clearColor].CGColor;
    shapeLayer.strokeColor = [UIColor redColor].CGColor;
    shapeLayer.lineWidth = 3.0f;
    [self.colorview.layer addSublayer:shapeLayer];
    self.bezierPath = bPath;
    
    _shipLayer = [CALayer layer];
    _shipLayer.frame = CGRectMake(0,0,64,64);
    _shipLayer.position = CGPointMake(0, 150);
    _shipLayer.contents = (__bridge id)[UIImage imageNamed:@"Ship"].CGImage;
    [self.colorview.layer addSublayer:_shipLayer];

}

- (IBAction)changeColor:(id)sender
{
    _shipLayer.position = CGPointMake(0, 150);
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animation];
    animation.keyPath = @"position";
    animation.duration = 4.0;
    animation.path = self.bezierPath.CGPath;
    animation.rotationMode = kCAAnimationRotateAuto;
    [_shipLayer addAnimation:animation forKey:nil];
}

@end
