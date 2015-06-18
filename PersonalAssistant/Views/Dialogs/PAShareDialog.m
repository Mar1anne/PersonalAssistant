//
//  PAShareDialog.m
//  PersonalAssistant
//
//  Created by Mariana on 5/24/15.
//  Copyright (c) 2015 Mariana. All rights reserved.
//

#import "PAShareDialog.h"

@interface PAShareDialog ()

@property (nonatomic, strong) NSString *title;

@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *contentLabel;

@property (nonatomic, strong) UITextView *textView;
@property (nonatomic, strong) UIButton *shareButton;
@property (nonatomic, strong) UIView *containerView;

@end

@implementation PAShareDialog

- (instancetype)initWithTitle:(NSString *)title
{
    self = [super init];
    if (self) {
        
        _title = title;
        [self setupView];
        [self setupConstraints];
    }
    return self;
}

#pragma mark - View setup

- (void)setupView
{
    self.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.7f];
    
    self.titleLabel = [[UILabel alloc] init];
    self.titleLabel.text = self.title;
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    
    self.contentLabel = [[UILabel alloc] init];
    self.contentLabel.text = @"Write a post";
    self.contentLabel.numberOfLines = 0;
    self.contentLabel.lineBreakMode = NSLineBreakByWordWrapping;
    self.contentLabel.textAlignment = NSTextAlignmentCenter;
    
    self.textView = [[UITextView alloc] init];
    self.textView.layer.cornerRadius = 10.f;
    self.textView.layer.borderColor = [UIColor grayColor].CGColor;
    self.textView.layer.borderWidth = 1.f;
    
    self.shareButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.shareButton setTitle:@"Post" forState:UIControlStateNormal];
    [self.shareButton setBackgroundColor:[UIColor paPurpleColor]];
    [self.shareButton addTarget:self action:@selector(onPost:) forControlEvents:UIControlEventTouchUpInside];
    
    self.containerView = [[UIView alloc] init];
    self.containerView.backgroundColor = [UIColor whiteColor];
    self.containerView.layer.cornerRadius = 3.f;
    
    [self.containerView addSubview:self.titleLabel];
    [self.containerView addSubview:self.contentLabel];
    [self.containerView addSubview:self.textView];
    [self.containerView addSubview:self.shareButton];
    
    [self addSubview:self.containerView];
}

- (void)setupConstraints
{
    CGFloat padding = 10.f;
    
    [self.containerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(2 * padding);
        make.right.equalTo(self).offset(-2 * padding);
        make.bottom.equalTo(self.shareButton).offset(padding);
        make.center.equalTo(self);
    }];
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.equalTo(self.containerView).offset(padding);
        make.right.equalTo(self.containerView).offset(-padding);
    }];
    
    [self.contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.titleLabel);
        make.top.equalTo(self.titleLabel.mas_bottom).offset(padding);
    }];
    
    [self.textView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.titleLabel);
        make.top.equalTo(self.contentLabel.mas_bottom).offset(2 * padding);
        make.height.equalTo(@60);
    }];
    
    [self.shareButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.titleLabel);
        make.height.equalTo(@30);
        make.top.equalTo(self.textView.mas_bottom).offset(2 * padding);
    }];
}

#pragma mark - Button actions

- (void)onPost:(UIButton *)button
{
    
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

@end
