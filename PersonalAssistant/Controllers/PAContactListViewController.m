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

#pragma mark - View Lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    APAddressBook *addressBook = [[APAddressBook alloc] init];
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
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"ContactsCell"];
    
    self.tableData = [NSMutableArray array];
    
    [self.view addSubview:self.tableView];
}

- (void)setupConstraints
{
    [super setupConstraints];
    
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
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
    cell.textLabel.text = contact.firstName;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

@end
