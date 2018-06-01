//
//  SDOSLoaderProgressLayer.h
//
//  Copyright © 2018 SDOS. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import <UIKit/UIKit.h>

@interface SDOSLoaderProgressLayer : CALayer

@property(nonatomic) UIColor *progressColor;
@property(nonatomic) UIColor *trackColor;
@property(nonatomic) float trackWidth;
@property(nonatomic) BOOL drawTrack;
@property(nonatomic) BOOL determinate;
@property(nonatomic) float progress;
@property(nonatomic) CALayer *superLayer;
@property(nonatomic) UIView *superView;
@property(nonatomic) CGFloat circularProgressDiameter;

@property(nonatomic) BOOL isAnimating;

- (instancetype)initWithSuperLayer:(CALayer *)superLayer;
- (instancetype)initWithSuperView:(UIView *)superView;
- (void)superLayerDidResize;
- (void)startAnimating;
- (void)stopAnimating;
- (void)initContents;

@end
