//
//  PATextField.m
//  PersonalAssistant
//
//  Created by Mariana on 8/30/15.
//  Copyright (c) 2015 Mariana. All rights reserved.
//

#import "PATextField.h"

@implementation PATextField

- (id)init
{
    self = [super init];
    if (self) {
        self.horizontalPadding = 5.f;
        self.verticalPadding = 5.5f;
    }
    return self;
}

- (CGRect)textRectForBounds:(CGRect)bounds {
    return CGRectInset( bounds , self.horizontalPadding , self.verticalPadding);
}

// text position
- (CGRect)editingRectForBounds:(CGRect)bounds {
    return CGRectInset( bounds , self.horizontalPadding , self.verticalPadding);
}

@end
