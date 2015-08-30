//
//  PAMenuViewController.m
//  PersonalAssistant
//
//  Created by Mariana on 8/30/15.
//  Copyright (c) 2015 Mariana. All rights reserved.
//

#define kCellIdentifier @"kCellIdentifier"

#import "PAMenuViewController.h"
#import "PAMenuTableViewCell.h"
#import "PAMenuCellViewFactory.h"
#import "PARemindersViewController.h"
#import "PAMainContainerViewController.h"

@interface PAMenuViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation PAMenuViewController

#pragma mark - View Lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.navigationController.navigationBarHidden = NO;
}

#pragma mark - View setup

- (void)setupView
{
    [super setupView];
    
    self.view.backgroundColor = [[UIColor lightGrayColor] colorWithAlphaComponent:0.5f];
    
    self.tableView = [[UITableView alloc] init];
    self.tableView.backgroundColor = [UIColor clearColor];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.tableFooterView = [UIView new];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    [self.tableView registerClass:[PAMenuTableViewCell class]
           forCellReuseIdentifier:kCellIdentifier];
    
    [self.view addSubview:self.tableView];
}

- (void)setupConstraints
{
    [super setupConstraints];
    
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
}

#pragma mark - UITableViewDelegate methods

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    PAMainContainerViewController *controller =[[PAMainContainerViewController alloc] initWithSelection:indexPath.row];
    
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:controller];
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [self presentViewController:navController animated:YES completion:nil];
    });
}

#pragma mark - UITableViewDatasource methods 

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 6;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    PAMenuTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kCellIdentifier
                                                                forIndexPath:indexPath];
    cell.cellImageView.image = [PAMenuCellViewFactory itemImageForIndex:indexPath.row];
    cell.cellLabel.text = [PAMenuCellViewFactory itemNameForIndex:indexPath.row];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 65.f;
}

@end
