//
//  GCDetailViewController.m
//  GeoCarts
//
//  Created by Justin Miller on 1/15/13.
//  Copyright (c) 2012 MapBox / Development Seed. All rights reserved.
//

#import "GCDetailViewController.h"

@implementation GCDetailViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.title = self.detailTitle;
    
    UIWebView *webView = [[UIWebView alloc] initWithFrame:self.view.bounds];
    
    webView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;

    webView.delegate = self;
    
    [self.view addSubview:webView];
    
    NSMutableString *contentString = [NSMutableString string];
    
    [contentString appendString:@"<style type='text/css'>"];
    [contentString appendString:@"body { font-family: Helvetica, Arial, Verdana, sans-serif; }"];
    [contentString appendString:@"</style>"];
    
    [contentString appendString:[NSString stringWithFormat:@"<div>%@</div>", self.detailDescription]];

    [webView loadHTMLString:contentString baseURL:nil];
}

#pragma mark -

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    if (navigationType == UIWebViewNavigationTypeLinkClicked)
        [[UIApplication sharedApplication] openURL:request.URL];
        
    return [[request.URL scheme] isEqualToString:@"about"];
}

@end