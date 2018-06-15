//
//  SDOSLoaderCircularProgressLayer.h
//
//  Copyright © 2018 SDOS. All rights reserved.
//

#import "SDOSLoaderCircularProgressLayer.h"
#import "UIViewSDOSLoaderHelper.h"
#import <UIKit/UIKit.h>

#define kSDOSLoaderRotateAnimationKey @"rotate"
#define kSDOSLoaderStrokeAnimationKey @"stroke"
#define kSDOSLoaderCirleDiameter 48.f
#define kSDOSLoaderArcsCount 20.f
#define kSDOSLoaderMaxStrokeLength .75f
#define kSDOSLoaderMinStrokeLength .05f

@interface SDOSLoaderCircularProgressLayer ()
@end

@implementation SDOSLoaderCircularProgressLayer

float SDOSanimationDuration = 0.75f;
float SDOSrotateAnimationDuration = 2.f;
float SDOSanArc = 1.f / kSDOSLoaderArcsCount;
CAMediaTimingFunction *SDOStimmingFunction;

- (instancetype)initWithSuperLayer:(CALayer *)superLayer {
  if (self = [super initWithSuperLayer:superLayer]) {
    if (!SDOStimmingFunction)
      SDOStimmingFunction = [CAMediaTimingFunction
          functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
  }

  return self;
}

- (void)initContents {

  _progressLayer = [CAShapeLayer layer];
  _progressLayer.strokeColor = self.progressColor.CGColor;
  _progressLayer.fillColor = nil;
  _progressLayer.lineWidth = self.trackWidth;
  _progressLayer.strokeStart = 0.f;
  _progressLayer.strokeEnd = 0.5f;

  _trackLayer = [CAShapeLayer layer];
  _trackLayer.strokeColor = self.trackColor.CGColor;
  _trackLayer.fillColor = nil;
  _trackLayer.lineWidth = self.trackWidth;
  _trackLayer.strokeStart = 0.f;
  _trackLayer.strokeEnd = 1.f;
    
    [self adjustFrame];

  [self addSublayer:_trackLayer];
  [self addSublayer:_progressLayer];

  if (!self.drawTrack) {
    _trackLayer.opacity = 0;
  }
}

- (void)adjustFrame {
    if (self.circularProgressDiameter != 0) {
        CGPoint centerInParent = CGRectCenter(self.superLayer.bounds);
        
        self.frame = CGRectMake(centerInParent.x - kSDOSLoaderCirleDiameter / 2,
                                centerInParent.y - kSDOSLoaderCirleDiameter / 2,
                                kSDOSLoaderCirleDiameter, kSDOSLoaderCirleDiameter);
        
        if (self.circularProgressDiameter) {
            self.frame = CGRectMake(centerInParent.x - self.circularProgressDiameter / 2,
                                    centerInParent.y - self.circularProgressDiameter / 2,
                                    self.circularProgressDiameter, self.circularProgressDiameter);
        }
        
        CGPoint center = CGRectCenter(self.bounds);
        CGFloat radius =
        MIN(CGRectGetWidth(self.bounds) / 2, CGRectGetHeight(self.bounds) / 2) -
        _progressLayer.lineWidth / 2;
        CGFloat startAngle = (CGFloat)(0);
        CGFloat endAngle = (CGFloat)((kSDOSLoaderArcsCount * 2 + 1.5f) * M_PI);
        UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:center
                                                            radius:radius
                                                        startAngle:startAngle
                                                          endAngle:endAngle
                                                         clockwise:YES];
        
        _trackLayer.path = path.CGPath;
        _progressLayer.path = path.CGPath;
        
        _trackLayer.frame = self.bounds;
        _progressLayer.frame = self.bounds;
    }
}

#pragma mark Setters
- (void)setProgressColor:(UIColor *)progressColor {
  [super setProgressColor:progressColor];
  _progressLayer.strokeColor = self.progressColor.CGColor;
}

