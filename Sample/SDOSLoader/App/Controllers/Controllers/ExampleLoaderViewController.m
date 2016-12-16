//
//  ExampleLoaderViewController.m
//  SDOSLoader
//
//  Created by Antonio Jesús Pallares on 3/11/16.
//  Copyright © 2016 SDOS. All rights reserved.
//

#import "ExampleLoaderViewController.h"

#import "ChooseLoaderTypeTableViewCell.h"
#import "ChooseSliderTableViewCell.h"
#import "ChooseTextForLoaderTableViewCell.h"
#import "ChooseLoaderStyleTableViewCell.h"

#define SECTION_CHOOSE_LOADER_TYPE 0
#define SECTION_CUSTOMIZE_LOADER 1

#define TIME_BETWEEN_UPDATES_IN_LOADERS 0.1 // seconds

#if TARGET_OS_IOS
@interface ExampleLoaderViewController () <ChooseLoaderTypeDelegate, ChooseSliderDelegate, ChooseTextForLoaderDelegate, ChooseLoaderStyleDelegate, UITableViewDataSource>
#elif TARGET_OS_TV
@interface ExampleLoaderViewController () <ChooseLoaderTypeDelegate, UITableViewDataSource>
#endif
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (strong, nonatomic) NSArray <LoaderType> *arraySupportedLoaderTypes;

// User selection
@property (strong, nonatomic) LoaderType selectedLoaderType;
@property (nonatomic) CGFloat selectedLoadingTime; // seconds
@property (nonatomic) CGSize selectedLoaderSize;
@property (copy, nonatomic) NSString *selectedLoaderText;
@property (nonatomic) NSInteger selectedTagForLoaderStyle;

@property (strong, nonatomic) LoaderObject *loaderShowing;

@property (strong, nonatomic) NSTimer *timerToStopLoader;
@property (strong, nonatomic) NSTimer *timerToUpdateLoader;

@property (strong, nonatomic) NSArray <UIControl *> *arrayControlsInTableView;

@property (strong, nonatomic) ChooseSliderTableViewCell *cellLoadingTimeLoader;
@property (strong, nonatomic) ChooseSliderTableViewCell *cellSizeLoader;
@property (strong, nonatomic) ChooseTextForLoaderTableViewCell *cellTextLoader;
@property (strong, nonatomic) ChooseLoaderStyleTableViewCell *cellLoaderStyle;


@end

@implementation ExampleLoaderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = [[[NSBundle mainBundle] infoDictionary] objectForKey:(id)kCFBundleNameKey];;
    
    [self loadDismissButton];
    [self loadShowLoaderButton];
    [self configureTableView];
}

-(void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    [self enableOrDisableControls];
}

- (void)configureTableView {
    [self registerCells];
    
    self.tableView.dataSource = self;
    self.tableView.allowsSelection = NO;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.estimatedRowHeight = 100;
    
    UIView *footer = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 1, 0.5)];
    footer.backgroundColor = self.tableView.separatorColor;
    self.tableView.tableFooterView = footer;
}

- (void) loadDismissButton {
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(dismiss:)];
}

- (void) loadShowLoaderButton {
    
    UIBarButtonSystemItem systemItem = self.loaderShowing != nil ? UIBarButtonSystemItemStop : UIBarButtonSystemItemPlay;
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:systemItem target:self action:@selector(showHideLoader:)];
}

- (void)registerCells {
    UINib *chooseLoaderTypeCellNib = [UINib nibWithNibName:NSStringFromClass([ChooseLoaderTypeTableViewCell class]) bundle:nil];
    [self.tableView registerNib:chooseLoaderTypeCellNib forCellReuseIdentifier:ChooseLoaderTypeCellIdentifier];
    UINib *chooseSliderCellNib = [UINib nibWithNibName:NSStringFromClass([ChooseSliderTableViewCell class]) bundle:nil];
    [self.tableView registerNib:chooseSliderCellNib forCellReuseIdentifier:ChooseSliderCellIdentifier];
    UINib *chooseTextForLoaderCellNib = [UINib nibWithNibName:NSStringFromClass([ChooseTextForLoaderTableViewCell class]) bundle:nil];
    [self.tableView registerNib:chooseTextForLoaderCellNib forCellReuseIdentifier:ChooseTextForLoaderCellIdentifier];
    UINib *chooseLoaderStyleCellNib = [UINib nibWithNibName:NSStringFromClass([ChooseLoaderStyleTableViewCell class]) bundle:nil];
    [self.tableView registerNib:chooseLoaderStyleCellNib forCellReuseIdentifier:ChooseLoaderStyleCellIdentifier];
}

