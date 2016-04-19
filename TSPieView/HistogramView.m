//
//  HistogramView.m
//  TSPieView
//
//  Created by tunsuy on 18/4/16.
//  Copyright © 2016年 tunsuy. All rights reserved.
//

#import "HistogramView.h"
#import "TextHandler.h"

#define kItemSpacing 10
#define kBottomLine 1
#define kFontSize 16

@interface HistogramView(){
    CGFloat histogramViewWidth;
    CGFloat histogramViewHeight;
    CGFloat itemWidth;
    CGFloat itemHeight;
    CGFloat subLabelWidth;
    
    NSInteger itemCount;
}

@property (nonatomic, getter=isShow) BOOL show;

@end

@implementation HistogramView

- (void)initDataWithItems:(NSArray *)items {
    itemCount = [items count];
    histogramViewWidth = self.frame.size.width;
    histogramViewHeight = self.frame.size.height;
    itemWidth = (histogramViewWidth-kItemSpacing) / itemCount - kItemSpacing;
}

- (instancetype)initWithFrame:(CGRect)frame nameItems:(NSArray *)nameItems dataItems:(NSArray *)dataItems colorItems:(NSArray *)colorItems {
    self = [super initWithFrame:frame];
    if (self) {
        if ([nameItems count] != [dataItems count] && [nameItems count] != [colorItems count]) {
            return self;
        }
        
        self.clipsToBounds = YES;
        
        [self initDataWithItems:nameItems];
        
        UIView *bottomLine = [[UIView alloc] initWithFrame:CGRectMake(0, histogramViewHeight-kBottomLine, histogramViewWidth, kBottomLine)];
        bottomLine.backgroundColor = [UIColor lightGrayColor];
        [self addSubview:bottomLine];
        
        CGFloat maxItem = 0.0f;
        for (id item in dataItems) {
            NSAssert([item floatValue], @"item must is nsnumber type !!");
            maxItem = MAX(maxItem, [item floatValue]);
        }
        
        for (NSInteger i=0; i<itemCount; i++) {
            itemHeight = histogramViewHeight*[dataItems[i] floatValue]/maxItem;
            UILabel *itemLabel = [[UILabel alloc] initWithFrame:CGRectMake(kItemSpacing+i*(itemWidth+kItemSpacing), CGRectGetMinY(bottomLine.frame)-itemHeight, itemWidth, itemHeight)];
            itemLabel.backgroundColor = [UIColor clearColor];
            
            CGFloat oneCNWord = [TextHandler sizeOfOneCNWordWithFontSize:kFontSize].width;
            subLabelWidth = MIN(itemWidth, oneCNWord+10);
            UILabel *subLabel = [[UILabel alloc] initWithFrame:CGRectMake((itemWidth-subLabelWidth)/2, 0, subLabelWidth, itemHeight)];
            subLabel.backgroundColor = colorItems[i];
            subLabel.text = nameItems[i];
            subLabel.numberOfLines = 0;
            subLabel.font = [UIFont systemFontOfSize:kFontSize];
            subLabel.textAlignment = NSTextAlignmentCenter;
            [self addSubview:itemLabel];
            [itemLabel addSubview:subLabel];
            [self showAnimationWithView:subLabel];
        }
        
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    return [self initWithFrame:frame nameItems:nil dataItems:nil colorItems:nil];
}

//动画：方法一
- (void)showAnimationWithView:(UIView *)view {
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"bounds"];
    animation.duration = 5.0f;
    animation.fromValue = [NSValue valueWithCGRect:CGRectMake(0, -itemHeight, subLabelWidth, itemHeight)];
    animation.toValue = [NSValue valueWithCGRect:CGRectMake(0, 0, subLabelWidth, itemHeight)];
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    animation.removedOnCompletion = YES;
    [view.layer addAnimation:animation forKey:nil];
}

//动画：方法二-向pieView的思路来做

@end
