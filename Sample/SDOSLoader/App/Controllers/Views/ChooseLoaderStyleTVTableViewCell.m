//
//  ChooseLoaderStyleTVTableViewCell.m
//  SDOSLoader
//
//  Created by José Manuel Velázquez on 19/12/16.
//  Copyright © 2016 SDOS. All rights reserved.
//

#import "ChooseLoaderStyleTVTableViewCell.h"


#define SEGMENTED_INDEX_DEFAULT_STYLE 0
#define SEGMENTED_INDEX_CUSTOM_STYLE 1

@interface ChooseLoaderStyleTVTableViewCell ()

@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentedCtrStyle;

@property (strong, nonatomic) id<ChooseLoaderStyleTVDelegate> delegate;

@end

@implementation ChooseLoaderStyleTVTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    [self configureSegmentedCtr];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)configureSegmentedCtr {
    
    [self.segmentedCtrStyle setTitle:LS(@"Example.defaultStyle") forSegmentAtIndex:SEGMENTED_INDEX_DEFAULT_STYLE];
    [self.segmentedCtrStyle setTitle:LS(@"Example.customStyle") forSegmentAtIndex:SEGMENTED_INDEX_CUSTOM_STYLE];
    [self.segmentedCtrStyle setSelectedSegmentIndex:SEGMENTED_INDEX_DEFAULT_STYLE];
}

-(void)setChooseLoaderStyleDelegate:(id<ChooseLoaderStyleTVDelegate>)delegate {
    self.delegate = delegate;
}

- (IBAction)changeStyle:(UISegmentedControl *)sender {
    
    LoaderStyle loaderStyle;
    
    if (sender.selectedSegmentIndex == SEGMENTED_INDEX_DEFAULT_STYLE) {
        loaderStyle = LoaderStyleDefault;
    } else if (sender.selectedSegmentIndex == SEGMENTED_INDEX_CUSTOM_STYLE) {
        loaderStyle = LoaderStyleCustom;
    }
    [self.delegate didChangeLoaderStyle:loaderStyle];
}

@end
