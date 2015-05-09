//
//  PATabBar.m
//  PersonalAssistant
//
//  Created by Mariana on 5/3/15.
//  Copyright (c) 2015 Mariana. All rights reserved.
//

#import "PATabBar.h"
#import "PATabBaritem.h"
#import "PATabBarButton.h"

@interface PATabBar ()

@property (nonatomic, strong) NSArray *tabBarItems;

@end

@implementation PATabBar

- (instancetype)init
{
    self = [super init];
    if (self) {

        self.userInteractionEnabled = YES;
        
    }
    return self;
}

#pragma mark - Public methods

- (NSArray *)arrangeButtonsForItems:(NSArray *)items
{
    NSMutableArray* resultArray = [NSMutableArray new];
    // Remove old views
    for (UIView *view in self.subviews) {
        [view removeFromSuperview];
    }
    
    UIView *previousView = nil;
    NSUInteger numberOfButtons = items.count;
    
    CGFloat screenWidth = [UIScreen mainScreen].bounds.size.width;
    CGFloat buttonWidth = screenWidth / numberOfButtons;
    
    for (int i = 0; i < numberOfButtons; i++) {
        
        PATabBaritem *item = items[i];
        
        PATabBarButton *button = [[PATabBarButton alloc] init];
        button.tag = i;
        [self addSubview:button];
        
        button.backgroundColor = item.defaultBackgroundColor;
        button.normalImage = item.defaultImage;
        button.selectedImage = item.selectedImage;
        button.highlightedImage = item.highlightedImage;
        button.exclusiveTouch = YES;
        button.tag = i;
        
        [button mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self);
            make.height.equalTo(@50);
            make.width.equalTo(@(buttonWidth));
            make.left.equalTo(previousView ? previousView.mas_right : self.mas_left);
        }];
        
        previousView = button;
        [resultArray addObject:button];
    }
    
    self.tabBarButtons = resultArray;
    self.tabBarItems = items;
    
    return resultArray;
}

- (CGFloat)buttonOffsetForIndex:(int)index screenWidth:(int)screenWidth
{
    CGFloat offset = 0.f;
    
    if ([UIScreen mainScreen].bounds.size.width <= 320.f) {
        
        if (index == 0) {
            offset = 18.f;
        } else if (index == 1) {
            offset = 8.f;
        } else if (index == 3) {
            offset = 26.f;
        } else {
            offset = 16.f;
        }
    } else if ([UIScreen mainScreen].bounds.size.width <= 375.f) {
        if (index == 0) {
            offset = 21.f;
        } else if (index == 1) {
            offset = 12.f;
        } else if (index == 3) {
            offset = 29.f;
        } else {
            offset = 24.f;
        }
    } else {
        if (index == 0) {
            offset = 25.f;
        } else if (index == 1) {
            offset = 16.f;
        } else if (index == 3) {
            offset = 35.f;
        } else {
            offset = 25.f;
        }
    }
    return offset;
}

- (void)selectButtonAtIndex:(NSInteger)index
{
    for (int i = 0; i < self.tabBarButtons.count; i++) {
        UIButton *button = self.tabBarButtons[i];
        PATabBaritem *item = self.tabBarItems[i];
        button.selected = NO;
        button.backgroundColor = item.defaultBackgroundColor;
    }
    
    PATabBaritem *selectedItem = self.tabBarItems[index];
    UIButton *selectedButton = self.tabBarButtons[index];
    selectedButton.selected = YES;
    selectedButton.backgroundColor = selectedItem.selectedBackgroundColor;
}


@end