- (void)setTrackColor:(UIColor *)trackColor {
  [super setTrackColor:trackColor];
  _trackLayer.strokeColor = self.trackColor.CGColor;
}

- (void)setTrackWidth:(float)trackWidth {
  [super setTrackWidth:trackWidth];
  _progressLayer.lineWidth = self.trackWidth;
  _trackLayer.lineWidth = self.trackWidth;
}

- (void)setDrawTrack:(BOOL)drawTrack {
  [super setDrawTrack:drawTrack];
  if (drawTrack) {
    _trackLayer.opacity = 1.0f;
  } else {
    _trackLayer.opacity = 0.0f;
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

  _progressLayer.strokeEnd = SDOSanArc * self.progress;
  _progressLayer.transform =
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
  rotateAnimation.duration = SDOSrotateAnimationDuration;
  rotateAnimation.fromValue = @(0.f);
  rotateAnimation.toValue = @(2 * M_PI);
  rotateAnimation.repeatCount = INFINITY;
  rotateAnimation.removedOnCompletion = false;
  rotateAnimation.fillMode = kCAFillModeForwards;

  [self addAnimation:rotateAnimation forKey:kSDOSLoaderRotateAnimationKey];
  [_progressLayer addAnimation:[SDOSLoaderCircularProgressLayer indeterminateAnimation]
                        forKey:kSDOSLoaderStrokeAnimationKey];
  self.isAnimating = true;
}

- (void)stopAnimating {
  if (!self.isAnimating)
    return;

  [self removeAllAnimations];
  [_progressLayer removeAllAnimations];
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
                                                   withValueScale:SDOSanArc]];
      startValue += SDOSanArc * (kSDOSLoaderMaxStrokeLength + kSDOSLoaderMinStrokeLength);
      startTime += SDOSanimationDuration * 2;
    } while (!(fmodf(floorf(startValue * 1000), 1000) == 0));

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
  headAnimation.duration = SDOSanimationDuration;
  headAnimation.beginTime = beginTime;
  headAnimation.fromValue = @(beginValue);
  headAnimation.toValue =
      @(beginValue + aCircle * (kSDOSLoaderMaxStrokeLength + kSDOSLoaderMinStrokeLength));
  headAnimation.timingFunction = SDOStimmingFunction;

  CABasicAnimation *tailAnimation =
      [CABasicAnimation animationWithKeyPath:@"strokeStart"];
  tailAnimation.duration = SDOSanimationDuration;
  tailAnimation.beginTime = beginTime;
  tailAnimation.fromValue = @(beginValue - aCircle * kSDOSLoaderMinStrokeLength);
  tailAnimation.toValue = @(beginValue);
  tailAnimation.timingFunction = SDOStimmingFunction;

  CABasicAnimation *endHeadAnimation =
      [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
  endHeadAnimation.duration = SDOSanimationDuration;
  endHeadAnimation.beginTime = beginTime + SDOSanimationDuration;
  endHeadAnimation.fromValue =
      @(beginValue + aCircle * (kSDOSLoaderMaxStrokeLength + kSDOSLoaderMinStrokeLength));
  endHeadAnimation.toValue =
      @(beginValue + aCircle * (kSDOSLoaderMaxStrokeLength + kSDOSLoaderMinStrokeLength));
  endHeadAnimation.timingFunction = SDOStimmingFunction;

  CABasicAnimation *endTailAnimation =
      [CABasicAnimation animationWithKeyPath:@"strokeStart"];
  endTailAnimation.duration = SDOSanimationDuration;
  endTailAnimation.beginTime = beginTime + SDOSanimationDuration;
  endTailAnimation.fromValue = @(beginValue);
  endTailAnimation.toValue = @(beginValue + aCircle * kSDOSLoaderMaxStrokeLength);
  endTailAnimation.timingFunction = SDOStimmingFunction;
  return @[ headAnimation, tailAnimation, endHeadAnimation, endTailAnimation ];
}

- (void) resetLayer {
    [self adjustFrame];
}

@end
