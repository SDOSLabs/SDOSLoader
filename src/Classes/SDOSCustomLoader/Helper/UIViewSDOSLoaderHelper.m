//
//  UIViewSDOSLoaderHelper.h
//
//  Copyright © 2018 SDOS. All rights reserved.
//

#import "UIViewSDOSLoaderHelper.h"

@implementation UIViewSDOSLoaderHelper

+ (NSLayoutConstraint *)addConstraintWithItem:(id)view1
                                    attribute:(NSLayoutAttribute)attr1
                                    relatedBy:(NSLayoutRelation)relation
                                       toItem:(id)view2
                                    attribute:(NSLayoutAttribute)attr2
                                   multiplier:(CGFloat)multiplier
                                     constant:(CGFloat)c
                                       toView:(UIView *)view {
  NSLayoutConstraint *constraint =
      [NSLayoutConstraint constraintWithItem:view1
                                   attribute:attr1
                                   relatedBy:relation
                                      toItem:view2
                                   attribute:attr2
                                  multiplier:multiplier
                                    constant:c];
  constraint.priority = UILayoutPriorityRequired;
  [view addConstraint:constraint];
  return constraint;
}

+ (NSArray *)addConstraintsWithVisualFormat:(NSString *)format
                                    options:(NSLayoutFormatOptions)opts
                                    metrics:(NSDictionary *)metrics
                                      views:(NSDictionary *)views
                                     toView:(UIView *)view {
  NSArray *constraints = [NSLayoutConstraint constraintsWithVisualFormat:format
                                                                 options:opts
                                                                 metrics:metrics
                                                                   views:views];
  for (NSLayoutConstraint *constraint in constraints) {
    constraint.priority = UILayoutPriorityRequired;
  }
  [view addConstraints:constraints];
  return constraints;
}
@end
