//
//  PieView.m
//  TSPieView
//
//  Created by tunsuy on 16/4/16.
//  Copyright © 2016年 tunsuy. All rights reserved.
//

#import "PieView.h"

#define DEGREES_TO_RADIANS(angle) angle*M_PI/180.0;

@interface PieView()

@property (nonatomic, strong) CAShapeLayer *pieLayer;

@end

@implementation PieView

/**
 一种思想是用蒙版来达到动画的效果
 一种思想是定义多个子图层，然后对所有的子图层进行动画
*/

- (instancetype)initWithFrame:(CGRect)frame dataItems:(NSArray *)dataItems colorItems:(NSArray *)colorItems hollowDistance:(CGFloat)hollowDistance {
    self = [super initWithFrame:frame];
    if (self) {
        if (dataItems && [dataItems count] > 0) {
            
//            pieView的中心点
            CGFloat centerWidth = self.frame.size.width/2;
            CGFloat centerHeight = self.frame.size.height/2;
            CGFloat centerX = centerWidth;
            CGFloat centerY = centerHeight;
            CGPoint centerPoint = CGPointMake(centerX, centerY);
            CGFloat radius = centerWidth > centerHeight ? centerHeight : centerWidth;
            
//            self.layer的图层蒙版
            _pieLayer = [CAShapeLayer layer];
            UIBezierPath *piePath = [UIBezierPath bezierPathWithArcCenter:centerPoint radius:radius/2+hollowDistance/2 startAngle:-M_PI_2 endAngle:M_PI_2*3 clockwise:YES];
            _pieLayer.fillColor = [UIColor clearColor].CGColor;
            _pieLayer.strokeColor = [UIColor lightGrayColor].CGColor;
            _pieLayer.lineWidth = radius-hollowDistance;
            _pieLayer.strokeStart = 0.0f;
            _pieLayer.strokeEnd = 1.0f;
            _pieLayer.path = piePath.CGPath;
            
//            计算dataItems总和
            CGFloat dataItemsTotal = 0.0f;
            for (NSInteger i=0; i<[dataItems count]; i++) {
                dataItemsTotal += [dataItems[i] floatValue];
            }
            
            CGFloat start = 0.0f, end = 0.0f;
            NSInteger colorIndex;
            
//            self.layer的子图层定义
            for (NSInteger i=0; i<[dataItems count]; i++) {
                colorIndex = i;
                end = [dataItems[i] floatValue]/dataItemsTotal + start;
                
                CAShapeLayer *pieItemLayer = [CAShapeLayer layer];
                pieItemLayer.fillColor = [UIColor clearColor].CGColor;
                if (i >= [colorItems count]) {
                    colorIndex = i % [colorItems count];
                }
                pieItemLayer.strokeColor = [(UIColor *)colorItems[colorIndex] CGColor];
                pieItemLayer.lineWidth = radius;
                pieItemLayer.strokeStart = start;
                pieItemLayer.strokeEnd = end;
                pieItemLayer.path = piePath.CGPath;
                
//                [self.pieLayer addSublayer:pieItemLayer];
                [self.layer addSublayer:pieItemLayer];
                
                start = end;
            }
//            [self.layer addSublayer:self.pieLayer];
            self.layer.mask = self.pieLayer;
            
        }
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    return [self initWithFrame:frame dataItems:nil colorItems:nil hollowDistance:0.0f];
}

- (void)showAnimation {
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    animation.duration = 2.0;
    animation.fromValue = @(0.0f);
    animation.toValue = @(1.0f);
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    animation.removedOnCompletion = YES;
    [self.pieLayer addAnimation:animation forKey:nil];
}

@end
