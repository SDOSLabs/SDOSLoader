// The MIT License (MIT)
//
// Copyright (c) 2015 FPT Software
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

#import "SDOSMDCircularProgressLayer.h"
#import "SDOSUIViewHelper.h"
#import <UIKit/UIKit.h>

#define kMDRotateAnimationKey @"rotate"
#define kMDStrokeAnimationKey @"stroke"
#define kMDCirleDiameter 48.f
#define kMDArcsCount 20.f
#define kMDMaxStrokeLength .75f
#define kMDMinStrokeLength .05f

@interface SDOSMDCircularProgressLayer ()
@end

@implementation SDOSMDCircularProgressLayer

float sdosAnimationDuration = 0.75f;
float sdosRotateAnimationDuration = 2.f;
float sdosAnArc = 1.f / kMDArcsCount;
CAMediaTimingFunction *sdosTimmingFunction;

- (instancetype)initWithSuperLayer:(CALayer *)superLayer {
  if (self = [super initWithSuperLayer:superLayer]) {
    if (!sdosTimmingFunction)
      sdosTimmingFunction = [CAMediaTimingFunction
          functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
  }

  return self;
}

- (void)initContents {

  _sdosProgressLayer = [CAShapeLayer layer];
  _sdosProgressLayer.strokeColor = self.progressColor.CGColor;
  _sdosProgressLayer.fillColor = nil;
  _sdosProgressLayer.lineWidth = self.trackWidth;
  _sdosProgressLayer.strokeStart = 0.f;
  _sdosProgressLayer.strokeEnd = 0.5f;

  _sdosTrackLayer = [CAShapeLayer layer];
  _sdosTrackLayer.strokeColor = self.trackColor.CGColor;
  _sdosTrackLayer.fillColor = nil;
  _sdosTrackLayer.lineWidth = self.trackWidth;
  _sdosTrackLayer.strokeStart = 0.f;
  _sdosTrackLayer.strokeEnd = 1.f;
    
    [self adjustFrame];

  [self addSublayer:_sdosTrackLayer];
  [self addSublayer:_sdosProgressLayer];

  if (!self.drawTrack) {
    _sdosTrackLayer.opacity = 0;
  }
}

- (void)adjustFrame {
    if (self.circularProgressDiameter != 0) {
        CGPoint centerInParent = CGRectCenter(self.superLayer.bounds);
        
        self.frame = CGRectMake(centerInParent.x - kMDCirleDiameter / 2,
                                centerInParent.y - kMDCirleDiameter / 2,
                                kMDCirleDiameter, kMDCirleDiameter);
        
        if (self.circularProgressDiameter) {
            self.frame = CGRectMake(centerInParent.x - self.circularProgressDiameter / 2,
                                    centerInParent.y - self.circularProgressDiameter / 2,
                                    self.circularProgressDiameter, self.circularProgressDiameter);
        }
        
        CGPoint center = CGRectCenter(self.bounds);
        CGFloat radius =
        MIN(CGRectGetWidth(self.bounds) / 2, CGRectGetHeight(self.bounds) / 2) -
        _sdosProgressLayer.lineWidth / 2;
        CGFloat startAngle = (CGFloat)(0);
        CGFloat endAngle = (CGFloat)((kMDArcsCount * 2 + 1.5f) * M_PI);
        UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:center
                                                            radius:radius
                                                        startAngle:startAngle
                                                          endAngle:endAngle
                                                         clockwise:YES];
        
        _sdosTrackLayer.path = path.CGPath;
        _sdosProgressLayer.path = path.CGPath;
        
        _sdosTrackLayer.frame = self.bounds;
        _sdosProgressLayer.frame = self.bounds;
    }
}

#pragma mark Setters
- (void)setProgressColor:(UIColor *)progressColor {
  [super setProgressColor:progressColor];
  _sdosProgressLayer.strokeColor = self.progressColor.CGColor;
}

- (void)setTrackColor:(UIColor *)trackColor {
  [super setTrackColor:trackColor];
  _sdosTrackLayer.strokeColor = self.trackColor.CGColor;
}

- (void)setTrackWidth:(float)trackWidth {
  [super setTrackWidth:trackWidth];
  _sdosProgressLayer.lineWidth = self.trackWidth;
  _sdosTrackLayer.lineWidth = self.trackWidth;
}

- (void)setDrawTrack:(BOOL)drawTrack {
  [super setDrawTrack:drawTrack];
  if (drawTrack) {
    _sdosTrackLayer.opacity = 1.0f;
  } else {
    _sdosTrackLayer.opacity = 0.0f;
  }
}

- (void)setDeterminate:(BOOL)determinate {
  [super setDeterminate:determinate];
  if (self.determinate) {
    [self stopAnimating];
  } else {
    [self startAnimating];
  }
}

