//
//  ChooseLoaderTypeTableViewCell.m
//  SDOSLoader
//
//  Created by Antonio Jesús Pallares on 3/11/16.
//  Copyright © 2016 SDOS. All rights reserved.
//

#import "ChooseLoaderTypeTVTableViewCell.h"
#define HEIGHT 255

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
    
    NSIndexPath *indexPath=[NSIndexPath indexPathForRow:0 inSection:0];
    [self.tableView selectRowAtIndexPath:indexPath animated:YES  scrollPosition:UITableViewScrollPositionNone];
}

-(void)setDelegate:(id<ChooseLoaderTypeTVDelegate>)delegate forSupportedLoaderTypes:(NSArray<LoaderType> *)supportedLoaderTypes {
    self.supportedLoaderTypes = supportedLoaderTypes;
    self.delegate = delegate;
//    [self.delegate didSelectLoaderType:[supportedLoaderTypes objectAtIndex:[self.pckrLoaderType selectedRowInComponent:0]]];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.supportedLoaderTypes.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [[UITableViewCell alloc] init];
    
    LoaderType loaderType = [self.supportedLoaderTypes objectAtIndex:indexPath.row];
    NSString *camelCaseTitle = [loaderType stringByReplacingOccurrencesOfString:@"LoaderType" withString:@""];
    
    NSString *title = [camelCaseTitle stringByReplacingOccurrencesOfString:@"([a-z])([A-Z])" withString:@"$1 $2" options:NSRegularExpressionSearch range:NSMakeRange(0, camelCaseTitle.length)];
    
    cell.textLabel.text = title;
    
    return cell;
}

+ (CGFloat)height{
    
    return HEIGHT;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    LoaderType selectedLoaderType = [self.supportedLoaderTypes objectAtIndex:indexPath.row];
    
    [self.delegate didSelectLoaderType:selectedLoaderType];
}

@end
