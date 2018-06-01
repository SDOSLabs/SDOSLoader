//
//  UIColorSDOSLoaderHelper.h
//
//  Copyright © 2018 SDOS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColorSDOSLoaderHelper : NSObject
+ (UIColor *)colorWithRGBA:(NSString *)rgba;

+ (UIColor *)colorFromRGB:(NSString *)rgb withAlpha:(float)alpha;
@end
