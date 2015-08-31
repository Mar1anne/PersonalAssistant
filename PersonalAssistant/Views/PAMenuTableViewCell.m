//
//  PAMenuTableViewCell.m
//  PersonalAssistant
//
//  Created by Mariana on 8/30/15.
//  Copyright (c) 2015 Mariana. All rights reserved.
//

#import "PAMenuTableViewCell.h"

@interface PAMenuTableViewCell ()

@property (nonatomic, strong) UIView *containerView;

@end

@implementation PAMenuTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        [self setupView];
        [self setupConstraints];
    }
    return self;
}

#pragma mark - View setup

- (void)setupView
{    
    self.containerView = [[UIView alloc] init];
    self.containerView.layer.cornerRadius = 5.f;
    self.containerView.clipsToBounds = YES;
    self.containerView.backgroundColor = [[UIColor darkGrayColor] colorWithAlphaComponent:0.9f];
    
    self.cellImageView = [[UIImageView alloc] init];
    self.cellLabel = [[UILabel alloc] init];
    self.cellLabel.font = [PADesignManager fontWithSize:17.f];
    self.cellLabel.textColor = [PADesignManager lightFontColor];
    
    [self.containerView addSubview:self.cellImageView];
    [self.containerView addSubview:self.cellLabel];
    
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    self.contentView.backgroundColor = [UIColor clearColor];
    self.backgroundColor = [UIColor clearColor];
    [self.contentView addSubview:self.containerView];
}

- (void)setupConstraints
{
    CGFloat padding = 10.f;
    
    [self.containerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.equalTo(self.contentView).offset(padding);
        make.right.equalTo(self.contentView).offset(-padding);
        make.bottom.equalTo(self.contentView);
    }];
    
    [self.cellImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.height.equalTo(self.containerView.mas_height).multipliedBy(0.8);
        make.left.equalTo(self.containerView).offset(padding);
        make.centerY.equalTo(self.containerView);
    }];
    
    [self.cellLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.cellImageView.mas_right).offset(padding);
        make.right.equalTo(self.containerView).offset(-padding);
        make.centerY.equalTo(self.containerView);
    }];
}

@end
