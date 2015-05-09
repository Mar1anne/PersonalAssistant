//
//  PATabBarButton.m
//  PersonalAssistant
//
//  Created by Mariana on 5/3/15.
//  Copyright (c) 2015 Mariana. All rights reserved.
//

#import "PATabBarButton.h"

@implementation PATabBarButton

- (instancetype)initWithNormalImage:(UIImage *)normalImage
                   andSelectedImage:(UIImage *)selectedImage
                   highlightedImage:(UIImage *)highlightedImage
{
    
    self = [super init];
    
    if (self) {
        
        _normalImage = normalImage;
        _selectedImage = selectedImage;
        _highlightedImage = highlightedImage;
        
        [self.imageView setImage:self.normalImage];
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self setViews];
        [self setConstraints];
    }
    return self;
}

- (void)setViews
{
    self.imageView = [[UIImageView alloc] init];
    self.imageView.contentMode = UIViewContentModeScaleAspectFill;
    self.imageView.userInteractionEnabled = NO;
    
    [self addSubview:self.imageView];
}

- (void)setConstraints
{
    [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self);
    }];
}

- (void)setSelected:(BOOL)selected
{
    [super setSelected:selected];
    
    if (selected) {
        [self.imageView setImage:self.selectedImage];
    } else {
        [self.imageView setImage:self.normalImage];
    }
}

- (void)setHighlighted:(BOOL)highlighted
{
    [super setHighlighted:highlighted];
    
    if (self.selected) {
        return;
    }
    
    if (highlighted) {
        [self.imageView setImage:self.highlightedImage];
    } else {
        if (self.selected) {
            [self.imageView setImage:self.selectedImage];
        } else {
            [self.imageView setImage:self.normalImage];
        }
    }
}

@end
