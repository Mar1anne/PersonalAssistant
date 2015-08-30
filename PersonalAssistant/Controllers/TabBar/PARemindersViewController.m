//
//  PARemindersViewController.m
//  PersonalAssistant
//
//  Created by Mariana on 5/4/15.
//  Copyright (c) 2015 Mariana. All rights reserved.
//

#import "PARemindersViewController.h"
#import "PAReminderManager.h"

@interface PARemindersViewController ()

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UILabel *emptyTableLabel;

@end

@implementation PARemindersViewController

#pragma mark - View Lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
}

#pragma mark - View setup

- (void)setupView
{
    [super setupView];

    [self addCustomTitle:@"Reminders"];
    
    self.navigationController.navigationBarHidden = NO;
    self.isConfirmButtonVisible = NO;
    self.isCancelButtonVisible = NO;
    
    [self addRightNavigationBarButtonWithImage:[UIImage imageNamed:@"cancel"]];
}

#pragma mark - Methods

- (void)populateRemindersData
{
    [[PAReminderManager sharedManager].eventStore requestAccessToEntityType:EKEntityTypeReminder
                                                                 completion:^(BOOL granted, NSError *error)
     {
         if (granted) {
             
         }
     }];
}

#pragma mark - PABaseViewController overrides

- (void)onRightNavigationBarButton:(UIBarButtonItem *)button
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
