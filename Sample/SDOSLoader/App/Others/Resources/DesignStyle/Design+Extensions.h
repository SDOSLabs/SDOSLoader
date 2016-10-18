//
//  Design+Extensions.h
//  BancDeSang
//
//  Created by Rafael Fernandez Alvarez on 19/5/15.
//  Copyright (c) 2015 S·dos. All rights reserved.
//

#pragma mark - UIButton

@interface UIButton (Design)

- (void) loadStyleButtonDefault;

@end

#pragma mark - UIView

@interface UIView (Design)

- (void) loadStyleViewDefault;

@end

#pragma mark - UILabel

@interface UILabel (Design)

- (void) loadStyleLabelDefault;

- (void) loadStyleLabelFontSizeHuge;
- (void) loadStyleLabelFontSizeVeryBig;
- (void) loadStyleLabelFontSizeBig2;
- (void) loadStyleLabelFontSizeBig;
- (void) loadStyleLabelFontSizeMedium;
- (void) loadStyleLabelFontSizeNormalMedium;
- (void) loadStyleLabelFontSizeNormalSemiMedium;
- (void) loadStyleLabelFontSizeNormal;
- (void) loadStyleLabelFontSizeSmall;
- (void) loadStyleLabelFontSizeVerySmall;

- (void) loadStyleLabelBold;
- (void) loadStyleLabelRegular;

@end

#pragma mark - UIBarButtonItem

@interface UIBarButtonItem (Design)

+ (instancetype) initStyleBarButtonItemWithText:(NSString *) text leftImage:(UIImage *) image target:(id) target selector:(SEL) selector;

@end

#pragma mark - UINavigationController

@interface UINavigationController (Design)

- (void) loadStyleNavigationControllerDefault;

@end

#pragma mark - UIViewController

@interface UIViewController (Design)

- (void) loadStyleViewControllerDefault;

@end

#pragma mark - UITextView

@interface UITextView (Design)

- (void) loadStyleTextViewDefault;

@end

#pragma mark - UITextField

@interface UITextField (Design)

- (void) loadStyleTextFieldDefault;

@end

#pragma mark - UISlider

@interface UISlider (Design)

- (void) loadStyleSliderDefault;

@end

#pragma mark - UISwitch

@interface UISwitch (Design)

- (void) loadStyleSwitchDefault;

@end

#pragma mark - UITableView

@interface UITableView (Design)

- (void) loadStyleTableViewDefault;

@end

#pragma mark - UIImageView

@interface UIImageView (Design)

- (void) loadStyleImageViewDefault;

@end

#pragma mark - UICollectionView

@interface UICollectionView (Design)

- (void) loadStyleCollectionViewDefault;

@end

/*
#pragma mark - MKMapView

@interface MKMapView (Design)

- (void) loadStyleMapViewDefault;

@end
*/

#pragma mark - UIToolbar

@interface UIToolbar (Design)

- (void) loadStyleToolBarDefault;

@end

#pragma mark - UISearchBar

@interface UISearchBar (Design)

- (void) loadStyleSearchBarDefault;

@end

