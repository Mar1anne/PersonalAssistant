//
//  PABaseAppearanceViewController.m
//  PersonalAssistant
//
//  Created by Mariana on 8/8/15.
//  Copyright (c) 2015 Mariana. All rights reserved.
//

#import "PABaseAppearanceViewController.h"

@interface PABaseAppearanceViewController ()

@property (nonatomic, strong) UIView *controlContainerView;

@end

@implementation PABaseAppearanceViewController

- (void)setupView
{
    [super setupView];
    
    self.controlView = [[UIView alloc] init];
    self.controlView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.2f];
    
    self.contentView = [[UIView alloc] init];
    self.contentView.backgroundColor = [[UIColor darkGrayColor] colorWithAlphaComponent:0.3f];
    
    self.controlContainerView = [[UIView alloc] init];
    self.controlContainerView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.8f];
    
    [self.controlContainerView addSubview:self.controlView];
    
    [self.view addSubview:self.contentView];
    [self.view addSubview:self.controlContainerView];
}

- (void)setupConstraints
{
    [super setupConstraints];
    
    [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.equalTo(self.view);
        make.height.equalTo(self.view).multipliedBy(0.6);
    }];
    
    [self.controlContainerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(self.view);
        make.top.equalTo(self.contentView.mas_bottom);
    }];
    
    [self.controlView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.equalTo(self.controlContainerView);
        make.height.equalTo(@50);
    }];
}

@end
