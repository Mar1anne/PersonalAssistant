//
//  PABaseAppearanceViewController.h
//  PersonalAssistant
//
//  Created by Mariana on 8/8/15.
//  Copyright (c) 2015 Mariana. All rights reserved.
//

#import "PABaseViewController.h"

@interface PABaseAppearanceViewController : PABaseViewController

@property (nonatomic, strong) UIView *contentView;
@property (nonatomic, strong) UIView *controlView;
@property (nonatomic, strong) UIView *controlContainerView;

@property (nonatomic, strong) UIButton *menuButton;
@property (nonatomic, strong) UIButton *cancelButton;
@property (nonatomic, strong) UIButton *confirmButton;

@property (nonatomic, weak) UIViewController *containerController;

@property (nonatomic) BOOL isMenuButtonVisible;
@property (nonatomic) BOOL isCancelButtonVisible;
@property (nonatomic) BOOL isConfirmButtonVisible;

- (void)onConfirmButton:(id)sender;
- (void)onCancelButton:(id)sender;
- (void)onMenuButton:(id)sender;

@end
