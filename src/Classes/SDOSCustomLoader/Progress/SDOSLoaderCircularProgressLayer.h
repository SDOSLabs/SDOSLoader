//
//  SDOSLoaderCircularProgressLayer.h
//
//  Copyright © 2018 SDOS. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import <UIKit/UIKit.h>
#import "SDOSLoaderProgressLayer.h"

@interface SDOSLoaderCircularProgressLayer : SDOSLoaderProgressLayer

@property(nonatomic) CAShapeLayer *progressLayer;
@property(nonatomic) CAShapeLayer *trackLayer;

- (void) resetLayer;
 
@end
