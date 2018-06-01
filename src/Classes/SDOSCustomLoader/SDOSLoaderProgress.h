//
//  SDOSLoaderProgress.h
//
//  Copyright © 2018 SDOS. All rights reserved.
//

#import <UIKit/UIKit.h>

enum SDOSLoaderProgressStyle { Circular, Linear };

enum SDOSLoaderProgressType {
  Indeterminate,
  Determinate,
  //  Buffer,
  //  QueryIndeterminateAndDeterminate
};

@interface SDOSLoaderProgress : UIView

- (id)initWithFrame:(CGRect)frame type:(enum SDOSLoaderProgressType)progressType;

@property(nonatomic) UIColor *progressColor;
@property(nonatomic) UIColor *trackColor;
@property(nonatomic) enum SDOSLoaderProgressType progressType;
@property(nonatomic) enum SDOSLoaderProgressStyle progressStyle;
@property(nonatomic) CGFloat circularProgressDiameter;

@property(nonatomic) int type;
@property(nonatomic) int style;
@property(nonatomic) float trackWidth;

@property(nonatomic) float progress;
@property(nonatomic) BOOL enableTrackColor;

- (void) startAnimation;
- (void) stopAnimation;
@end
