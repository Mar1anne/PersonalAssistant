//
//  PAContactListViewController.m
//  PersonalAssistant
//
//  Created by Mariana on 5/10/15.
//  Copyright (c) 2015 Mariana. All rights reserved.
//

#import "PAContactListViewController.h"

@interface PAContactListViewController ()

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation PAContactListViewController

#pragma mark - View setup

- (void)setupView
{
    [super setupView];
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    
    [self.view addSubview:self.tableView];
}

- (void)setupConstraints
{
    [super setupConstraints];
    
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];
}

@end
