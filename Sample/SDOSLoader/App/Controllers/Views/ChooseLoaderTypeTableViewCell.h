//
//  ChooseLoaderTypeTableViewCell.h
//  SDOSLoader
//
//  Created by Antonio Jesús Pallares on 3/11/16.
//  Copyright © 2016 SDOS. All rights reserved.
//

#define ChooseLoaderTypeCellIdentifier @"ChooseLoaderTypeCellIdentifier"

#import <UIKit/UIKit.h>
@import SDOSLoader;

@protocol ChooseLoaderTypeDelegate <NSObject>

- (void)didSelectLoaderType:(NSString *)loaderType;

@end

@interface ChooseLoaderTypeTableViewCell : UITableViewCell

- (void)setDelegate:(id<ChooseLoaderTypeDelegate>)delegate forSupportedLoaderTypes:(NSArray <NSString *> *)supportedLoaderTypes;

@end