#pragma mark - Properties

-(NSArray <LoaderType> *)arraySupportedLoaderTypes {
    return @[LoaderTypeText, LoaderTypeProgressBar, LoaderTypeProgressCircular, LoaderTypeIndeterminateCircular];
}

-(ChooseSliderTableViewCell *)cellLoadingTimeLoader {
    
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:SECTION_CUSTOMIZE_LOADER];
    UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:indexPath];
    
    if ([cell isKindOfClass:[ChooseSliderTableViewCell class]]) {
        return (ChooseSliderTableViewCell *)cell;
    }
    return nil;
}

-(ChooseSliderTableViewCell *)cellSizeLoader {
    
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:1 inSection:SECTION_CUSTOMIZE_LOADER];
    UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:indexPath];
    
    if ([cell isKindOfClass:[ChooseSliderTableViewCell class]]) {
        return (ChooseSliderTableViewCell *)cell;
    }
    return nil;
}

-(ChooseTextForLoaderTableViewCell *)cellTextLoader {
    
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:2 inSection:SECTION_CUSTOMIZE_LOADER];
    UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:indexPath];
    
    if ([cell isKindOfClass:[ChooseTextForLoaderTableViewCell class]]) {
        return (ChooseTextForLoaderTableViewCell *)cell;
    }
    return nil;
}

-(ChooseLoaderStyleTableViewCell *)cellLoaderStyle {
    
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:3 inSection:SECTION_CUSTOMIZE_LOADER];
    UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:indexPath];
    
    if ([cell isKindOfClass:[ChooseLoaderStyleTableViewCell class]]) {
        return (ChooseLoaderStyleTableViewCell *)cell;
    }
    return nil;
}


#pragma mark - User Interaction

- (void) dismiss:(id)sender {
    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}

- (void) showHideLoader:(id)sender {
    
    if (self.loaderShowing != nil) {
        [self hideLoader:nil];
    } else {
        [self showLoader];
    }
    
    [self loadShowLoaderButton];
}

- (void) showLoader {
    self.loaderShowing = [self configuredLoader];
    
    self.timerToStopLoader = [NSTimer scheduledTimerWithTimeInterval:self.selectedLoadingTime target:self selector:@selector(showHideLoader:) userInfo:nil repeats:NO];
    self.timerToUpdateLoader = [NSTimer scheduledTimerWithTimeInterval:TIME_BETWEEN_UPDATES_IN_LOADERS target:self selector:@selector(updateLoader:) userInfo:nil repeats:YES];
    
    [LoaderManager showLoader:self.loaderShowing];
}

- (void) hideLoader:(NSTimer *)timer {
    
    [self.timerToStopLoader invalidate];
    self.timerToStopLoader = nil;
    
    [self.timerToUpdateLoader invalidate];
    self.timerToUpdateLoader = nil;
    
    self.loaderShowing = nil;
    [LoaderManager hideLoadersOfView:self.view];
}


#pragma mark ChooseLoaderTypeDelegate

- (void)didSelectLoaderType:(LoaderType)loaderType {
    
    if ([self.selectedLoaderType isEqualToString:loaderType]) {
        return;
    }
    
    self.selectedLoaderType = loaderType;
    
    [self enableOrDisableControls];
}

#pragma mark ChooseSliderDelegate

