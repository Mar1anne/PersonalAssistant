//
//  PAShareDialog.h
//  PersonalAssistant
//
//  Created by Mariana on 5/24/15.
//  Copyright (c) 2015 Mariana. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol PAShareDialogDelegate;

@interface PAShareDialog : UIView

@property (nonatomic, weak) id <PAShareDialogDelegate> delegate;

- (instancetype)initWithTitle:(NSString *)title;

- (void)show;

@end

@protocol PAShareDialogDelegate <NSObject>



@end