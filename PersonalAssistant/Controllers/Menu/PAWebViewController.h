//
//  PAWebViewController.h
//  PersonalAssistant
//
//  Created by Mariana on 8/3/15.
//  Copyright (c) 2015 Mariana. All rights reserved.
//

#import "PABaseViewController.h"

@interface PAWebViewController : PABaseViewController <UIWebViewDelegate>

@property (nonatomic, strong) UIWebView *webView;
@property (nonatomic, strong) UIActivityIndicatorView *loadingIndicator;
@property (nonatomic, strong) NSString *keyword;

- (id)initWithKeyword:(NSString *)keyword;

@end
