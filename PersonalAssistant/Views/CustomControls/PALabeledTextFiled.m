//
//  PALabeledTextFiled.m
//  PersonalAssistant
//
//  Created by Mariana on 8/30/15.
//  Copyright (c) 2015 Mariana. All rights reserved.
//

#import "PALabeledTextFiled.h"

@interface PALabeledTextFiled ()

@property (nonatomic, strong) UIView *separatorView;

@end

@implementation PALabeledTextFiled

@synthesize secureTextEntry = _secureTextEntry;
@synthesize labelText = _labelText;
@synthesize text = _text;
@synthesize enabled = _enabled;
@synthesize returnKeyType = _returnKeyType;
@synthesize labelTextAlignment = _labelTextAlignment;
@synthesize textFieldTextAlignment = _textFieldTextAlignment;

- (instancetype)init
{
    self = [super init];
    if (self) {

        [self setupView];
        [self setupConstraints];
    }
    return self;
}

- (void)setupView
{
    self.backgroundColor = [UIColor whiteColor];
    
    self.label = [[UILabel alloc] init];
    self.label.text = self.text;
    self.label.font = [PADesignManager fontWithSize:15.f];

    [self.label sizeToFit];
    
    self.separatorView = [[UIView alloc] init];
    self.separatorView.backgroundColor = [UIColor darkGrayColor];
    
    self.textField = [[PATextField alloc] init];
    self.textField.autocapitalizationType = UITextAutocapitalizationTypeNone;
    self.textField.autocorrectionType = UITextAutocorrectionTypeNo;
    
    [self addSubview:self.label];
    [self addSubview:self.separatorView];
    [self addSubview:self.textField];
}

- (void)setupConstraints
{
    [self.label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(10);
        make.centerY.equalTo(self);
        make.width.equalTo(@60);
    }];
    
    [self.separatorView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(self).multipliedBy(0.4);
        make.width.equalTo(@1);
        make.centerY.equalTo(self);
        make.left.equalTo(self.label.mas_right).offset(5);
    }];
    
    [self.textField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.centerY.height.equalTo(self);
        make.left.equalTo(self.separatorView.mas_right);
    }];
}

#pragma mark - Methods

- (void)setDelegate:(id<UITextFieldDelegate>)delegate
{
    self.textField.delegate = delegate;
}

- (BOOL)hasText
{
    return [self.textField hasText];
}

/* Properties */

- (void)setSecureTextEntry:(BOOL)secureTextEntry
{
    self.textField.secureTextEntry = secureTextEntry;
}

- (BOOL)secureTextEntry
{
    return self.textField.secureTextEntry;
}

- (void)setLabelText:(NSString *)labelText
{
    self.label.text = labelText;
}

- (NSString *)labelText
{
    return self.label.text;
}

- (void)setText:(NSString *)text
{
    self.textField.text = text;
}

- (NSString *)text
{
    return self.textField.text;
}

- (void)setEnabled:(BOOL)enabled
{
    self.textField.enabled = enabled;
}

- (BOOL)enabled
{
    return self.textField.enabled;
}

- (void)setReturnKeyType:(UIReturnKeyType)returnKeyType
{
    self.textField.returnKeyType = returnKeyType;
}

- (UIReturnKeyType)returnKeyType
{
    return self.textField.returnKeyType;
}

- (void)setLabelTextAlignment:(NSTextAlignment)labelTextAlignment
{
    self.label.textAlignment = labelTextAlignment;
}

- (NSTextAlignment)labelTextAlignment
{
    return self.label.textAlignment;
}

- (void)setTextFieldTextAlignment:(NSTextAlignment)textFieldTextAlignment
{
    self.textField.textAlignment = textFieldTextAlignment;
}

- (void)setIsSeparatorVisible:(BOOL)isSeparatorVisible
{
    self.separatorView.hidden = !isSeparatorVisible;
}

@end
