//
//  UIViewSDOSLoaderHelper.h
//
//  Copyright © 2018 SDOS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface UIViewSDOSLoaderHelper : NSObject

+ (NSLayoutConstraint *)addConstraintWithItem:(id)view1
                                    attribute:(NSLayoutAttribute)attr1
                                    relatedBy:(NSLayoutRelation)relation
                                       toItem:(id)view2
                                    attribute:(NSLayoutAttribute)attr2
                                   multiplier:(CGFloat)multiplier
                                     constant:(CGFloat)c
                                       toView:(UIView *)view;
+ (NSArray *)addConstraintsWithVisualFormat:(NSString *)format
                                    options:(NSLayoutFormatOptions)opts
                                    metrics:(NSDictionary *)metrics
                                      views:(NSDictionary *)views
                                     toView:(UIView *)view;

@end

CF_IMPLICIT_BRIDGING_ENABLED

CG_INLINE CGPoint CGRectCenter(CGRect rect);

CG_INLINE CGPoint CGRectCenter(CGRect rect) {
  return CGPointMake(CGRectGetMidX(rect), CGRectGetMidY(rect));
}
CF_IMPLICIT_BRIDGING_DISABLED
