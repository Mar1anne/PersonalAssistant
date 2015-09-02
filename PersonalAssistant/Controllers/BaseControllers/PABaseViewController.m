//
//  PABaseViewController.m
//  PersonalAssistant
//
//  Created by Mariana on 5/3/15.
//  Copyright (c) 2015 Mariana. All rights reserved.
//

#import "PABaseViewController.h"

@implementation PABaseViewController

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
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    if (SYSTEM_VERSION_LESS_THAN(@"7.0")) {
        [self.navigationController.navigationBar setTintColor:[UIColor darkGrayColor]];
    } else {
        [self.navigationController.navigationBar setBarTintColor:[UIColor darkGrayColor]];
    }
    
    if (self.navigationController) {
        self.navigationController.navigationBarHidden = YES;
        self.navigationController.view.backgroundColor = [UIColor whiteColor];
    }
}

- (void)setupConstraints
{
    
}

#pragma mark - Methods

- (void)addCustomTitle:(NSString *)customTitle
{
    UILabel *label = [[UILabel alloc] init];
    label.font = [PADesignManager fontWithSize:16.f];
    label.textColor = [PADesignManager lightFontColor];
    label.text = customTitle;
    
    UIView *containerView = [[UIView alloc] init];
    [containerView addSubview:label];
    
    CGSize labelSize = [label sizeThatFits:CGSizeMake(100, 20)];
    
    label.frame = CGRectMake(-20, -10, labelSize.width, labelSize.height);
    
    self.navigationItem.titleView = containerView;
}

- (void)addRightNavigationBarButtonWithImage:(UIImage *)image
                          accessibilityLabel:(NSString *)accessibilityLabel
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.exclusiveTouch = YES;
    [button addTarget:self action:@selector(onRightNavigationBarButton:) forControlEvents:UIControlEventTouchUpInside];
    button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    button.bounds = CGRectMake(0, 0, 25, 25);
    [button setImage:image forState:UIControlStateNormal];
    
    if (accessibilityLabel) {
        button.isAccessibilityElement = NO;
        button.accessibilityLabel = accessibilityLabel;
    } else {
        button.isAccessibilityElement = NO;
    }
    
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
