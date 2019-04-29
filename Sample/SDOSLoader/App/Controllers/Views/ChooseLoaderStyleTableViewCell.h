//
//  ChooseLoaderStyleTableViewCell.h
//  SDOSLoader
//
//  Created by Antonio Jesús Pallares on 8/11/16.
//  Copyright © 2016 SDOS. All rights reserved.
//

#import <UIKit/UIKit.h>

#define ChooseLoaderStyleCellIdentifier @"ChooseLoaderStyleCellIdentifier"


typedef enum {
    LoaderStyleDefault = 0,
    LoaderStyleCustom = 1
} LoaderStyle;

@protocol ChooseLoaderStyleDelegate <NSObject>

- (void) didChangeLoaderStyle:(LoaderStyle)loaderStyle;

@end

@interface ChooseLoaderStyleTableViewCell : UITableViewCell <LoaderAttributeModifier>

- (void)setChooseLoaderStyleDelegate:(id<ChooseLoaderStyleDelegate>)delegate;

@end
