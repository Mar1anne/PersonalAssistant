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

+ (UIColor *)grayControlOverlayColor
{
    if (UIAccessibilityIsReduceTransparencyEnabled()) {
        return [UIColor blackColor];
    }
    return [[UIColor blackColor] colorWithAlphaComponent:0.2f];
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
