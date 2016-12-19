//
//  ChooseTimeSizeTVTableViewCell.h
//  SDOSLoader
//
//  Created by José Manuel Velázquez on 19/12/16.
//  Copyright © 2016 SDOS. All rights reserved.
//


#import <UIKit/UIKit.h>
#import "ExampleLoaderViewController.h"

#define ChooseCellTVCellIdentifier @"ChooseCellTVCellIdentifier"

typedef enum {
    CellTypeSize,
    CellTypeLoadingTime,
} CellType;

@protocol ChooseCellTVDelegate <NSObject>

- (void) cellOfType:(CellType)cellType changedToValue:(CGFloat)value;

@end

@interface ChooseTimeSizeTVTableViewCell : UITableViewCell <LoaderAttributeModifier>

- (void)setDelegate:(id<ChooseCellTVDelegate>)delegate forCellType:(CellType)cellType minValue:(CGFloat)min maxValue:(CGFloat)max;

@end
