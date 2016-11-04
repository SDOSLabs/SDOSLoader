//
//  ChooseSliderTableViewCell.m
//  SDOSLoader
//
//  Created by Antonio Jesús Pallares on 3/11/16.
//  Copyright © 2016 SDOS. All rights reserved.
//

#import "ChooseSliderTableViewCell.h"

#define DEFAULT_SIZE_LOADER 50.f
#define DEFAULT_LOADING_TIME_LOADER 5.f // segundos

@interface ChooseSliderTableViewCell ()

@property (strong, nonatomic) id<ChooseSliderDelegate> delegate;

@property (nonatomic) SliderType sliderType;
@property (weak, nonatomic) IBOutlet UILabel *lblTitle;
@property (weak, nonatomic) IBOutlet UISlider *slider;

@end

@implementation ChooseSliderTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
}

- (void)setDelegate:(id<ChooseSliderDelegate>)delegate forSliderType:(SliderType)sliderType minValue:(CGFloat)min maxValue:(CGFloat)max {
    
    self.delegate = delegate;
    self.sliderType = sliderType;
    
    [self configureSliderWithMinValue:min maxValue:max];
    
    [self sliderChanged:self.slider];
}

- (void)configureSliderWithMinValue:(CGFloat)min maxValue:(CGFloat)max {
    [self.slider setContinuous:YES];
    [self.slider setMinimumValue:min];
    [self.slider setMaximumValue:max];
}

#pragma mark - User Interaction

- (IBAction)sliderChanged:(UISlider *)sender {
    
    [self.delegate sliderOfType:self.sliderType changedToValue:sender.value];
    
    [self updateText:YES];
}

#pragma Updating the text

- (void)updateText:(BOOL)attributeSupported {
    
    float value = self.slider.value;
    
    NSString *title;
    
    switch (self.sliderType) {
        case SliderTypeSize:
            title = attributeSupported ? [NSString stringWithFormat:NSLocalizedString(@"Example.chosenSize", @""),(NSUInteger)roundf(value)] : NSLocalizedString(@"Example.sizeNotSupportedByLoader", @"");
            break;
        case SliderTypeLoadingTime:
            title = attributeSupported ? [NSString stringWithFormat:NSLocalizedString(@"Example.chosenLoadingTime", @""),value] : NSLocalizedString(@"Example.LoadingTimeNotSupportedByLoader", @"");
            break;
        default:
            title = @"";
            break;
    }
    
    self.lblTitle.text = title;
}

#pragma mark -

+ (float) defaultValueForSliderOfType:(SliderType)sliderType {
    switch (sliderType) {
        case SliderTypeSize:
            return DEFAULT_SIZE_LOADER;
            break;
        case SliderTypeLoadingTime:
            return DEFAULT_LOADING_TIME_LOADER;
        default:
            return 0.f;
            break;
    }
}

#pragma mark - LoaderAttributeModifier

-(void)loaderSupportsAttribute:(BOOL)supported {
    
    [self updateText:supported];
    [self.slider setEnabled:supported];
}

@end
