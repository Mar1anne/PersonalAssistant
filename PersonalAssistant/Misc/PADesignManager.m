//
//  PADesignManager.m
//  PersonalAssistant
//
//  Created by Mariana on 8/30/15.
//  Copyright (c) 2015 Mariana. All rights reserved.
//

#import "PADesignManager.h"

@implementation PADesignManager

+ (UIFont *)fontWithSize:(CGFloat)size
{
    if (UIAccessibilityIsBoldTextEnabled()) {
        return [UIFont boldSystemFontOfSize:size];
    }
    return [UIFont systemFontOfSize:size];
}

+ (UIColor *)grayColorWithTransparency:(CGFloat)transparency
{
    if (UIAccessibilityIsReduceTransparencyEnabled()) {
        return [UIColor darkGrayColor];
    }
    return [[UIColor darkGrayColor] colorWithAlphaComponent:transparency];
}

+ (UIColor *)blackColorWithTransparency:(CGFloat)transparency
{
    if (UIAccessibilityIsReduceTransparencyEnabled()) {
        return [UIColor blackColor];
    }
    return [[UIColor blackColor] colorWithAlphaComponent:transparency];
}

+ (UIColor *)lightFontColor
{
    return [UIColor whiteColor];
}

+ (UIColor *)darkFontColor
{
    if (UIAccessibilityDarkerSystemColorsEnabled()) {
        return [UIColor blackColor];
    }
    return [UIColor darkGrayColor];
}

@end
