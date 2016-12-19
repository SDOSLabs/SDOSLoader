//
//  ChooseTimeSizeTVTableViewCell.m
//  SDOSLoader
//
//  Created by José Manuel Velázquez on 19/12/16.
//  Copyright © 2016 SDOS. All rights reserved.
//

#import "ChooseTimeSizeTVTableViewCell.h"

#define DEFAULT_SIZE_LOADER 50.f
#define DEFAULT_LOADING_TIME_LOADER 5.f // segundos

@interface ChooseTimeSizeTVTableViewCell ()

@property (strong, nonatomic) id<ChooseCellTVDelegate> delegate;

@property (nonatomic) CellType cellType;
@property (weak, nonatomic) IBOutlet UIButton *btnDecrement;
@property (weak, nonatomic) IBOutlet UILabel *lbValue;
@property (weak, nonatomic) IBOutlet UIButton *btnIncrement;
@property (nonatomic) CGFloat minValue;
@property (nonatomic) CGFloat maxValue;

@end

@implementation ChooseTimeSizeTVTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setDelegate:(id<ChooseCellTVDelegate>)delegate forCellType:(CellType)cellType minValue:(CGFloat)min maxValue:(CGFloat)max{
    
    self.delegate = delegate;
    self.cellType = cellType;
    
    [self configureCellWithMinValue:min maxValue:max];
    
}

- (void)configureCellWithMinValue:(CGFloat)min maxValue:(CGFloat)max {
    
    self.minValue = min;
    self.maxValue = max;
    
    switch (self.cellType) {
        case CellTypeLoadingTime:
            self.lbValue.text = [NSString stringWithFormat:NSLocalizedString(@"Example.second", @""),self.minValue];
            break;
        case CellTypeSize:
            self.lbValue.text = [NSString stringWithFormat:NSLocalizedString(@"Example.size", @""),self.minValue, self.minValue];
            break;
    }
    
    
    self.btnDecrement.enabled = NO;
}

- (IBAction)pressButtonDecrement:(id)sender {
    
    CGFloat value;
    switch (self.cellType) {
        case CellTypeLoadingTime:
            value = [self.lbValue.text floatValue] - 1;
            self.lbValue.text = [NSString stringWithFormat:NSLocalizedString(@"Example.second", @""),value];
            break;
        case CellTypeSize:
            value = [self.lbValue.text floatValue] - 10;
            self.lbValue.text = [NSString stringWithFormat:NSLocalizedString(@"Example.size", @""),value, value];
            break;
    }
    
    if (value < self.maxValue) {
        self.btnIncrement.enabled = YES;
    }
    
    if (value == self.minValue) {
        self.btnDecrement.enabled = NO;
    }
    
    [self.delegate cellOfType:self.cellType changedToValue:value];
}

- (IBAction)pressButtonIncrement:(id)sender {
    
    CGFloat value;
    
    switch (self.cellType) {
        case CellTypeLoadingTime:
            value = [self.lbValue.text floatValue] + 1;
            self.lbValue.text = [NSString stringWithFormat:NSLocalizedString(@"Example.second", @""),value];
            break;
        case CellTypeSize:
            value = [self.lbValue.text floatValue] + 10;
            self.lbValue.text = [NSString stringWithFormat:NSLocalizedString(@"Example.size", @""),value, value];
            break;
    }
    
    if (value > self.minValue) {
        self.btnDecrement.enabled = YES;
    }
    
    if (value == self.maxValue) {
        self.btnIncrement.enabled = NO;
    }
    
    [self.delegate cellOfType:self.cellType changedToValue:value];
}

-(void)loaderSupportsAttribute:(BOOL)supported {
    
    if (supported) {
        [self.btnIncrement setEnabled:supported];
    }else{
        [self.btnDecrement setEnabled:supported];
        [self.btnIncrement setEnabled:supported];
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