- (void)sliderOfType:(SliderType)sliderType changedToValue:(CGFloat)value {
    
    switch (sliderType) {
        case SliderTypeSize:
            self.selectedLoaderSize = CGSizeMake(value, value);
            break;
        case SliderTypeLoadingTime:
            self.selectedLoadingTime = value;
            break;
        default:
            break;
    }
}

#pragma mark ChooseTextForLoaderDelegate

-(void)textFieldDidBeginEditing:(UITextField *)textField {
    
    CGFloat keyboardHeight = textField.textInputView.frame.size.height;
    CGRect frameOfTextFieldInView = [textField.superview convertRect:textField.frame toView:self.view];
    
    CGFloat yPositionOfLowerPointOfTextField = frameOfTextFieldInView.origin.y + frameOfTextFieldInView.size.height;
    
    if (yPositionOfLowerPointOfTextField > self.view.frame.size.height - keyboardHeight) {
        // Then we need to fix the overlapping
        
        CGFloat extraOffset = yPositionOfLowerPointOfTextField - (self.view.frame.size.height - keyboardHeight);
        
        CGPoint newOffset = CGPointMake(self.tableView.contentOffset.x, self.tableView.contentOffset.y + extraOffset);
        
        [self.tableView setContentOffset:newOffset animated:YES];
    }
}

-(void)didChangeTextForLoader:(NSString *)text {
    self.selectedLoaderText = text;
}


#pragma mark - ChooseLoaderStyleDelegate

-(void)didChangeLoaderStyle:(LoaderStyle)loaderStyle {
    switch (loaderStyle) {
        case LoaderStyleDefault:
            self.selectedTagForLoaderStyle = LOADER_TAG_DEFAULT_APPEARANCE_LOADER;
            break;
        case LoaderStyleCustom:
            self.selectedTagForLoaderStyle = LOADER_TAG_CUSTOMIZED_LOADER;
            break;
        default:
            self.selectedTagForLoaderStyle = LOADER_TAG_DEFAULT_APPEARANCE_LOADER;
            break;
    }
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    switch (section) {
        case SECTION_CHOOSE_LOADER_TYPE:
            return 1;
            break;
        case SECTION_CUSTOMIZE_LOADER:
            return 4;
            break;
        default:
            return 0;
            break;
    }
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    
    NSString *title;
    
    switch (section) {
        case SECTION_CHOOSE_LOADER_TYPE:
            title = NSLocalizedString(@"Example.ChooseLoaderType", @"");
            break;
        case SECTION_CUSTOMIZE_LOADER:
            title = NSLocalizedString(@"Example.CustomizeLoader", @"");
            break;
        default:
            title = @"";
            break;
    }
    return title;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell;
    
    if (indexPath.section == SECTION_CHOOSE_LOADER_TYPE && indexPath.row == 0) {
        cell = [tableView dequeueReusableCellWithIdentifier:ChooseLoaderTypeCellIdentifier forIndexPath:indexPath];
        if ([cell isKindOfClass:[ChooseLoaderTypeTableViewCell class]]) {
            [(ChooseLoaderTypeTableViewCell *)cell setDelegate:self forSupportedLoaderTypes:self.arraySupportedLoaderTypes];
        }
    } else if (indexPath.section == SECTION_CUSTOMIZE_LOADER) {
        
        if (indexPath.row == 0 || indexPath.row == 1) {
            // Choose Loading Time
            cell = [tableView dequeueReusableCellWithIdentifier:ChooseSliderCellIdentifier forIndexPath:indexPath];
            if ([cell isKindOfClass:[ChooseSliderTableViewCell class]]) {
                
                ChooseSliderTableViewCell *sliderCell = (ChooseSliderTableViewCell *)cell;
                
                SliderType sliderType;
                CGFloat minSliderValue;
                CGFloat maxSliderValue;
                
                if (indexPath.row == 0) {
                    sliderType = SliderTypeLoadingTime;
                    minSliderValue = 2.f;
                    maxSliderValue = 10.f;
                } else if (indexPath.row == 1) {
                    sliderType = SliderTypeSize;
                    minSliderValue = 25.f;
                    maxSliderValue = 200.f;
                }

                [sliderCell setDelegate:self forSliderType:sliderType minValue:minSliderValue maxValue:maxSliderValue];
            }
        } else if (indexPath.row == 2) {
            cell = [tableView dequeueReusableCellWithIdentifier:ChooseTextForLoaderCellIdentifier forIndexPath:indexPath];
            if ([cell isKindOfClass:[ChooseTextForLoaderTableViewCell class]]) {
                
                ChooseTextForLoaderTableViewCell * textCell = (ChooseTextForLoaderTableViewCell *)cell;
                
                [textCell setChooseTextForLoaderDelegate:self];
            }
        } else if (indexPath.row == 3) {
            cell = [tableView dequeueReusableCellWithIdentifier:ChooseLoaderStyleCellIdentifier forIndexPath:indexPath];
            if ([cell isKindOfClass:[ChooseLoaderStyleTableViewCell class]]) {
                ChooseLoaderStyleTableViewCell *styleCell = (ChooseLoaderStyleTableViewCell *)cell;
                
                [styleCell setChooseLoaderStyleDelegate:self];
            }
        }
    }
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] init];
    }
    
    return cell;
}



