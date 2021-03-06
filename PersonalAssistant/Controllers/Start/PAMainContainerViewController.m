//
//  PAMainContainerViewController.m
//  PersonalAssistant
//
//  Created by Mariana on 8/8/15.
//  Copyright (c) 2015 Mariana. All rights reserved.
//

#import "PAMainContainerViewController.h"
#import "PAMicrophoneButton.h"
#import "PAControllerViewFactory.h"

@interface PAMainContainerViewController ()

@property (nonatomic, strong) PAMicrophoneButton *microphoneButton;

@property (nonatomic, strong) UIView *currentView;
@property (nonatomic, strong) UIView *previousView;
@property (nonatomic, strong) UIView *nextView;

@end

@implementation PAMainContainerViewController

#pragma mark - View setup

- (void)setupView
{
    [super setupView];
    
    self.microphoneButton = [[PAMicrophoneButton alloc] init];
    [self.microphoneButton addTarget:self
                              action:@selector(onMicrophone:)
                    forControlEvents:UIControlEventTouchUpInside];

    [self.view addSubview:self.microphoneButton];
    
    [self showView:[PAControllerViewFactory startView] animated:NO];
}

- (void)setupConstraints
{
    [super setupConstraints];
    
    [self.microphoneButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.height.equalTo(@90);
        make.centerX.equalTo(self.view);
        make.bottom.equalTo(self.view).offset(-30);
    }];
}

#pragma mark - Button actions

- (void)onMicrophone:(id)sender
{
    PAMicrophoneButton *button = (PAMicrophoneButton *)sender;
    button.active = !button.active;
    [self showView:[PAControllerViewFactory weatherView] animated:YES];
}

#pragma mark - Methods

- (void)showView:(UIView *)view animated:(BOOL)animated
{
    self.nextView = view;
    
    [self.view insertSubview:view belowSubview:self.microphoneButton];
    
    CGRect nextFromFrame = CGRectMake(self.view.bounds.size.width, 0, self.view.bounds.size.width, self.view.bounds.size.height);
    CGRect nextToFrame = CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height);
    
    CGRect currentToFrame = CGRectMake(-self.view.bounds.size.width, 0, self.view.bounds.size.width, self.view.bounds.size.height);
    
    view.frame = nextFromFrame;
    
    CGFloat animationDuration = animated ? 0.5f : 0.f;
    
    [UIView animateWithDuration:animationDuration
                     animations:^
     {
         view.frame = nextToFrame;
         self.currentView.frame = currentToFrame;
         
     } completion:^(BOOL finished)
     {
         [self.previousView removeFromSuperview];
         
         self.currentView = view;
         self.previousView = view;
         self.nextView = nil;
     }];
}

@end
