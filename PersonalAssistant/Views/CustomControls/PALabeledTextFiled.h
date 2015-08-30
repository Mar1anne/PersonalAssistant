//
//  PALabeledTextFiled.h
//  PersonalAssistant
//
//  Created by Mariana on 8/30/15.
//  Copyright (c) 2015 Mariana. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PATextField.h"

@interface PALabeledTextFiled : UIView

@property (nonatomic, strong) NSString *text;
@property (nonatomic, strong) NSString *labelText;
@property (nonatomic, strong) NSString *labelNuiClass;
@property (nonatomic, strong) PATextField *textField;

@property (nonatomic, strong) UILabel *label;

@property (nonatomic, weak) id <UITextFieldDelegate> delegate;

@property (nonatomic) BOOL secureTextEntry;
@property (nonatomic) BOOL enabled; // default : YES
@property (nonatomic) BOOL isSeparatorVisible;  // default : YES

@property (nonatomic) NSTextAlignment labelTextAlignment;  // default : NSTextAlignmentLeft
@property (nonatomic) NSTextAlignment textFieldTextAlignment;  // default : NSTextAlignmentLeft
@property (nonatomic) UIReturnKeyType returnKeyType;

@end
