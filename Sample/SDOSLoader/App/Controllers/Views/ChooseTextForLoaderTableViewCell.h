//
//  ChooseTextForLoaderTableViewCell.h
//  SDOSLoader
//
//  Created by Antonio Jesús Pallares on 3/11/16.
//  Copyright © 2016 SDOS. All rights reserved.
//

#define ChooseTextForLoaderCellIdentifier @"ChooseTextForLoaderCellIdentifier"

#import <UIKit/UIKit.h>

@protocol ChooseTextForLoaderDelegate <NSObject>

- (void) didChangeTextForLoader:(NSString *)text;

@end

@interface ChooseTextForLoaderTableViewCell : UITableViewCell <LoaderAttributeModifier>

@property (weak, nonatomic, readonly) IBOutlet UITextField *textField;

- (void)setChooseTextForLoaderDelegate:(id<ChooseTextForLoaderDelegate>)delegate;

@end
