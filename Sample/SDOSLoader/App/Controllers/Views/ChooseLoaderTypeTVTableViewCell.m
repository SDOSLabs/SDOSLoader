//
//  ChooseLoaderTypeTableViewCell.m
//  SDOSLoader
//
//  Created by Antonio Jesús Pallares on 3/11/16.
//  Copyright © 2016 SDOS. All rights reserved.
//

#import "ChooseLoaderTypeTVTableViewCell.h"

@interface ChooseLoaderTypeTVTableViewCell () <UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) id<ChooseLoaderTypeTVDelegate> delegate;

@property (strong, nonatomic) NSArray<LoaderType> *supportedLoaderTypes;

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ChooseLoaderTypeTVTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.supportedLoaderTypes = @[];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
}

-(void)setDelegate:(id<ChooseLoaderTypeTVDelegate>)delegate forSupportedLoaderTypes:(NSArray<LoaderType> *)supportedLoaderTypes {
    self.supportedLoaderTypes = supportedLoaderTypes;
    self.delegate = delegate;
//    [self.delegate didSelectLoaderType:[supportedLoaderTypes objectAtIndex:[self.pckrLoaderType selectedRowInComponent:0]]];
}

//#pragma mark -
//#pragma mark UIPickerViewDataSource
//
//
//-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
//    return 1;
//}
//
//-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
//    return self.supportedLoaderTypes.count;
//}
//
//-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
//    
//    LoaderType loaderType = [self.supportedLoaderTypes objectAtIndex:row];
//    NSString *camelCaseTitle = [loaderType stringByReplacingOccurrencesOfString:@"LoaderType" withString:@""];
//    
//    NSString *title = [camelCaseTitle stringByReplacingOccurrencesOfString:@"([a-z])([A-Z])" withString:@"$1 $2" options:NSRegularExpressionSearch range:NSMakeRange(0, camelCaseTitle.length)];
//    
//    return title;
//}
//
//#pragma mark - UIPickerViewDelegate
//
//-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
//    
//    LoaderType selectedLoaderType = [self.supportedLoaderTypes objectAtIndex:row];
//    
//    [self.delegate didSelectLoaderType:selectedLoaderType];
//}

@end
