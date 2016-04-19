//
//  PieView.h
//  TSPieView
//
//  Created by tunsuy on 16/4/16.
//  Copyright © 2016年 tunsuy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PieView : UIView

/**
 *
 * @param frame 
 * @param dataItems       界面相关数据，用于展示百分比
 * @param colorItems      颜色，用于区分各不同百分比的数据
 * @param hollowDistance  中间空心距离
 *
 */
- (instancetype)initWithFrame:(CGRect)frame dataItems:(NSArray *)dataItems colorItems:(NSArray *)colorItems hollowDistance:(CGFloat)hollowDistance;
- (void)showAnimation;

@end
