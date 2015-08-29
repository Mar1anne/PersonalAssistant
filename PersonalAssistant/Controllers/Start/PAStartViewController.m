//
//  PAStartViewController.m
//  PersonalAssistant
//
//  Created by Mariana on 8/8/15.
//  Copyright (c) 2015 Mariana. All rights reserved.
//

#import "PAStartViewController.h"

@interface PAStartViewController ()

@property (nonatomic, strong) UILabel *startTextLabel;
@property (nonatomic, strong) UILabel *activateLabel;

@end

@implementation PAStartViewController

#pragma mark - View setup

- (void)setupView
{
    [super setupView];

    self.startTextLabel = [[UILabel alloc] init];
    self.startTextLabel.text = @"What would you like me to do ?";
    self.startTextLabel.hidden = YES;
    
    self.activateLabel = [[UILabel alloc] init];
    self.activateLabel.text = @"Make sure you're in a quiet place. \n\n Just say 'Hello world' to get my attention or tap the mic.";
    self.activateLabel.textAlignment = NSTextAlignmentCenter;
    self.activateLabel.numberOfLines = 0;
    self.activateLabel.lineBreakMode = NSLineBreakByWordWrapping;
    
    [self.contentView addSubview:self.activateLabel];
    [self.contentView addSubview:self.startTextLabel];
}

- (void)setupConstraints
{
    [super setupConstraints];
    
        [self.activateLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.contentView);
        make.left.equalTo(self.contentView).offset(20);
        make.right.equalTo(self.contentView).offset(-20);
    }];
    
    [self.startTextLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).offset(20);
        make.right.bottom.equalTo(self.contentView).offset(-20);
    }];
}

#pragma mark - Button Actions

- (void)onCancelButton:(id)sender
{
    NSLog(@"onCancelButton");
}

- (void)onConfirmButton:(id)sender
{
    NSLog(@"onConfirmButton");
}

- (void)onMenuButton:(id)sender
{
    NSLog(@"onMenuButton");
}

@end
