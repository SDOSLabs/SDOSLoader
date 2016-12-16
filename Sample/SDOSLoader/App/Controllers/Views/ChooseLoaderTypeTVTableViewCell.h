//
//  ChooseLoaderTypeTVTableViewCell.h
//  SDOSLoader
//
//  Created by José Manuel Velázquez on 16/12/16.
//  Copyright © 2016 SDOS. All rights reserved.
//

#import <UIKit/UIKit.h>

#define ChooseLoaderTypeTVCellIdentifier @"ChooseLoaderTypeTVCellIdentifier"

@protocol ChooseLoaderTypeTVDelegate <NSObject>

- (void)didSelectLoaderType:(LoaderType)loaderType;

@end

@interface ChooseLoaderTypeTVTableViewCell : UITableViewCell

- (void)setDelegate:(id<ChooseLoaderTypeTVDelegate>)delegate forSupportedLoaderTypes:(NSArray <LoaderType> *)supportedLoaderTypes;

@end
