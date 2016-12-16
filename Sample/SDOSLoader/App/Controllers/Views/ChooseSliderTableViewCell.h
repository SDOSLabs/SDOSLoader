//
//  ChooseSliderTableViewCell.h
//  SDOSLoader
//
//  Created by Antonio Jesús Pallares on 3/11/16.
//  Copyright © 2016 SDOS. All rights reserved.
//

#define ChooseSliderCellIdentifier @"ChooseSliderCellIdentifier"
#import "ExampleLoaderViewController.h"

#import <UIKit/UIKit.h>

typedef enum {
    SliderTypeSize,
    SliderTypeLoadingTime,
} SliderType;

@protocol ChooseSliderDelegate <NSObject>

- (void) sliderOfType:(SliderType)sliderType changedToValue:(CGFloat)value;

@end

@interface ChooseSliderTableViewCell : UITableViewCell <LoaderAttributeModifier>

@property (weak, nonatomic, readonly) IBOutlet UISlider *slider;

- (void)setDelegate:(id<ChooseSliderDelegate>)delegate forSliderType:(SliderType)sliderType minValue:(CGFloat)min maxValue:(CGFloat)max;

@end
