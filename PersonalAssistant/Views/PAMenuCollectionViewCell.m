//
//  PAMenuCollectionViewCell.m
//  PersonalAssistant
//
//  Created by Mariana on 5/9/15.
//  Copyright (c) 2015 Mariana. All rights reserved.
//

#import "PAMenuCollectionViewCell.h"

@interface PAMenuCollectionViewCell ()

@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UIImageView *imageView;

@end

@implementation PAMenuCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self setupView];
        [self setupConstraints];
    }
    return self;
}

- (void)prepareForReuse
{
    self.titleLabel.text = @"";
    self.imageView.image = nil;
}

#pragma mark - View setup

- (void)setupView
{
    self.contentView.backgroundColor = [UIColor paPurpleColor];
    
    self.layer.cornerRadius = 10.f;
    self.layer.masksToBounds = YES; // TODO : use masks
    
    self.titleLabel = [[UILabel alloc] init];
    self.titleLabel.numberOfLines = 0;
    self.titleLabel.lineBreakMode = NSLineBreakByWordWrapping;
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    self.titleLabel.textColor = [UIColor whiteColor];
    
    self.imageView = [[UIImageView alloc] init];
    
    [self.contentView addSubview:self.titleLabel];
    [self.contentView addSubview:self.imageView];
}

- (void)setupConstraints
{
    [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(self.contentView).multipliedBy(0.6);
        make.height.equalTo(self.contentView).multipliedBy(0.6);
        make.centerX.equalTo(self.contentView);
        make.centerY.equalTo(self.contentView).multipliedBy(0.8);
    }];
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).offset(10);
        make.right.bottom.equalTo(self.contentView).offset(-10);
        make.top.equalTo(self.imageView.mas_bottom).offset(10);
    }];
}

#pragma mark - Methods

- (void)setTitle:(NSString *)title
{
    self.titleLabel.text = title;
}

- (void)setImage:(UIImage *)image
{
    self.imageView.image = image;
}

#pragma mark - Public methods

+ (NSString *)reuseIdentifier
{
    return NSStringFromClass([self class]);
}

@end
