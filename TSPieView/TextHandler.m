//
//  TextHandler.m
//  TSPieView
//
//  Created by tunsuy on 19/4/16.
//  Copyright © 2016年 tunsuy. All rights reserved.
//

#import "TextHandler.h"

@implementation TextHandler

+ (CGSize)sizeOfOneCNWordWithFontSize:(CGFloat)fontSize {
    NSString *oneWord = @"一";
    NSDictionary *attributes = @{NSFontAttributeName: [UIFont systemFontOfSize:fontSize]};
    CGSize size = [oneWord sizeWithAttributes:attributes];
    return size;
}

@end
