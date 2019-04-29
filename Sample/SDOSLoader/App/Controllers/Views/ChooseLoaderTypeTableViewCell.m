//
//  ChooseLoaderTypeTableViewCell.m
//  SDOSLoader
//
//  Created by Antonio Jesús Pallares on 3/11/16.
//  Copyright © 2016 SDOS. All rights reserved.
//

#import "ChooseLoaderTypeTableViewCell.h"
#import "SDOSLoaderSample-Swift.h"
@import SDOSLoader;

@interface ChooseLoaderTypeTableViewCell () <UIPickerViewDelegate, UIPickerViewDataSource>

@property (strong, nonatomic) id<ChooseLoaderTypeDelegate> delegate;

@property (strong, nonatomic) NSArray<NSString *> *supportedLoaderTypes;

@property (weak, nonatomic) IBOutlet UIPickerView *pckrLoaderType;

@end

@implementation ChooseLoaderTypeTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.supportedLoaderTypes = @[];
    self.pckrLoaderType.dataSource = self;
    self.pckrLoaderType.delegate = self;
}

-(void)setDelegate:(id<ChooseLoaderTypeDelegate>)delegate forSupportedLoaderTypes:(NSArray<NSString *> *)supportedLoaderTypes {
    self.supportedLoaderTypes = supportedLoaderTypes;
    self.delegate = delegate;
    [self.delegate didSelectLoaderType:[supportedLoaderTypes objectAtIndex:[self.pckrLoaderType selectedRowInComponent:0]]];
}

#pragma mark -
#pragma mark UIPickerViewDataSource


-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return self.supportedLoaderTypes.count;
}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    
    NSString *loaderType = [self.supportedLoaderTypes objectAtIndex:row];
    NSString *camelCaseTitle = [loaderType stringByReplacingOccurrencesOfString:@"LoaderType" withString:@""];
    
    NSString *title = [camelCaseTitle stringByReplacingOccurrencesOfString:@"([a-z])([A-Z])" withString:@"$1 $2" options:NSRegularExpressionSearch range:NSMakeRange(0, camelCaseTitle.length)];
    
    return title;
}

#pragma mark - UIPickerViewDelegate

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    
    NSString *selectedLoaderType = [self.supportedLoaderTypes objectAtIndex:row];
    
    [self.delegate didSelectLoaderType:selectedLoaderType];
}

@end
