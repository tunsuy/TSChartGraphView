//
//  HistogramView.h
//  TSPieView
//
//  Created by tunsuy on 18/4/16.
//  Copyright © 2016年 tunsuy. All rights reserved.
//

#import <UIKit/UIKit.h>

//typedef CAAnimation * (^animationCallback)();

@interface HistogramView : UIView

//@property (nonatomic, getter=isAnimation) BOOL animation;

//- (instancetype)initWithFrame:(CGRect)frame nameItems:(NSArray *)nameItems dataItems:(NSArray *)dataItems colorItems:(NSArray *)colorItems animationCallback:(animationCallback)animationCallback;
- (instancetype)initWithFrame:(CGRect)frame nameItems:(NSArray *)nameItems dataItems:(NSArray *)dataItems colorItems:(NSArray *)colorItems;
//- (void)showAnimation;

@end
