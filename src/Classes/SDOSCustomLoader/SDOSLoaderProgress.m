//
//  SDOSLoaderProgress.m
//
//  Copyright © 2018 SDOS. All rights reserved.
//

#import "SDOSLoaderProgress.h"
#import "SDOSLoaderCircularProgressLayer.h"
#import "SDOSLoaderLinearProgressLayer.h"
#import "SDOSLoaderConstants.h"
#import "UIColorSDOSLoaderHelper.h"

#define kSDOSLoaderCirleDiameter 48.f

@implementation SDOSLoaderProgress {
  SDOSLoaderProgressLayer *drawingLayer;
}

- (instancetype)init {
  if (self = [super init])
    [self initLayer];
  return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
  if (self = [super initWithCoder:aDecoder])
    [self initLayer];
  return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
  if (self = [super initWithFrame:frame])
    [self initLayer];
  return self;
}

- (id)initWithFrame:(CGRect)frame type:(enum SDOSLoaderProgressType)progressType {
  if (self = [super initWithFrame:frame]) {
    [self initLayer];
    _type = progressType;
  }
  return self;
}

- (void)initLayer {
  _progressColor = [UIColorSDOSLoaderHelper colorWithRGBA:kSDOSLoaderProgressColor];
  _trackColor = [UIColorSDOSLoaderHelper colorWithRGBA:kSDOSLoaderProgressTrackColor];
  //_circularProgressDiameter = kSDOSLoaderCirleDiameter;

  drawingLayer =
      [[SDOSLoaderCircularProgressLayer alloc] initWithSuperLayer:self.layer];
  drawingLayer.progressColor = _progressColor;
  drawingLayer.trackColor = _trackColor;
  drawingLayer.circularProgressDiameter = _circularProgressDiameter;
  if (_progressType == Indeterminate)
    [drawingLayer startAnimating];
}

- (void)layoutSubviews {
  [super layoutSubviews];
  [drawingLayer superLayerDidResize];
}

#pragma mark setters
- (void)setProgressColor:(UIColor *)progressColor {
  _progressColor = progressColor;
  drawingLayer.progressColor = progressColor;
}

- (void)setTrackColor:(UIColor *)trackColor {
  _trackColor = trackColor;
  drawingLayer.trackColor = trackColor;
}

- (void)setEnableTrackColor:(BOOL)enableTrackColor {
  _enableTrackColor = enableTrackColor;
  drawingLayer.drawTrack = enableTrackColor;
}

- (void)setTrackWidth:(float)trackWidth {
  _trackWidth = trackWidth;
  drawingLayer.trackWidth = trackWidth;
}

- (void)setType:(int)type {
  switch (type) {
  case 1:
    [self setProgressType:Determinate];
    break;
  //  case 2:
  //    [self setProgressType:Buffer];
  //    break;
  //  case 3:
  //    [self setProgressType:QueryIndeterminateAndDeterminate];
  //    break;
  default:
    [self setProgressType:Indeterminate];
  }
}

- (void)setStyle:(int)style {
  switch (style) {
  case 1:
    [self setProgressStyle:Linear];
    break;
  default:
    [self setProgressStyle:Circular];
    break;
  }
}

- (void)setProgressStyle:(enum SDOSLoaderProgressStyle)progressStyle {

  if (_progressStyle != progressStyle) {
    _progressStyle = progressStyle;
    [drawingLayer removeFromSuperlayer];
    switch (progressStyle) {
    case Circular:
      drawingLayer =
          [[SDOSLoaderCircularProgressLayer alloc] initWithSuperLayer:self.layer];
      //      drawingLayer =
      //          [[SDOSLoaderCircularProgressLayer alloc]
      //          initWithSuperLayer:self.layer];
      drawingLayer.progressColor = _progressColor;
      drawingLayer.trackColor = _trackColor;
      drawingLayer.circularProgressDiameter = _circularProgressDiameter;
      break;
    case Linear:
      drawingLayer =
          [[SDOSLoaderLinearProgressLayer alloc] initWithSuperLayer:self.layer];
      drawingLayer.progressColor = _progressColor;
      drawingLayer.trackColor = _trackColor;
      break;

    default:
      break;
    }

    drawingLayer.determinate = (_progressType == Determinate);
    if (_progressType == Indeterminate) {
      [drawingLayer startAnimating];
    }
  }
}

- (void)setProgressType:(enum SDOSLoaderProgressType)progressType {
  _progressType = progressType;
  switch (progressType) {
  case Indeterminate:
    drawingLayer.determinate = NO;
    break;
  case Determinate:
    drawingLayer.determinate = YES;
    drawingLayer.progress = _progress;
    break;
  //  case Buffer:
  //    break;
  //  case QueryIndeterminateAndDeterminate:
  //    break;

  default:
    break;
  }
}

- (void)setProgress:(float)progress {
  _progress = progress;
  drawingLayer.progress = progress;
}

- (void)setCircularProgressDiameter:(CGFloat)circularProgressDiameter {
  _circularProgressDiameter = circularProgressDiameter;
  drawingLayer.circularProgressDiameter = circularProgressDiameter;
    if ([drawingLayer isKindOfClass:[SDOSLoaderCircularProgressLayer class]]) {
        [((SDOSLoaderCircularProgressLayer *) drawingLayer) resetLayer];
        if (_progressType == Indeterminate) {
            [drawingLayer startAnimating];
        }
    }
}


- (void) startAnimation {
    [drawingLayer startAnimating];
}

- (void) stopAnimation {
    [drawingLayer stopAnimating];
}

@end
