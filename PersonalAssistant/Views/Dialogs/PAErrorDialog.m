//
//  PAErrorDialog.m
//  PersonalAssistant
//
//  Created by Mariana on 5/24/15.
//  Copyright (c) 2015 Mariana. All rights reserved.
//

#import "PAErrorDialog.h"

@interface PAErrorDialog ()

@property (nonatomic, strong) UILabel *contentLabel;
@property (nonatomic, strong) UIButton *okButton;
@property (nonatomic, strong) UIView *containerView;

@end

@implementation PAErrorDialog

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        [self setupView];
        [self setupConstraints];
    }
    return self;
}

#pragma mark - View setup

- (void)setupView
{
    self.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.7f];
    
    self.contentLabel = [[UILabel alloc] init];
    self.contentLabel.text = @"";
    self.contentLabel.textAlignment = NSTextAlignmentCenter;
    self.contentLabel.numberOfLines = 0;
    self.contentLabel.lineBreakMode = NSLineBreakByWordWrapping;
    
    self.okButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.okButton setTitle:@"OK" forState:UIControlStateNormal];
    [self.okButton setBackgroundColor:[UIColor paPurpleColor]];
    [self.okButton addTarget:self action:@selector(hide) forControlEvents:UIControlEventTouchUpInside];
    
    self.containerView = [[UIView alloc] init];
    self.containerView.backgroundColor = [UIColor whiteColor];
    self.containerView.layer.cornerRadius = 3.f;
    
    [self.containerView addSubview:self.contentLabel];
    [self.containerView addSubview:self.okButton];
    
    [self addSubview:self.containerView];
}

- (void)setupConstraints
{
    CGFloat padding = 10.f;
    
    [self.containerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(2 * padding);
        make.right.equalTo(self).offset(-2 * padding);
        make.bottom.equalTo(self.okButton).offset(padding);
        make.center.equalTo(self);
    }];
    
    [self.contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.equalTo(self.containerView).offset(padding);
        make.right.equalTo(self.containerView).offset(-padding);
    }];
    
    [self.okButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.contentLabel);
        make.height.equalTo(@30);
        make.top.equalTo(self.contentLabel.mas_bottom).offset(3 * padding);
    }];
}

#pragma mark - Methods

- (void)show
{
    [[UIApplication sharedApplication].delegate.window endEditing:YES];
    
    [[PAControllerManager mainWindow] addSubview:self];
    
    [self mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo([PAControllerManager mainWindow]);
    }];
}

- (void)hide
{
    [self removeFromSuperview];
}

#pragma mark - Public methods

+ (void)showWithMessage:(NSString *)message
{
    PAErrorDialog *dialog = [[PAErrorDialog alloc] init];
    
    dialog.contentLabel.text = message;
    
    [dialog show];
}

@end
