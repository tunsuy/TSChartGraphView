//
//  ViewController.m
//  TSPieView
//
//  Created by tunsuy on 16/4/16.
//  Copyright © 2016年 tunsuy. All rights reserved.
//

#import "ViewController.h"
#import "PieView.h"
#import "HistogramView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    CGRect pieViewFrame = CGRectMake(80, 50, 150, 150);
    NSArray *dataItems = @[@(30), @(20), @(50)];
    NSArray *colorItems = @[[UIColor greenColor], [UIColor redColor], [UIColor yellowColor]];
    PieView *pieView = [[PieView alloc] initWithFrame:pieViewFrame dataItems:dataItems colorItems:colorItems hollowDistance:30.0f];
    [self.view addSubview:pieView];
    
    [pieView showAnimation];
    
    CGRect histogramViewFrame = CGRectMake(50, 220, 220, 150);
    NSArray *nameItems = @[@"初期沟通", @"立项跟踪", @"呈报方案"];
    NSArray *histogramDataItems = @[@(30), @(20), @(50)];
    NSArray *histogramColorItems = @[[UIColor greenColor], [UIColor redColor], [UIColor yellowColor]];
    HistogramView *histogramView = [[HistogramView alloc] initWithFrame:histogramViewFrame nameItems:nameItems dataItems:histogramDataItems colorItems:histogramColorItems];
    [self.view addSubview:histogramView];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
