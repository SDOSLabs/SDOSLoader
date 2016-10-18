//
//  UIViewController+CoreiOS.m
//  BaseProject
//
//  Created by Rafael Fernandez Alvarez on 19/11/15.
//  Copyright © 2015 SDOS. All rights reserved.
//

static NSString *googleAnalyticsPropertyFile = @"PantallasAnalytics";

static NSDictionary *analyticsProperties;

static const NSString *suffix_selector = @"_SDOSBase";

#import "UIViewController+CoreiOS.h"
#import <Google/Analytics.h>

//Variables
static void * UIViewControllerPropertyScreenName = &UIViewControllerPropertyScreenName;
static void * UIViewControllerPropertyCanTrackGAI = &UIViewControllerPropertyCanTrackGAI;

@implementation UIViewController (Analytics)

+ (void)load {
	NSArray *arrayInstanceSelectors = @[NSStringFromSelector(@selector(init)),
										NSStringFromSelector(@selector(initWithCoder:)),
										NSStringFromSelector(@selector(initWithNibName:bundle:)),
										NSStringFromSelector(@selector(viewDidAppear:)),
										NSStringFromSelector(@selector(viewDidDisappear:))];
	
	for (NSString *strSelector in arrayInstanceSelectors) {
		SEL sel1 = NSSelectorFromString(strSelector);
		NSString *strSelectorFinal;
		if ([strSelector rangeOfString:[@":" lowercaseString]].location != NSNotFound) {
			strSelectorFinal = [NSString stringWithFormat:@"%@%@%@", [strSelector substringToIndex:[strSelector rangeOfString:[@":" lowercaseString]].location], suffix_selector, [strSelector substringFromIndex:[strSelector rangeOfString:[@":" lowercaseString]].location]];
		} else {
			strSelectorFinal = [NSString stringWithFormat:@"%@%@", strSelector, suffix_selector];
		}
		SEL sel2 = NSSelectorFromString(strSelectorFinal);
		method_exchangeImplementations(class_getInstanceMethod(self, sel1), class_getInstanceMethod(self, sel2));
	}
}

#pragma mark - Init

- (instancetype)init_SDOSBase {
	self = [self init_SDOSBase];
	if (self) {
		[self initialSetup_internal_analytics];
	}
	return self;
}

- (instancetype)initWithCoder_SDOSBase:(NSCoder *)aDecoder {
	self = [self initWithCoder_SDOSBase:aDecoder];
	if (self) {
		[self initialSetup_internal_analytics];
	}
	return self;
}

- (instancetype)initWithNibName_SDOSBase:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
	self = [self initWithNibName_SDOSBase:nibNameOrNil bundle:nibBundleOrNil];
	if (self) {
		[self initialSetup_internal_analytics];
	}
	return self;
}

- (void) initialSetup_internal_analytics {
	self.canTrackGAI = NO;
	if (!analyticsProperties) {
		analyticsProperties = [[NSDictionary alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:googleAnalyticsPropertyFile ofType:@"plist"]];
	}
	
	NSString *className = NSStringFromClass([self class]);
	NSString *propertyName = [analyticsProperties valueForKey:className];
	if (propertyName != nil && ![propertyName isEqualToString:@""]) {
		self.screenName = propertyName;
		self.canTrackGAI = YES;
	} else {
		self.screenName = NSStringFromClass([self class]);
	}
}

#pragma mark - Aparición/Desaparición

- (void)viewDidAppear_SDOSBase:(BOOL)animated {
	[self viewDidAppear_SDOSBase:animated];
	
	if (self.canTrackGAI) {
		id<GAITracker> tracker = [[GAI sharedInstance] defaultTracker];
		if (tracker) {
			[tracker set:kGAIScreenName value:self.screenName];
			[tracker send:[[GAIDictionaryBuilder createScreenView] build]];
		}
	}
}

#pragma mark - Get/Set

-(NSString *)screenName {
	return objc_getAssociatedObject(self, UIViewControllerPropertyScreenName);
}

- (void)setScreenName:(NSString *)screenName {
	objc_setAssociatedObject(self, UIViewControllerPropertyScreenName, screenName, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (BOOL)canTrackGAI {
	NSNumber *numberBoolean = objc_getAssociatedObject(self, UIViewControllerPropertyCanTrackGAI);
	return [numberBoolean boolValue];
}

- (void)setCanTrackGAI:(BOOL)canTrackGAI {
	objc_setAssociatedObject(self, UIViewControllerPropertyCanTrackGAI, @(canTrackGAI), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end
