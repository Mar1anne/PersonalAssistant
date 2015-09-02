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
#import "PALabeledTextFiled.h"
#import "PARemindersViewController.h"
#import "PAReminderManager.h"
#import "PAFadeControllerTransition.h"

@interface PACreateRemindersViewController ()

@property (nonatomic, strong) PALabeledTextFiled *reminderTitleTextField;

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
    self.createReminderLabel.font = [PADesignManager fontWithSize:15.f];
    
    self.reminderTitleTextField = [[PALabeledTextFiled alloc] init];
    self.reminderTitleTextField.labelText = @"Title";
    self.reminderTitleTextField.label.font = [PADesignManager fontWithSize:15.f];
    self.reminderTitleTextField.label.isAccessibilityElement = NO;
    self.reminderTitleTextField.textField.isAccessibilityElement = YES;
    self.reminderTitleTextField.accessibilityLabel = @"Enter reminder title";
    self.reminderTitleTextField.layer.cornerRadius = 10.f;
    self.reminderTitleTextField.clipsToBounds = YES;
    self.reminderTitleTextField.backgroundColor = [UIColor whiteColor];
    
    self.reminderTextView = [[UITextView alloc] init];
    self.reminderTextView.isAccessibilityElement = YES;
    self.reminderTextView.accessibilityLabel = @"Enter reminder content";
    self.reminderTextView.layer.cornerRadius = 10.f;
    self.reminderTextView.clipsToBounds = YES;
    self.reminderTextView.font = [PADesignManager fontWithSize:14.f];
    
    self.datePicker = [[UIDatePicker alloc] init];
    self.datePicker.isAccessibilityElement = YES;
    self.datePicker.accessibilityLabel = @"Pick date";
    self.datePicker.datePickerMode = UIDatePickerModeDateAndTime;
    
    self.showRemindersButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.showRemindersButton.accessibilityLabel = @"Show reminders";
    [self.showRemindersButton setBackgroundImage:[UIImage imageNamed:@"list"] forState:UIControlStateNormal];
    [self.showRemindersButton addTarget:self
                                 action:@selector(onShowReminders:)
                       forControlEvents:UIControlEventTouchUpInside];
    
    [self.contentView addSubview:self.datePicker];
    [self.contentView addSubview:self.reminderTitleTextField];
    [self.contentView addSubview:self.createReminderLabel];
    [self.contentView addSubview:self.reminderTextView];
    
    [self.controlView addSubview:self.showRemindersButton];
    
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
    
    [self.reminderTitleTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.createReminderLabel);
        make.top.equalTo(self.createReminderLabel.mas_bottom).offset(padding * 2);
        make.height.equalTo(@30);
    }];
    
    [self.reminderTextView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.createReminderLabel);
        make.top.equalTo(self.reminderTitleTextField.mas_bottom).offset(padding);
        make.height.equalTo(@100);
    }];
    
    [self.datePicker mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.reminderTextView);
        make.top.equalTo(self.reminderTextView.mas_bottom).offset(padding * 2);
        make.height.equalTo(@50);
    }];
    
    [self.showRemindersButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.menuButton.mas_right).offset(padding * 2);
        make.centerY.width.height.equalTo(self.menuButton);
    }];
}

#pragma mark - Methods

- (void)createReminder
{
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    
    PAReminderManager *reminderManager = [PAReminderManager sharedManager];
    
    EKReminder *reminder = [EKReminder reminderWithEventStore:reminderManager.eventStore];
    EKAlarm *alarm = [EKAlarm alarmWithAbsoluteDate:self.datePicker.date];

    reminder.calendar = [reminderManager.eventStore defaultCalendarForNewReminders];
    [reminder addAlarm:alarm];
    
    NSError *error = nil;
    
    [reminderManager.eventStore saveReminder:reminder commit:YES error:&error];
    
    [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
    
    if (error) {
        [[[UIAlertView alloc] initWithTitle:nil
                                   message:@"An error occured while saving reminder"
                                  delegate:self
                         cancelButtonTitle:@"OK"
                          otherButtonTitles:nil, nil] show];
    } else {
        
        self.reminderTextView.text = nil;
        self.reminderTitleTextField.text = nil;
        self.datePicker.date = [NSDate date];
        
        NSLog(@"Reminder successfully saved");
    }
}

#pragma mark - UITapGestureRecognizer methods

- (void)onContentViewTap:(UITapGestureRecognizer *)tapRecognizer
{
    [self.view endEditing:YES];
}

#pragma mark - Button actions

- (void)onShowReminders:(id)sender
{
    PARemindersViewController *reminderController = [[PARemindersViewController alloc] init];
    
    if (UIAccessibilityIsReduceMotionEnabled()) {
        
        PAFadeTransition *modalTransition = [[PAFadeTransition alloc] initWithAnimationDuration:0.3];
        PAModalTransitionDelegate *modalTransiotionDelegate = [[PAModalTransitionDelegate alloc] initWithReverisbleTransition:modalTransition];
        
        PATransparentNavigationViewController *navigationController =
        [[PATransparentNavigationViewController alloc] initWithRootViewController:reminderController];
        
        navigationController.customModalTranstion = modalTransiotionDelegate;
        
        [self.containerController presentViewController:navigationController animated:YES completion:nil];
        
    } else {
        
        UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:reminderController];
        
        if (self.containerController.navigationController) {
            [self.containerController.navigationController presentViewController:navController animated:YES completion:nil];
        } else {
            [self.containerController presentViewController:navController animated:YES completion:nil];
        }
    }
}

#pragma mark - PABaseAppearanceViewController overrides

- (void)onConfirmButton:(id)sender
{
    if (self.reminderTitleTextField.text.length < 1) {
        
        [[[UIAlertView alloc] initWithTitle:nil
                                    message:@"Please enter title"
                                   delegate:self
                          cancelButtonTitle:@"Ok"
                          otherButtonTitles:nil, nil] show];
        
    } else if (!self.reminderTitleTextField) {
        
        [[[UIAlertView alloc] initWithTitle:nil
                                    message:@"Please enter title"
                                   delegate:self
                          cancelButtonTitle:@"Ok"
                          otherButtonTitles:nil, nil] show];
    } else {
        [self createReminder];
    }
}

@end
