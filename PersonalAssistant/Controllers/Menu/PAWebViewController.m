//
//  PAWebViewController.m
//  PersonalAssistant
//
//  Created by Mariana on 8/3/15.
//  Copyright (c) 2015 Mariana. All rights reserved.
//

#import "PAWebViewController.h"

@interface PAWebViewController ()

@property (nonatomic, strong) NSString *keyword;

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

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    // for testing only
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self searchForKeyword:@"skopje"];
    });
}

#pragma mark - View setup

- (void)setupView
{
    [super setupView];
    
    self.title = _keyword;
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.webView = [[UIWebView alloc] init];
    self.webView.delegate = self;
    self.webView.scalesPageToFit = YES;
    
    self.loadingIndicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    
    [self.view addSubview:self.webView];
    [self.webView addSubview:self.loadingIndicator];
        
    self.navigationItem.rightBarButtonItem = nil;
}

- (void)setupConstraints
{
    [super setupConstraints];
    
    [self.webView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    
    [self.loadingIndicator mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.webView);
    }];
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
    [searchString appendString:keyword];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:[searchString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]]];
    
    [self.webView loadRequest:request];
    
    NSLog(@"%@", request);
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
