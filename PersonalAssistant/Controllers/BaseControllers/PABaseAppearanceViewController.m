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
    self.contentView.backgroundColor = [[UIColor darkGrayColor] colorWithAlphaComponent:0.1f];
    
    self.controlContainerView = [[UIView alloc] init];
    self.controlContainerView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.8f];
    
    [self.controlContainerView addSubview:self.controlView];
    
    [self.view addSubview:self.contentView];
    [self.view addSubview:self.controlContainerView];
    
    [self addControls];
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

#pragma mark - Control View elements

- (void)addControls
{
    UIButton *menuButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [menuButton setImage:[UIImage imageNamed:@"menu"] forState:UIControlStateNormal];
    [menuButton addTarget:self
                   action:@selector(onMenuButton:)
         forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *cancelButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [cancelButton setImage:[UIImage imageNamed:@"cancel"] forState:UIControlStateNormal];
    [cancelButton addTarget:self
                     action:@selector(onCancelButton:)
           forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *confirmButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [confirmButton setImage:[UIImage imageNamed:@"confirm"] forState:UIControlStateNormal];
    [confirmButton addTarget:self
                      action:@selector(onConfirmButton:)
            forControlEvents:UIControlEventTouchUpInside];
    
    [self.controlView addSubview:menuButton];
    [self.controlView addSubview:cancelButton];
    [self.controlView addSubview:confirmButton];
    
    [menuButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.controlView).offset(10);
        make.width.height.equalTo(@30);
        make.centerY.equalTo(self.controlView);
    }];
    
    [cancelButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(confirmButton.mas_left).offset(-20);
        make.width.height.centerY.equalTo(menuButton);
    }];
    
    [confirmButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.controlView).offset(-10);
        make.width.height.centerY.equalTo(menuButton);
    }];
}

#pragma mark - Button Actions

- (void)onCancelButton:(id)sender
{
    NSLog(@"onCancelButton");
    /* override in child controllers */
}

- (void)onConfirmButton:(id)sender
{
    NSLog(@"onConfirmButton");
    /* override in child controllers */
}

- (void)onMenuButton:(id)sender
{
    NSLog(@"onMenuButton");
    /* override in child controllers */
}

@end
