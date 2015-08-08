//
//  PAMicrophoneButton.m
//  PersonalAssistant
//
//  Created by Mariana on 8/8/15.
//  Copyright (c) 2015 Mariana. All rights reserved.
//

#import "PAMicrophoneButton.h"

@interface PAMicrophoneButton ()

@property (nonatomic, strong) UIView *microphoneImageView;

@end

@implementation PAMicrophoneButton

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
    self.opaque = NO;
    
    self.microphoneImageView = [[UIView alloc] init];
    self.microphoneImageView.backgroundColor = [UIColor blackColor];
    self.microphoneImageView.clipsToBounds = YES;
    self.microphoneImageView.userInteractionEnabled = NO;
    
    [self addSubview:self.microphoneImageView];
}

- (void)setupConstraints
{
    [self.microphoneImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];
}

- (void)drawRect:(CGRect)rect
{
    [super drawRect:rect];
    
    CGFloat smallerSize = MIN(rect.size.height, rect.size.width);
    self.microphoneImageView.layer.cornerRadius = smallerSize / 2.f;
    
    self.backgroundColor = [UIColor whiteColor];
}

@end
