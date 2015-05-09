//
//  PAMenuBar.m
//  PersonalAssistant
//
//  Created by Mariana on 5/9/15.
//  Copyright (c) 2015 Mariana. All rights reserved.
//

#import "PAMenuBar.h"

@interface PAMenuBar ()

@property (nonatomic, strong) UIImageView *imageView;

@property (nonatomic, strong) UIButton *voiceButton;
@property (nonatomic, strong) UIButton *settingsButton;
@property (nonatomic, strong) UIButton *homeButton;

@end

@implementation PAMenuBar

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        [self setupView];
        [self setupConstraints];
    }
    return self;
}

#pragma mark - View setup

- (void)setupView
{
    self.imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"test_purple"]];
    
    self.voiceButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.voiceButton addTarget:self action:@selector(onVoiceButton:) forControlEvents:UIControlEventTouchUpInside];
    
    self.settingsButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.settingsButton addTarget:self action:@selector(onSettingsButton:) forControlEvents:UIControlEventTouchUpInside];
    
    self.homeButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.homeButton addTarget:self action:@selector(onHomeButton:) forControlEvents:UIControlEventTouchUpInside];
    
    [self addSubview:self.imageView];
    [self addSubview:self.voiceButton];
    [self addSubview:self.settingsButton];
    [self addSubview:self.homeButton];
}

- (void)setupConstraints
{
    [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];
    
    [self.voiceButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self);
    }];
    
    [self.settingsButton mas_makeConstraints:^(MASConstraintMaker *make) {
        
    }];
    
    [self.homeButton mas_makeConstraints:^(MASConstraintMaker *make) {
        
    }];
}

#pragma mark - Button Actions

// TODO : define delegate methods

- (void)onSettingsButton:(UIButton *)button
{
    
}

- (void)onVoiceButton:(UIButton *)button
{
    
}

- (void)onHomeButton:(UIButton *)homeButton
{
    
}

@end
