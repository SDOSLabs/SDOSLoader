//
//  SDOSLoaderProgressLayer.m
//
//  Copyright © 2018 SDOS. All rights reserved.
//

#import "SDOSLoaderProgressLayer.h"

#define kSDOSLoaderTrackWidth 5.f

@implementation SDOSLoaderProgressLayer

- (instancetype)initWithSuperLayer:(CALayer *)superLayer {
  if (self = [super init]) {
    _superLayer = superLayer;
    _trackWidth = kSDOSLoaderTrackWidth;
    [self initContents];
    [_superLayer addSublayer:self];
    [_superLayer addObserver:self forKeyPath:@"bounds" options:9 context:nil];
  }
  return self;
}

- (instancetype)initWithSuperView:(UIView *)superView {
  if (self = [super init]) {
    _superView = superView;
    _superLayer = superView.layer;
    _trackWidth = kSDOSLoaderTrackWidth;
    [self initContents];
    [_superLayer addSublayer:self];
    [superView addObserver:self forKeyPath:@"bounds" options:0 context:nil];
  }
  return self;
}

- (void)initContents {
}

- (void)setProgress:(float)progress {
  if (!_determinate)
    return;

  if (progress > 1)
    _progress = 1;
  else if (progress < 0)
    _progress = 0;
  else
    _progress = progress;
}

- (void)observeValueForKeyPath:(NSString *)keyPath
                      ofObject:(id)object
                        change:(NSDictionary *)change
                       context:(void *)context {
  [self superLayerDidResize];
}

- (void)superLayerDidResize {
}

- (void)startAnimating {
}

- (void)stopAnimating {
}

- (void)dealloc {
  [_superView removeObserver:self forKeyPath:@"bounds"];
  [_superLayer removeObserver:self forKeyPath:@"bounds"];
}

@end
