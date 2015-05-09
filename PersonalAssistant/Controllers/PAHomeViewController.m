//
//  PAHomeViewController.m
//  PersonalAssistant
//
//  Created by Mariana on 5/9/15.
//  Copyright (c) 2015 Mariana. All rights reserved.
//

#import "PAHomeViewController.h"


@interface PAHomeViewController ()

@property (nonatomic, strong) UIButton *goButton;

@end


@implementation PAHomeViewController

#pragma mark - View setup

- (void)setupView
{
    [super setupView];
    
    self.goButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.goButton setTitle:@"Go" forState:UIControlStateNormal];
    [self.goButton setBackgroundColor:[UIColor paPurpleColor]];
    [self.goButton addTarget:self
                      action:@selector(onGoButton:)
            forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:self.goButton];
}

- (void)setupConstraints
{
    [super setupConstraints];
    
    [self.goButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.view);
        make.height.equalTo(@50);
        make.width.equalTo(@100);
    }];
}

#pragma mark - Button Actions

- (void)onGoButton:(UIButton *)button
{
    [self.navigationController pushViewController:[PAControllerManager getMainMenuController]
                                         animated:YES];
}

@end
