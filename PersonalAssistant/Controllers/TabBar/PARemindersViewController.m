//
//  PARemindersViewController.m
//  PersonalAssistant
//
//  Created by Mariana on 5/4/15.
//  Copyright (c) 2015 Mariana. All rights reserved.
//

#import "PARemindersViewController.h"
#import "PAReminderManager.h"
#import "PAReminderTableViewCell.h"

#define kReminderCellIdentifier @"kReminderCellIdentifier"

@interface PARemindersViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UILabel *emptyTableLabel;

@property (nonatomic, strong) NSMutableArray *remindersArray;

@end

@implementation PARemindersViewController

#pragma mark - View Lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.remindersArray = [NSMutableArray array];
    
    [self populateRemindersData];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self populateRemindersData];
}

#pragma mark - View setup

- (void)setupView
{
    [super setupView];

    [self addCustomTitle:@"Reminders"];
    
    self.navigationController.navigationBarHidden = NO;
    self.isConfirmButtonVisible = NO;
    self.isCancelButtonVisible = NO;
    
    self.tableView = [[UITableView alloc] init];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.tableFooterView = [UIView new];
    self.tableView.allowsMultipleSelectionDuringEditing = NO;
    self.tableView.allowsMultipleSelection = NO;
    
    [self.tableView registerClass:[PAReminderTableViewCell class]
           forCellReuseIdentifier:kReminderCellIdentifier];
    
    [self.contentView addSubview:self.tableView];
    
    [self addRightNavigationBarButtonWithImage:[UIImage imageNamed:@"cancel"]];
}

- (void)setupConstraints
{
    [super setupConstraints];
    
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(self.contentView);
        make.top.equalTo(self.contentView).offset(20);
    }];
}

#pragma mark - Methods

- (void)populateRemindersData
{
    PAReminderManager *remindersManager = [PAReminderManager sharedManager];
    
    [remindersManager.eventStore requestAccessToEntityType:EKEntityTypeReminder
                                                                 completion:^(BOOL granted, NSError *error)
     {
         if (granted) {
             
             NSPredicate *predicate = [remindersManager.eventStore predicateForRemindersInCalendars:nil];
             
             [remindersManager.eventStore fetchRemindersMatchingPredicate:predicate
                                                               completion:^(NSArray *reminders)
              {
                  [self.remindersArray removeAllObjects];
                  [self.remindersArray addObjectsFromArray:reminders];
                  
                  dispatch_async(dispatch_get_main_queue(), ^{
                      [self.tableView reloadData];
                  });
             }];
             
         } else {
             [[[UIAlertView alloc] initWithTitle:nil
                                         message:@"This application does not have access to your reminders"
                                        delegate:self
                               cancelButtonTitle:@"OK"
                               otherButtonTitles:nil, nil] show];
         }
     }];
}

#pragma mark - PABaseViewController overrides

- (void)onRightNavigationBarButton:(UIBarButtonItem *)button
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - UITableViewDelegate & UITableViewDatasource methods

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        EKReminder *reminder = (EKReminder *)self.remindersArray[indexPath.row];
        
        NSError *error = nil;
        [[PAReminderManager sharedManager].eventStore removeReminder:reminder
                                                              commit:YES
                                                               error:&error];
        if (!error) {
            
            [self populateRemindersData];
            
            NSLog(@"Reminder successfully deleted");
            
        } else {
            [[[UIAlertView alloc] initWithTitle:nil
                                        message:@"Unable to delete reminder"
                                       delegate:self
                              cancelButtonTitle:@"OK"
                              otherButtonTitles:nil, nil] show];
        }
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.remindersArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    PAReminderTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kReminderCellIdentifier
                                                                    forIndexPath:indexPath];
    
    EKReminder *reminder = (EKReminder *)self.remindersArray[indexPath.row];
    
    cell.textLabel.text = reminder.title ? reminder.title : [NSString stringWithFormat:@"Reminder %ld", (long)indexPath.row];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 65.f;
}

@end
