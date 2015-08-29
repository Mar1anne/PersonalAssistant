//
//  PANotesViewController.m
//  PersonalAssistant
//
//  Created by Mariana on 8/29/15.
//  Copyright (c) 2015 Mariana. All rights reserved.
//

/**
 * Keywords :
 * Jinx, save note
 * Jinx, delete note
 */

#import "PANotesViewController.h"

@interface PANotesViewController ()

@property (nonatomic, strong) UILabel *createNoteLabel;
@property (nonatomic, strong) UITextView *noteTextView;

@property (nonatomic, strong) UITapGestureRecognizer *tapRecognizer;

@end

@implementation PANotesViewController

#pragma mark - View setup

- (void)setupView
{
    [super setupView];
    
    self.createNoteLabel = [[UILabel alloc] init];
    self.createNoteLabel.text = @"Write or dictate your note:";
    
    self.noteTextView = [[UITextView alloc] init];
    self.noteTextView.layer.cornerRadius = 10.f;
    self.noteTextView.clipsToBounds = YES;
    
    [self.contentView addSubview:self.createNoteLabel];
    [self.contentView addSubview:self.noteTextView];
    
    self.tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                 action:@selector(onContentViewTap:)];
    [self.contentView addGestureRecognizer:self.tapRecognizer];
}

- (void)setupConstraints
{
    [super setupConstraints];
    
    CGFloat padding = 10.f;
    
    [self.createNoteLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView).offset(padding * 4);
        make.left.equalTo(self.contentView).offset(padding);
        make.right.equalTo(self.contentView).offset(-padding);
    }];
    
    [self.noteTextView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.createNoteLabel);
        make.top.equalTo(self.createNoteLabel.mas_bottom).offset(padding * 2);
        make.height.equalTo(@150);
    }];
}

#pragma mark - UITapGestureRecognizer methods

- (void)onContentViewTap:(UITapGestureRecognizer *)tapRecognizer
{
    [self.view endEditing:YES];
}

@end
