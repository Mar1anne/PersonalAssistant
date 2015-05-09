//
//  PATabBarButton.h
//  PersonalAssistant
//
//  Created by Mariana on 5/3/15.
//  Copyright (c) 2015 Mariana. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PATabBarButton : UIControl

@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UIImage *normalImage;
@property (nonatomic, strong) UIImage *selectedImage;
@property (nonatomic, strong) UIImage *highlightedImage;

- (instancetype)initWithNormalImage:(UIImage *)normalImage
                   andSelectedImage:(UIImage*)selectedImage
                   highlightedImage:(UIImage *)highlightedImage;

@end
