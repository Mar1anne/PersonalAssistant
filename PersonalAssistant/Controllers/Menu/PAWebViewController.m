//
//  PAWebViewController.m
//  PersonalAssistant
//
//  Created by Mariana on 8/3/15.
//  Copyright (c) 2015 Mariana. All rights reserved.
//

#import "PAWebViewController.h"

@interface PAWebViewController ()


@end

@implementation PAWebViewController

- (id)initWithKeyword:(NSString *)keyword
{
    self = [super init];
    if (self) {
        
        _keyword = keyword;
    }
    return self;
}

- (void)dealloc
{
    self.webView.delegate = nil;
}

#pragma mark - View Lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self searchForKeyword:self.keyword];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self searchForKeyword:self.keyword];
}

#pragma mark - View setup

- (void)setupView
{
    [super setupView];
    
    [self addCustomTitle:_keyword];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.webView = [[UIWebView alloc] init];
    self.webView.delegate = self;
    self.webView.scalesPageToFit = YES;
    self.webView.isAccessibilityElement = NO;
    
    self.isCancelButtonVisible = NO;
    self.isConfirmButtonVisible = NO;
    
    self.loadingIndicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    self.loadingIndicator.isAccessibilityElement = NO;
    
    [self.contentView addSubview:self.webView];
    [self.webView addSubview:self.loadingIndicator];
        
    self.navigationItem.rightBarButtonItem = nil;
}

- (void)setupConstraints
{
    [self.webView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(self.contentView);
        make.top.equalTo(self.contentView).offset(10);
    }];
    
    [self.loadingIndicator mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.webView);
    }];
    
    [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.equalTo(self.view);
        make.height.equalTo(self.view).multipliedBy(0.78);
    }];
    
    [self.controlContainerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(self.view);
        make.top.equalTo(self.contentView.mas_bottom);
    }];
    
    [self.controlView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.equalTo(self.controlContainerView);
        make.height.equalTo(@50);
    }];
    
    self.controlView.backgroundColor = [UIColor clearColor];
}

#pragma mark - Button actions

- (void)onRightNavigationBarButton:(UIBarButtonItem *)button
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - Methods

- (void)searchForKeyword:(NSString *)keyword
{
    NSMutableString *searchString = [NSMutableString stringWithFormat:@"http://www.google.com/search?q="];
    
    if (keyword) {
        [searchString appendString:keyword];
    }

    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:[searchString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]]];
    
    [self.webView loadRequest:request];
}

#pragma mark - UIWebViewDelegate methods

- (void)webViewDidStartLoad:(UIWebView *)webView
{
    [self.loadingIndicator startAnimating];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    [self.loadingIndicator stopAnimating];
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    [self.loadingIndicator stopAnimating];
    
    [[[UIAlertView alloc] initWithTitle:@"Error"
                                message:error.localizedDescription
                               delegate:nil
                      cancelButtonTitle:@"OK"
                      otherButtonTitles:nil, nil] show];
}

@end
