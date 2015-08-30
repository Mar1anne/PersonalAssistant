//
//  PACreateRemindersViewController.m
//  PersonalAssistant
//
//  Created by Mariana on 8/30/15.
//  Copyright (c) 2015 Mariana. All rights reserved.
//

/**
 * Keywords :
 * Name, save reminder
 * Name, delete reminder
 */

#import "PACreateRemindersViewController.h"

@interface PACreateRemindersViewController ()

@property (nonatomic, strong) UILabel *createReminderLabel;
@property (nonatomic, strong) UITextView *reminderTextView;
@property (nonatomic, strong) UIDatePicker *datePicker;
@property (nonatomic, strong) UITapGestureRecognizer *tapRecognizer;
@property (nonatomic, strong) UIButton *showRemindersButton;

@end

@implementation PACreateRemindersViewController

#pragma mark - View setup

- (void)setupView
{
    [super setupView];
    
    self.createReminderLabel = [[UILabel alloc] init];
    self.createReminderLabel.text = @"Write or dictate your reminder:";
    
    self.reminderTextView = [[UITextView alloc] init];
    self.reminderTextView.layer.cornerRadius = 10.f;
    self.reminderTextView.clipsToBounds = YES;
    
    self.showRemindersButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.showRemindersButton setTitle:@"Show reminders" forState:UIControlStateNormal];
    [self.showRemindersButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.showRemindersButton addTarget:self
                                 action:@selector(onShowReminders:)
                       forControlEvents:UIControlEventTouchUpInside];
    
    [self.contentView addSubview:self.showRemindersButton];
    [self.contentView addSubview:self.createReminderLabel];
    [self.contentView addSubview:self.reminderTextView];
    
    self.tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                 action:@selector(onContentViewTap:)];
    [self.contentView addGestureRecognizer:self.tapRecognizer];
}

- (void)setupConstraints
{
    [super setupConstraints];
    
    CGFloat padding = 10.f;
    
    [self.createReminderLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView).offset(padding * 4);
        make.left.equalTo(self.contentView).offset(padding);
        make.right.equalTo(self.contentView).offset(-padding);
    }];
    
    [self.reminderTextView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.createReminderLabel);
        make.top.equalTo(self.createReminderLabel.mas_bottom).offset(padding * 2);
        make.height.equalTo(@150);
    }];
    
    [self.showRemindersButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.reminderTextView);
        make.top.equalTo(self.reminderTextView.mas_bottom).offset(padding * 2);
        make.height.equalTo(@45);
        make.width.equalTo(@150);
    }];
}

#pragma mark - UITapGestureRecognizer methods

- (void)onContentViewTap:(UITapGestureRecognizer *)tapRecognizer
{
    [self.view endEditing:YES];
}

#pragma mark - Button actions

- (void)onShowReminders:(id)sender
{
    
}

@end
