//
//  PAContactListViewController.m
//  PersonalAssistant
//
//  Created by Mariana on 5/10/15.
//  Copyright (c) 2015 Mariana. All rights reserved.
//

#import "PAContactListViewController.h"
#import "APAddressBook.h"
#import "APContact.h"

@interface PAContactListViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *tableData;

@end

@implementation PAContactListViewController

- (instancetype)initWithType:(PAContactsListType)type
{
    self = [super init];
    if (self) {
        
        _type = type;
    }
    return self;
}

#pragma mark - View Lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    APAddressBook *addressBook = [[APAddressBook alloc] init];
    addressBook.fieldsMask = APContactFieldEmails | APContactFieldFirstName | APContactFieldLastName | APContactFieldPhones;
    
    [MBProgressHUD showHUDAddedTo:[PAControllerManager mainWindow] animated:YES];
    
    [addressBook loadContacts:^(NSArray *contacts, NSError *error) {
        
        [MBProgressHUD hideAllHUDsForView:[PAControllerManager mainWindow] animated:YES];
        
        self.tableData = [NSMutableArray arrayWithArray:contacts];
        
        [self.tableView reloadData];
    }];
}

#pragma mark - View setup

- (void)setupView
{
    [super setupView];
    
    [self addCustomTitle:@"Contact List"];
    
    self.navigationController.navigationBarHidden = NO;
    [self addRightNavigationBarButtonWithImage:[UIImage imageNamed:@"cancel"]
                            accessibilityLabel:@"Close list"];
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    self.isConfirmButtonVisible = NO;
    self.isCancelButtonVisible = NO;
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"ContactsCell"];
    
    self.tableData = [NSMutableArray array];
    
    [self.contentView addSubview:self.tableView];
}

- (void)setupConstraints
{
    [super setupConstraints];
    
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(self.contentView);
        make.top.equalTo(self.contentView).offset(20);
    }];
}

#pragma mark - Button Actions

- (void)onRightNavigationBarButton:(UIBarButtonItem *)button
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - Helper methods

- (void)addContacts:(NSArray *)contacts
{
    if (!self.tableData) {
        self.tableData = [NSMutableArray array];
    }

    for (APContact *contact in contacts) {
        if ((self.type == PAContactsListTypeEmail && contact.emails.count > 0) ||
            (self.type != PAContactsListTypeEmail && contact.phones.count > 0)) {
            [self.tableData addObject:contact];
        }
    }
}

#pragma mark - Methods

- (void)callContact:(APContact *)contact
{
    [self.containerController openCallControllerForContact:contact];
}

- (void)sendMessageToContact:(APContact *)contact
{
    [self.containerController openSmsControllerForContact:contact];
}

- (void)sendEmailToContact:(APContact *)contact
{
    [self.containerController openEmailControllerForContact:contact];
}

#pragma mark - UITableViewDataSource & UITableViewDelegate methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.tableData.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *identifier = @"ContactsCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
    
    APContact *contact = (APContact *)self.tableData[indexPath.row];
    cell.textLabel.text = [NSString stringWithFormat:@"%@ %@",contact.firstName, contact.lastName];
    cell.textLabel.font = [PADesignManager fontWithSize:15.f];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    APContact *contact = (APContact *)self.tableData[indexPath.row];
    
    if (self.type == PAContactsListTypeCall) {
        [self callContact:contact];
    } else if (self.type == PAContactsListTypeEmail) {
        [self sendEmailToContact:contact];
    } else {
        [self sendMessageToContact:contact];
    }
}

@end
