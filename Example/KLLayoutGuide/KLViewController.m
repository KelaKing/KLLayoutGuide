//
//  KLViewController.m
//  KLLayoutGuide
//
//  Created by KelaKing on 01/25/2018.
//  Copyright (c) 2018 KelaKing. All rights reserved.
//

#import "KLViewController.h"

@interface KLViewController ()

@end

@implementation KLViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UILayoutGuide *layoutGuide = [UILayoutGuide new];
    [self.view addLayoutGuide:layoutGuide];
    [layoutGuide.topAnchor constraintEqualToAnchor:self.view.topAnchor constant:100].active = YES;
    [layoutGuide.leftAnchor constraintEqualToAnchor:self.view.leftAnchor constant:30].active = YES;
    [layoutGuide.rightAnchor constraintEqualToAnchor:self.view.rightAnchor constant:-30].active = YES;
    [layoutGuide.heightAnchor constraintEqualToConstant:200].active = YES;
    
    UIView *redView = [UIView new];
    redView.translatesAutoresizingMaskIntoConstraints = NO;
    redView.backgroundColor = [UIColor redColor];
    [self.view addSubview:redView];
    [redView.widthAnchor constraintEqualToConstant:60].active = YES;
    [redView.heightAnchor constraintEqualToAnchor:redView.widthAnchor].active = YES;
    [redView.leftAnchor constraintEqualToAnchor:layoutGuide.leftAnchor].active = YES;
    [redView.topAnchor constraintEqualToAnchor:layoutGuide.topAnchor].active = YES;
}

@end