- (void)setProgress:(float)progress {
  [super setProgress:progress];
  if (!self.determinate)
    return;

  _sdosProgressLayer.strokeEnd = sdosAnArc * self.progress;
  _sdosProgressLayer.transform =
      CATransform3DMakeRotation(self.progress * 3 * M_PI_2, 0, 0, 1);
}

- (void)setCircularProgressDiameter:(CGFloat)circularProgressDiameter {
    [super setCircularProgressDiameter:circularProgressDiameter];
    [self adjustFrame];
}

- (void)startAnimating {
    if (self.circularProgressDiameter == 0) {
        return;
    }
  if (self.isAnimating || self.determinate)
    return;

  CABasicAnimation *rotateAnimation =
      [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
  rotateAnimation.duration = sdosRotateAnimationDuration;
  rotateAnimation.fromValue = @(0.f);
  rotateAnimation.toValue = @(2 * M_PI);
  rotateAnimation.repeatCount = INFINITY;
  rotateAnimation.removedOnCompletion = false;
  rotateAnimation.fillMode = kCAFillModeForwards;

  [self addAnimation:rotateAnimation forKey:kMDRotateAnimationKey];
  [_sdosProgressLayer addAnimation:[SDOSMDCircularProgressLayer indeterminateAnimation]
                        forKey:kMDStrokeAnimationKey];
  self.isAnimating = true;
}

- (void)stopAnimating {
  if (!self.isAnimating)
    return;

  [self removeAllAnimations];
  [_sdosProgressLayer removeAllAnimations];
  self.isAnimating = false;
}

- (void)superLayerDidResize {
  [self adjustFrame];
}

+ (CAAnimationGroup *)indeterminateAnimation {
  static CAAnimationGroup *animationGroups = nil;
  if (!animationGroups) {
    NSMutableArray *animations = [NSMutableArray array];
    float startValue = 0;
    float startTime = 0;

    do {
      [animations
          addObjectsFromArray:[self createAnimationFromStartValue:startValue
                                                     andStartTime:startTime
                                                   withValueScale:sdosAnArc]];
      startValue += sdosAnArc * (kMDMaxStrokeLength + kMDMinStrokeLength);
      startTime += sdosAnimationDuration * 2;
    } while (!fmodf(floorf(startValue * 1000), 1000) == 0);

    animationGroups = [CAAnimationGroup animation];
    animationGroups.duration = startTime;
    [animationGroups setAnimations:animations];
    [animationGroups setRepeatCount:INFINITY];
    animationGroups.removedOnCompletion = false;
    animationGroups.fillMode = kCAFillModeForwards;
  }

  return animationGroups;
}

+ (NSArray *)createAnimationFromStartValue:(float)beginValue
                              andStartTime:(float)beginTime
                            withValueScale:(float)aCircle {
  CABasicAnimation *headAnimation =
      [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
  headAnimation.duration = sdosAnimationDuration;
  headAnimation.beginTime = beginTime;
  headAnimation.fromValue = @(beginValue);
  headAnimation.toValue =
      @(beginValue + aCircle * (kMDMaxStrokeLength + kMDMinStrokeLength));
  headAnimation.timingFunction = sdosTimmingFunction;

  CABasicAnimation *tailAnimation =
      [CABasicAnimation animationWithKeyPath:@"strokeStart"];
  tailAnimation.duration = sdosAnimationDuration;
  tailAnimation.beginTime = beginTime;
  tailAnimation.fromValue = @(beginValue - aCircle * kMDMinStrokeLength);
  tailAnimation.toValue = @(beginValue);
  tailAnimation.timingFunction = sdosTimmingFunction;

  CABasicAnimation *endHeadAnimation =
      [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
  endHeadAnimation.duration = sdosAnimationDuration;
  endHeadAnimation.beginTime = beginTime + sdosAnimationDuration;
  endHeadAnimation.fromValue =
      @(beginValue + aCircle * (kMDMaxStrokeLength + kMDMinStrokeLength));
  endHeadAnimation.toValue =
      @(beginValue + aCircle * (kMDMaxStrokeLength + kMDMinStrokeLength));
  endHeadAnimation.timingFunction = sdosTimmingFunction;

  CABasicAnimation *endTailAnimation =
      [CABasicAnimation animationWithKeyPath:@"strokeStart"];
  endTailAnimation.duration = sdosAnimationDuration;
  endTailAnimation.beginTime = beginTime + sdosAnimationDuration;
  endTailAnimation.fromValue = @(beginValue);
  endTailAnimation.toValue = @(beginValue + aCircle * kMDMaxStrokeLength);
  endTailAnimation.timingFunction = sdosTimmingFunction;
  return @[ headAnimation, tailAnimation, endHeadAnimation, endTailAnimation ];
}

- (void) sdosResetLayer {
    [self adjustFrame];
}

@end
