//
//  ChooseLoaderStyleTVTableViewCell.h
//  SDOSLoader
//
//  Created by José Manuel Velázquez on 19/12/16.
//  Copyright © 2016 SDOS. All rights reserved.
//

#import <UIKit/UIKit.h>
#define ChooseLoaderStyleTVCellIdentifier @"ChooseLoaderStyleTVCellIdentifier"

typedef enum {
    LoaderStyleDefault,
    LoaderStyleCustom
} LoaderStyle;

@protocol ChooseLoaderStyleTVDelegate <NSObject>

- (void) didChangeLoaderStyle:(LoaderStyle)loaderStyle;

@end

@interface ChooseLoaderStyleTVTableViewCell : UITableViewCell

- (void)setChooseLoaderStyleDelegate:(id<ChooseLoaderStyleTVDelegate>)delegate;

@end
