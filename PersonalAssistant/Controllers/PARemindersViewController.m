//
//  PARemindersViewController.m
//  PersonalAssistant
//
//  Created by Mariana on 5/4/15.
//  Copyright (c) 2015 Mariana. All rights reserved.
//

#import "PARemindersViewController.h"

@interface PARemindersViewController ()

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UILabel *emptyTableLabel;

@end

@implementation PARemindersViewController

#pragma mark - View setup

- (void)setupView
{
    [super setupView];

    [self addCustomTitle:@"Reminders"];
    [self addRightNavigationBarButtonWithImage:[UIImage imageNamed:@"plus_icon"]];
}

#pragma mark - Methods

#pragma mark - PABaseViewController overrides

- (void)onRightNavigationBarButton:(UIBarButtonItem *)button
{
    
}

@end