#pragma mark - Loader Configuration

- (LoaderObject *)configuredLoader {
    
    LoaderObject *loader = [LoaderManager loaderWithType:self.selectedLoaderType inView:self.view size:self.selectedLoaderSize tag:self.selectedTagForLoaderStyle];
    if (self.selectedLoaderText.length > 0) {
        [LoaderManager changeText:self.selectedLoaderText fromLoader:loader];
    }
    loader.disableUserInteractionViews = @[self.tableView];
    
    __block NSTimeInterval timeAnimation = 1;
    __weak typeof(self)weakSelf = self;
    __block UIView *mask = [[UIView alloc] initWithFrame:self.view.frame];
    mask.backgroundColor = [[UIColor whiteColor] colorWithAlphaComponent:0.7];
    mask.hidden = YES;
    
    loader.executeActionBlock = ^void(LoaderObject *loaderObject, LoaderActionType loaderAction) {
        switch (loaderAction) {
            case LoaderActionShow:
                [weakSelf.view addSubview:mask];
                [UIView animateWithDuration:timeAnimation animations:^{
                    mask.hidden = NO;
                }];
                break;
            case LoaderActionHide:
                [UIView animateWithDuration:timeAnimation animations:^{
                    mask.hidden = YES;
                } completion:^(BOOL finished) {
                    if (finished) {
                        [mask removeFromSuperview];
                    }
                }];
                break;
            default:
                break;
        }
    };
    
    return loader;
}

- (void) updateLoader:(NSTimer *)timer {
    if (self.loaderShowing != nil) {
        
        NSTimeInterval timeToFinishLoader = [[self.timerToStopLoader fireDate] timeIntervalSinceNow];
        
        CGFloat progress = (self.selectedLoadingTime - (CGFloat)timeToFinishLoader) / self.selectedLoadingTime;
        
        [LoaderManager changeProgress:progress fromLoader:self.loaderShowing];
        
    } else {
        [timer invalidate];
    }
}

- (void)enableOrDisableControls {

    BOOL loaderSupportsLoadingTime = YES;
    BOOL loaderSupportsSize = YES;
    BOOL loaderSupportsText = YES;
    BOOL loaderSupportsCustomStyle = YES;
    
    LoaderType type = self.selectedLoaderType;
    
    if ([type isEqualToString:LoaderTypeText] || [type isEqualToString:LoaderTypeProgressBar] || [type isEqualToString:LoaderTypeProgressCircular]) {
        loaderSupportsSize = NO;
    }

    [self.cellLoadingTimeLoader loaderSupportsAttribute:loaderSupportsLoadingTime];
    [self.cellSizeLoader loaderSupportsAttribute:loaderSupportsSize];
    [self.cellTextLoader loaderSupportsAttribute:loaderSupportsText];
    [self.cellLoaderStyle loaderSupportsAttribute:loaderSupportsCustomStyle];
}

@end
