//
//  ChooseTextForLoaderTVTableViewCell.h
//  SDOSLoader
//
//  Created by José Manuel Velázquez on 19/12/16.
//  Copyright © 2016 SDOS. All rights reserved.
//

#import <UIKit/UIKit.h>
#define ChooseTextForLoaderTVCellIdentifier @"ChooseTextForLoaderTVCellIdentifier"
#import "ExampleLoaderViewController.h"

@protocol ChooseTextForLoaderTVDelegate <NSObject>

- (void) didChangeTextForLoader:(NSString *)text;

@end

@interface ChooseTextForLoaderTVTableViewCell : UITableViewCell

- (void)setChooseTextForLoaderDelegate:(id<ChooseTextForLoaderTVDelegate>)delegate;

@end
