//
//  PACallContactViewController.m
//  PersonalAssistant
//
//  Created by Mariana on 8/29/15.
//  Copyright (c) 2015 Mariana. All rights reserved.
//

#import "PACallContactViewController.h"

@interface PACallContactViewController ()

@property (nonatomic, strong) APContact *contact;

@property (nonatomic, strong) UIImageView *profileImage;
@property (nonatomic, strong) UILabel *contactNameLabel;
@property (nonatomic, strong) UILabel *contactPhoneLabel;
@property (nonatomic, strong) UILabel *questionLabel;

@end

@implementation PACallContactViewController

- (instancetype)initWithContact:(APContact *)contact
{
    self = [super init];
    if (self) {
        
        _contact = contact;
    }
    return self;
}

#pragma mark - View setup

- (void)setupView
{
    [super setupView];
    
    self.contactNameLabel = [[UILabel alloc] init];
    self.contactNameLabel.numberOfLines = 0;
    self.contactNameLabel.lineBreakMode = NSLineBreakByWordWrapping;
    self.contactNameLabel.font = [PADesignManager fontWithSize:17.f];
    
    self.contactPhoneLabel = [[UILabel alloc] init];
    self.contactPhoneLabel.numberOfLines = 0;
    self.contactPhoneLabel.lineBreakMode = NSLineBreakByWordWrapping;
    self.contactPhoneLabel.font = [PADesignManager fontWithSize:17.f];

    self.questionLabel = [[UILabel alloc] init];
    self.questionLabel.numberOfLines = 0;
    self.questionLabel.lineBreakMode = NSLineBreakByWordWrapping;
    self.questionLabel.font = [PADesignManager fontWithSize:17.f];

    self.profileImage = [[UIImageView alloc] init];
    self.profileImage.isAccessibilityElement = YES;
    self.profileImage.accessibilityLabel = @"Contact photo";
    
    [self updateWithContact:self.contact];

    [self.contentView addSubview:self.profileImage];
    [self.contentView addSubview:self.contactNameLabel];
    [self.contentView addSubview:self.contactPhoneLabel];
    [self.contentView addSubview:self.questionLabel];
}

- (void)setupConstraints
{
    [super setupConstraints];
    
    CGFloat padding = 10.f;
    CGFloat profileWidth = [UIScreen mainScreen].bounds.size.width * 0.35;
    
    [self.profileImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).offset(padding);
        make.top.equalTo(self.contentView).offset(4 * padding);
        make.width.height.equalTo(@(profileWidth));
    }];
    
    [self.contactNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.profileImage.mas_right).offset(padding);
        make.right.equalTo(self.contentView).offset(-padding);
        make.top.equalTo(self.profileImage);
    }];
    
    [self.contactPhoneLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.contactNameLabel);
        make.top.equalTo(self.contactNameLabel.mas_bottom).offset(padding);
    }];
    
    [self.questionLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).offset(padding);
        make.right.equalTo(self.contentView).offset(-padding);
        make.top.equalTo(self.profileImage.mas_bottom).offset(2 * padding);
    }];
    
    self.profileImage.layer.cornerRadius = profileWidth / 2.f;
    self.profileImage.clipsToBounds = YES;
}

- (void)updateWithContact:(APContact *)contact
{
    self.contact = contact;
    
    self.contactNameLabel.text = [NSString stringWithFormat:@"%@ %@", self.contact.firstName, self.contact.lastName];
    self.contactNameLabel.accessibilityLabel = self.contactNameLabel.text;
    
    self.questionLabel.text = [NSString stringWithFormat:@"Do you want to call %@ %@ ?", self.contact.firstName, self.contact.lastName];
    self.questionLabel.accessibilityLabel = self.questionLabel.text;
    
    self.contactPhoneLabel.text = contact.phones[0];
    self.contactPhoneLabel.accessibilityLabel = self.contactPhoneLabel.text;
    
    if (self.contact.photo) {
        self.profileImage.image = self.contact.photo;
    } else {
        self.profileImage.image = [UIImage imageNamed:@"placeholder"];
    }
}

#pragma mark - Button Actions

- (void)onCancelButton:(id)sender
{
    NSLog(@"onCancelButton");
}

- (void)onConfirmButton:(id)sender
{
    NSURL *phoneUrl = [NSURL URLWithString:[NSString  stringWithFormat:@"tel://%@",self.contact.phones[0]]];
    
    if ([[UIApplication sharedApplication] canOpenURL:phoneUrl]) {
        [[UIApplication sharedApplication] openURL:phoneUrl];
    } else {
        [[[UIAlertView alloc] initWithTitle:@"Alert"
                                    message:@"Call facility is not available!!!"
                                   delegate:nil
                          cancelButtonTitle:@"OK"
                          otherButtonTitles:nil, nil] show];
    }
}

@end
