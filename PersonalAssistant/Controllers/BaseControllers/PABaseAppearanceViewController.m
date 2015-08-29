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

@property (nonatomic, strong) UIButton *menuButton;
@property (nonatomic, strong) UIButton *cancelButton;
@property (nonatomic, strong) UIButton *confirmButton;

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
    self.menuButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.menuButton setImage:[UIImage imageNamed:@"menu"] forState:UIControlStateNormal];
    [self.menuButton addTarget:self
                   action:@selector(onMenuButton:)
         forControlEvents:UIControlEventTouchUpInside];
    
    self.cancelButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.cancelButton setImage:[UIImage imageNamed:@"cancel"] forState:UIControlStateNormal];
    [self.cancelButton addTarget:self
                     action:@selector(onCancelButton:)
           forControlEvents:UIControlEventTouchUpInside];
    
    self.confirmButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.confirmButton setImage:[UIImage imageNamed:@"confirm"] forState:UIControlStateNormal];
    [self.confirmButton addTarget:self
                      action:@selector(onConfirmButton:)
            forControlEvents:UIControlEventTouchUpInside];
    
    [self.controlView addSubview:self.menuButton];
    [self.controlView addSubview:self.cancelButton];
    [self.controlView addSubview:self.confirmButton];
    
    [self.menuButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.controlView).offset(10);
        make.width.height.equalTo(@30);
        make.centerY.equalTo(self.controlView);
    }];
    
    [self.cancelButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.confirmButton.mas_left).offset(-20);
        make.width.height.centerY.equalTo(self.menuButton);
    }];
    
    [self.confirmButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.controlView).offset(-10);
        make.width.height.centerY.equalTo(self.menuButton);
    }];
}

#pragma mark - Button Actions

- (void)onCancelButton:(id)sender
{
    /* override in child controllers */
}

- (void)onConfirmButton:(id)sender
{
    /* override in child controllers */
}

- (void)onMenuButton:(id)sender
{
    /* override in child controllers */
}

#pragma mark - Custom setters

- (void)setIsMenuButtonVisible:(BOOL)isMenuButtonVisible
{
    self.menuButton.hidden = !isMenuButtonVisible;
}

- (void)setIsCancelButtonVisible:(BOOL)isCancelButtonVisible
{
    self.cancelButton.hidden = !isCancelButtonVisible;
}

- (void)setIsConfirmButtonVisible:(BOOL)isConfirmButtonVisible
{
    self.confirmButton.hidden = !isConfirmButtonVisible;
}

@end
