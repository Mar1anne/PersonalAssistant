//
//  PAMenuCollectionViewCell.h
//  PersonalAssistant
//
//  Created by Mariana on 5/9/15.
//  Copyright (c) 2015 Mariana. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PAMenuCollectionViewCell : UICollectionViewCell

+ (NSString *)reuseIdentifier;

- (void)setTitle:(NSString *)title;

- (void)setImage:(UIImage *)image;

@end
