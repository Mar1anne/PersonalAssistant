//
//  PADesignManager.h
//  PersonalAssistant
//
//  Created by Mariana on 8/30/15.
//  Copyright (c) 2015 Mariana. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PADesignManager : NSObject

+ (UIFont *)fontWithSize:(CGFloat)size;

+ (UIColor *)grayColorWithTransparency:(CGFloat)transparency;

+ (UIColor *)blackColorWithTransparency:(CGFloat)transparency;

+ (UIColor *)lightFontColor;

+ (UIColor *)darkFontColor;

@end
