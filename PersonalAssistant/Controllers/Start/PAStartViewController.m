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
    self.startTextLabel.font = [PADesignManager fontWithSize:17.f];

    self.activateLabel = [[UILabel alloc] init];
    self.activateLabel.text = @"Make sure you're in a quiet place. \n\n Just 'Hello Inna' or tap the microphone button to get my attention";
    self.activateLabel.textAlignment = NSTextAlignmentCenter;
    self.activateLabel.numberOfLines = 0;
    self.activateLabel.lineBreakMode = NSLineBreakByWordWrapping;
    self.activateLabel.font = [PADesignManager fontWithSize:17.f];

    [self.contentView addSubview:self.activateLabel];
    [self.contentView addSubview:self.startTextLabel];
    
    self.isCancelButtonVisible = NO;
    self.isConfirmButtonVisible = NO;
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

@end
