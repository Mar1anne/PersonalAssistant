//
//  PAContainerViewController.m
//  PersonalAssistant
//
//  Created by Mariana on 5/3/15.
//  Copyright (c) 2015 Mariana. All rights reserved.
//

#import "PAContainerViewController.h"
#import "PATabBar.h"
#import "PATabBaritem.h"
#import "PABaseViewController.h"

@interface PAContainerViewController ()

@property (nonatomic,strong) UIView *containerView;
@property (nonatomic,strong) UIView *controllerView;
@property (nonatomic,strong) PATabBar *buttonsView;
@property (nonatomic,strong) UIViewController *visibleController;

@end

@implementation PAContainerViewController

#pragma mark - View Lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setupViews];
}

#pragma mark - View setup

- (void)setupViews
{
    // Setup the containerView holding the navBar and default controllers
    self.containerView = [[UIView alloc] init];
    
    [self.view addSubview:self.containerView];
    
    CGSize screenSize = [UIScreen mainScreen].bounds.size;
    
    [self.containerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left);
        make.width.equalTo(@(screenSize.width));
        make.bottom.equalTo(self.view.mas_bottom);
        make.top.equalTo(self.view.mas_top);
    }];
    
    self.controllerView = [[UIView alloc] init];
    [self.containerView addSubview:self.controllerView];
    
    self.buttonsView = [[PATabBar alloc] init];
    self.buttonsView.backgroundColor = [UIColor paPurpleColor];
    
    [self.containerView addSubview:self.buttonsView];
    
    // Set constraint to views
    [self.buttonsView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@0);
        make.right.equalTo(self.containerView.mas_right);
        make.bottom.equalTo(self.containerView.mas_bottom);
        make.height.equalTo(@(66));
    }];
    
    [self.controllerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.containerView);
        make.top.equalTo(self.containerView);
        make.right.equalTo(self.containerView);
        make.bottom.equalTo(self.containerView);
    }];
    
    [self setupButtonsWithItems:self.tabBarItems];
}

- (void)setupButtonsWithItems:(NSArray *)items
{
    if (!self.buttonsView) return;
    
    NSArray* tabBarButtons  = [self.buttonsView arrangeButtonsForItems:items];
    for (UIButton* button in tabBarButtons) {
        [button addTarget:self action:@selector(didClickButton:) forControlEvents:UIControlEventTouchUpInside];
    }
}

#pragma mark - Property Methods

- (void)setTabBarItems:(NSArray *)tabBarItems
{
    _tabBarItems = tabBarItems;
    [self setupButtonsWithItems:tabBarItems];
    [self.view layoutIfNeeded];
    [self selectViewControllerAtIndex:0];
}

- (void)selectViewControllerAtIndex:(NSInteger)index
{
    PATabBaritem *item = self.tabBarItems[index];
    UIViewController *controller = item.viewController;
    
    if (!controller.parentViewController) {
        [self.buttonsView selectButtonAtIndex:index];
        _selectedIndex = index;
        
        [self removeVisibleController];
        
        [self addChildViewController:controller];
        
        [self.controllerView addSubview:controller.view];
        
        [controller.view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self.controllerView);
        }];
        
        [controller didMoveToParentViewController:self];
        
        UINavigationController *nc = (UINavigationController*) controller;
//        
//        if([nc.topViewController respondsToSelector:@selector(controllerMovedToFocus:)]){
//            [((PPBaseViewController *)nc.topViewController) controllerMovedToFocus:YES];
//        }
        
        self.visibleController = controller;
    }

}

#pragma mark - Button Methods

- (void)didClickButton:(UIButton *)sender
{
    NSInteger index = sender.tag;
    
    if (self.selectedIndex != index) {

        [self selectViewControllerAtIndex:index];
    }
    else {
        PATabBaritem *selectedItem = self.tabBarItems[index];
        
        UIViewController *controller = selectedItem.viewController;
        
        if ([controller isKindOfClass:[UINavigationController class]]) {
            
            UINavigationController *navController = (UINavigationController *) controller;
            [navController popToRootViewControllerAnimated:YES];
        }
    }
}

#pragma mark - Methods

- (void)removeVisibleController
{
    [self.visibleController willMoveToParentViewController:nil];
    [self.visibleController.view removeFromSuperview];
    [self.visibleController removeFromParentViewController];
    
    UIViewController *c = ((UINavigationController*)self.visibleController).topViewController;
    
//    if([c respondsToSelector:@selector(controllerMovedToFocus:)]){
//        [((PABaseViewController *)c) controllerMovedToFocus:NO];
//    }
    
    self.visibleController = nil;
}

@end
