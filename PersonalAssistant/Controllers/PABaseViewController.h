//
//  PABaseViewController.h
//  PersonalAssistant
//
//  Created by Mariana on 5/3/15.
//  Copyright (c) 2015 Mariana. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PABaseViewController : UIViewController


- (void)setupView;

- (void)setupConstraints;

- (void)addCustomTitle:(NSString *)customTitle;

- (void)addRightNavigationBarButtonWithImage:(UIImage *)image;

- (void)addLeftNavigationBarButtonWithImage:(UIImage *)image;

- (void)onRightNavigationBarButton:(UIBarButtonItem *)button;

- (void)onLeftNavigationBarButton:(UIBarButtonItem *)button;

@end
