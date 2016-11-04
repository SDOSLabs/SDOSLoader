//
//  DocumentationLoaderViewController.m
//  SDOSUtil
//
//  Created by Antonio Jesús Pallares on 03/11/16.
//  Copyright © 2016 SDOS. All rights reserved.
//

#import "DocumentationLoaderViewController.h"
#import <WebKit/WebKit.h>
#import "ConstantsWS.h"

#define SEE_EXAMPLE_TEXT NSLocalizedString(@"Example.btnTitle", @"")
#define VERSION_STR_FORMAT NSLocalizedString(@"Example.version", @"")
#define GO_BACK_BUTTON_TITLE @"<"
#define GO_FORWARD_BUTTON_TITLE @">"


@interface DocumentationLoaderViewController () <WKNavigationDelegate>

@property (weak, nonatomic) IBOutlet UIView *viewForWebView;
@property (strong, nonatomic) WKWebView *webView;
@property (weak, nonatomic) IBOutlet UILabel *lbVersion;
@property (weak, nonatomic) IBOutlet UIButton *btnExamples;
@property (strong, nonatomic) UIActivityIndicatorView *spinner;
@property (strong, nonatomic) UIBarButtonItem *barBtnSpinner;
@property (strong, nonatomic) UIBarButtonItem *barBtnReload;
@property (weak, nonatomic) IBOutlet UIButton *btnShowExample;
@property (weak, nonatomic) IBOutlet UIButton *btnGoBack;
@property (weak, nonatomic) IBOutlet UIButton *btnGoForward;

@end

@implementation DocumentationLoaderViewController

#pragma mark - Properties

-(UIActivityIndicatorView *)spinner {
    if (!_spinner) {
        _spinner = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
        _spinner.hidesWhenStopped = YES;
    }
    return _spinner;
}

-(UIBarButtonItem *)barBtnSpinner {
    if (!_barBtnSpinner) {
        _barBtnSpinner = [[UIBarButtonItem alloc] initWithCustomView:self.spinner];
    }
    return _barBtnSpinner;
}

-(UIBarButtonItem *)barBtnReload {
    if (!_barBtnReload) {
        _barBtnReload = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemRefresh target:self action:@selector(reloadPage:)];
    }
    return _barBtnReload;
}

#pragma mark - View Loading

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self loadWebView];
    [self loadContent];
    [self updateBackForwardButtons];
}

- (void) loadContent {
    self.title = (NSString *)[[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleDisplayName"];
    [self.btnExamples setTitle:SEE_EXAMPLE_TEXT forState:UIControlStateNormal];
    self.lbVersion.text = [NSString stringWithFormat:VERSION_STR_FORMAT, [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleShortVersionString"]];
    [self.btnGoBack setTitle:GO_BACK_BUTTON_TITLE forState:UIControlStateNormal];
    [self.btnGoForward setTitle:GO_FORWARD_BUTTON_TITLE forState:UIControlStateNormal];
}

- (void) loadActivityIndicatorForWebView {
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:self.spinner];
}

- (void) loadWebView {
    self.webView = [[WKWebView alloc] initWithFrame:self.viewForWebView.bounds];
    
    [self addSubviewWithAlignedBorders:self.webView to:self.viewForWebView];
    self.webView.navigationDelegate = self;

    [self loadInitialURL];
}

- (void) loadInitialURL {
    NSURL *url = [NSURL URLWithString:DOCUMENTATION_URL];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [self.webView loadRequest:request];
}

-(void)addSubviewWithAlignedBorders:(UIView *)subView to:(UIView *)parent {
    
    [parent addSubview:subView];
    
    subView.translatesAutoresizingMaskIntoConstraints = NO;
    
    //Top
    NSLayoutConstraint *top = [NSLayoutConstraint
                               constraintWithItem:subView
                               attribute:NSLayoutAttributeTop
                               relatedBy:NSLayoutRelationEqual
                               toItem:parent
                               attribute:NSLayoutAttributeTop
                               multiplier:1.0f
                               constant:0.f];
    //Trailing
    NSLayoutConstraint *trailing =[NSLayoutConstraint
                                   constraintWithItem:subView
                                   attribute:NSLayoutAttributeTrailing
                                   relatedBy:NSLayoutRelationEqual
                                   toItem:parent
                                   attribute:NSLayoutAttributeTrailing
                                   multiplier:1.0f
                                   constant:0.f];
    
    //Leading
    
    NSLayoutConstraint *leading = [NSLayoutConstraint
                                   constraintWithItem:subView
                                   attribute:NSLayoutAttributeLeading
                                   relatedBy:NSLayoutRelationEqual
                                   toItem:parent
                                   attribute:NSLayoutAttributeLeading
                                   multiplier:1.0f
                                   constant:0.f];
    
    //Bottom
    NSLayoutConstraint *bottom =[NSLayoutConstraint
                                 constraintWithItem:subView
                                 attribute:NSLayoutAttributeBottom
                                 relatedBy:NSLayoutRelationEqual
                                 toItem:parent
                                 attribute:NSLayoutAttributeBottom
                                 multiplier:1.0f
                                 constant:0.f];
    [parent addConstraint:top];
    [parent addConstraint:trailing];
    [parent addConstraint:leading];
    [parent addConstraint:bottom];
}

#pragma mark - Events

- (void) didStartLoadingWebsite {
    if (self.navigationItem.rightBarButtonItem != self.barBtnSpinner) {
        [self.navigationItem setRightBarButtonItem:self.barBtnSpinner animated:NO];
        [self.spinner startAnimating];
    }
}

- (void) didFinishLoadingWebsite {
    [self.spinner stopAnimating];
    [self.navigationItem setRightBarButtonItem:self.barBtnReload animated:NO];
}

#pragma mark - User Interaction

- (IBAction)showExample {
    UIStoryboard *sb = [UIStoryboard storyboardWithName:ExampleLoader bundle:nil];
    UIViewController *vc = [sb instantiateViewControllerWithIdentifier:ExampleLoaderNavigationController];
    
    [self presentViewController:vc animated:YES completion:nil];
}

- (void) reloadPage:(UIBarButtonItem *)sender {
    [self loadInitialURL];
}

- (IBAction)goBack {
    [self.webView goBack];
    [self updateBackForwardButtons];
}

- (IBAction)goForward {
    [self.webView goForward];
    [self updateBackForwardButtons];
}

- (void) updateBackForwardButtons {
    [self.btnGoBack setEnabled:self.webView.canGoBack];
    [self.btnGoForward setEnabled:self.webView.canGoForward];
}

#pragma mark - WKNavigationDelegate

-(void)webView:(WKWebView *)webView didStartProvisionalNavigation:(WKNavigation *)navigation {
    [self didStartLoadingWebsite];
}

-(void)webView:(WKWebView *)webView didCommitNavigation:(WKNavigation *)navigation {
    [self didStartLoadingWebsite];
    [self updateBackForwardButtons];
}

-(void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation {
    [self didFinishLoadingWebsite];
}

-(void)webViewWebContentProcessDidTerminate:(WKWebView *)webView {
    [self updateBackForwardButtons];
}

#pragma mark - Alerts


@end
