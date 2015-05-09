//
//  PACallContactViewController.m
//  PersonalAssistant
//
//  Created by Mariana on 5/4/15.
//  Copyright (c) 2015 Mariana. All rights reserved.
//

#import "PACallContactViewController.h"

@interface PACallContactViewController ()

@property (nonatomic, strong) UIButton *callButton;
@property (nonatomic, strong) UIButton *sendMessageButton;

@end

@implementation PACallContactViewController

#pragma mark - View setup

- (void)setupView
{
    [super setupView];
    
    [self addCustomTitle:@"Dial"];
}

@end
