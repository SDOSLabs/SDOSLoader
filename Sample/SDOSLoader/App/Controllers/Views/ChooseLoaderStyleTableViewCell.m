//
//  ChooseLoaderStyleTableViewCell.m
//  SDOSLoader
//
//  Created by Antonio Jesús Pallares on 8/11/16.
//  Copyright © 2016 SDOS. All rights reserved.
//

#import "ChooseLoaderStyleTableViewCell.h"

#define SEGMENTED_INDEX_DEFAULT_STYLE 0
#define SEGMENTED_INDEX_CUSTOM_STYLE 1

@interface ChooseLoaderStyleTableViewCell ()

@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentedCtrStyle;

@property (strong, nonatomic) id<ChooseLoaderStyleDelegate> delegate;

@end

@implementation ChooseLoaderStyleTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    [self configureSegmentedCtr];
}

- (void)configureSegmentedCtr {
    
    [self.segmentedCtrStyle setTitle:LS(@"Example.defaultStyle") forSegmentAtIndex:SEGMENTED_INDEX_DEFAULT_STYLE];
    [self.segmentedCtrStyle setTitle:LS(@"Example.customStyle") forSegmentAtIndex:SEGMENTED_INDEX_CUSTOM_STYLE];
    [self.segmentedCtrStyle setSelectedSegmentIndex:SEGMENTED_INDEX_DEFAULT_STYLE];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)setChooseLoaderStyleDelegate:(id<ChooseLoaderStyleDelegate>)delegate {
    self.delegate = delegate;
}

#pragma mark - User Interaction

- (IBAction)changeStyle:(UISegmentedControl *)sender {
    
    LoaderStyle loaderStyle;
    
    if (sender.selectedSegmentIndex == SEGMENTED_INDEX_DEFAULT_STYLE) {
        loaderStyle = LoaderStyleDefault;
    } else if (sender.selectedSegmentIndex == SEGMENTED_INDEX_CUSTOM_STYLE) {
        loaderStyle = LoaderStyleCustom;
    }
    [self.delegate didChangeLoaderStyle:loaderStyle];
}

#pragma mark - LoaderAttributeModifier

-(void)loaderSupportsAttribute:(BOOL)supported {
    
    [self.segmentedCtrStyle setEnabled:supported];
}

@end