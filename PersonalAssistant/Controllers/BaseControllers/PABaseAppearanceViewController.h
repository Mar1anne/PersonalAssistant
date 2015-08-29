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

@property (nonatomic) BOOL isMenuButtonVisible;
@property (nonatomic) BOOL isCancelButtonVisible;
@property (nonatomic) BOOL isConfirmButtonVisible;

- (void)onConfirmButton:(id)sender;
- (void)onCancelButton:(id)sender;
- (void)onMenuButton:(id)sender;

@end
