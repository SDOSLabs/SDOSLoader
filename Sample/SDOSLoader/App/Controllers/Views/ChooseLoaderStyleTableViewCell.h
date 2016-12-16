//
//  ChooseLoaderStyleTableViewCell.h
//  SDOSLoader
//
//  Created by Antonio Jesús Pallares on 8/11/16.
//  Copyright © 2016 SDOS. All rights reserved.
//

#import <UIKit/UIKit.h>

#define ChooseLoaderStyleCellIdentifier @"ChooseLoaderStyleCellIdentifier"
#import "ExampleLoaderViewController.h"

typedef enum {
    LoaderStyleDefault,
    LoaderStyleCustom
} LoaderStyle;

@protocol ChooseLoaderStyleDelegate <NSObject>

- (void) didChangeLoaderStyle:(LoaderStyle)loaderStyle;

@end

@interface ChooseLoaderStyleTableViewCell : UITableViewCell <LoaderAttributeModifier>

- (void)setChooseLoaderStyleDelegate:(id<ChooseLoaderStyleDelegate>)delegate;

@end
