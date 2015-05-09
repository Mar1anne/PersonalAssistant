//
//  PABaseViewController.m
//  PersonalAssistant
//
//  Created by Mariana on 5/3/15.
//  Copyright (c) 2015 Mariana. All rights reserved.
//

#import "PABaseViewController.h"

@implementation PABaseViewController

- (instancetype)init
{
    self = [super init];
    if (self) {

    }
    return self;
}

#pragma mark - View Lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setupView];
    [self setupConstraints];
}

#pragma mark - View setup

- (void)setupView
{
    self.view.backgroundColor = [UIColor whiteColor];
    
    if (SYSTEM_VERSION_LESS_THAN(@"7.0")) {
        [self.navigationController.navigationBar setTintColor:[UIColor paPurpleColor]];
    } else {
        [self.navigationController.navigationBar setBarTintColor:[UIColor paPurpleColor]];
    }
}

- (void)setupConstraints
{
    
}

#pragma mark - Methods

- (void)addCustomTitle:(NSString *)customTitle
{
    self.title = customTitle;
    
    // TODO : set custom navigation bar view, for setting a title
    // with custom font , size and color
}

- (void)addRightNavigationBarButtonWithImage:(UIImage *)image
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.exclusiveTouch = YES;
    [button addTarget:self action:@selector(onRightNavigationBarButton:) forControlEvents:UIControlEventTouchUpInside];
    button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    button.bounds = CGRectMake(0, 0, 30, 30);
    [button setImage:image forState:UIControlStateNormal];
    
    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc] initWithCustomView:button];
    
    UIBarButtonItem *negativeSpacer = [[UIBarButtonItem alloc]
                                       initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace
                                       target:nil action:nil];
    negativeSpacer.width = -3;
    [self.navigationItem setRightBarButtonItems:[NSArray arrayWithObjects:negativeSpacer, rightButton, nil]
                                       animated:NO];
}

- (void)addLeftNavigationBarButtonWithImage:(UIImage *)image
{
    UIButton *leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
    leftButton.exclusiveTouch = YES;
    [leftButton addTarget:self action:@selector(onLeftNavigationBarButton:) forControlEvents:UIControlEventTouchUpInside];
    
    leftButton.bounds = CGRectMake(0, 0, 30, 30);
    [leftButton setImage:image forState:UIControlStateNormal];
    
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithCustomView:leftButton];
    
    UIBarButtonItem *negativeSpacer = [[UIBarButtonItem alloc]
                                       initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace
                                       target:nil action:nil];
    negativeSpacer.width = -6;
    [self.navigationItem setLeftBarButtonItems:[NSArray arrayWithObjects:negativeSpacer, leftItem, nil]
                                      animated:NO];
}

- (void)onRightNavigationBarButton:(UIBarButtonItem *)button
{
    /* override in child controllers */
}

- (void)onLeftNavigationBarButton:(UIBarButtonItem *)button
{
    /* override in child controllers */
}

@end
