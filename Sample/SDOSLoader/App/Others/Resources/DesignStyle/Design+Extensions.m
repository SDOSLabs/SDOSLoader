//
//  Design+Extensions.m
//  BancDeSang
//
//  Created by Rafael Fernandez Alvarez on 19/5/15.
//  Copyright (c) 2015 S·dos. All rights reserved.
//

#import "Design+Extensions.h"

@implementation UIButton (Design)

- (void) loadStyleButtonDefault {
    [self.titleLabel setFont:self.titleLabel.font];
    self.layer.borderColor = self.layer.borderColor;
    self.layer.borderWidth = 2;
    self.layer.cornerRadius = 5;
    self.layer.masksToBounds = YES;
}

@end

#pragma mark - UIView

@implementation UIView (Design)

- (void) loadStyleViewDefault {
    self.backgroundColor = self.backgroundColor;
}

@end

#pragma mark - UILabel

@implementation UILabel (Design)

- (void) loadStyleLabelDefault {
    self.textColor = self.textColor;
    self.font = self.font;
}

- (void) loadStyleLabelFontSizeHuge {
    self.font = [UIFont fontWithName:self.font.fontName size:([UIFont systemFontSize]) * 5];
}

- (void) loadStyleLabelFontSizeVeryBig {
    self.font = [UIFont fontWithName:self.font.fontName size:([UIFont systemFontSize]) * 3.5];
}

- (void) loadStyleLabelFontSizeBig2 {
    self.font = [UIFont fontWithName:self.font.fontName size:([UIFont systemFontSize]) * 2.5];
}

- (void) loadStyleLabelFontSizeBig {
    self.font = [UIFont fontWithName:self.font.fontName size:([UIFont systemFontSize]) * 2];
}

- (void) loadStyleLabelFontSizeMedium {
    self.font = [UIFont fontWithName:self.font.fontName size:([UIFont systemFontSize]) * 1.8];
}

- (void) loadStyleLabelFontSizeNormalMedium {
    self.font = [UIFont fontWithName:self.font.fontName size:([UIFont systemFontSize]) * 1.4];
}

- (void) loadStyleLabelFontSizeNormalSemiMedium {
    self.font = [UIFont fontWithName:self.font.fontName size:([UIFont systemFontSize]) * 1.2];
}

- (void) loadStyleLabelFontSizeNormal {
    self.font = [UIFont fontWithName:self.font.fontName size:[UIFont systemFontSize]];
}

- (void) loadStyleLabelFontSizeSmall {
    self.font = [UIFont fontWithName:self.font.fontName size:[UIFont systemFontSize] * 0.9];
}

- (void) loadStyleLabelFontSizeVerySmall {
    self.font = [UIFont fontWithName:self.font.fontName size:[UIFont systemFontSize] * 0.8];
}

- (void) loadStyleLabelBold {
    self.font = [UIFont fontWithName:FUENTE_BOLD size:self.font.pointSize];
}

- (void) loadStyleLabelRegular {
    self.font = [UIFont fontWithName:FUENTE_REGULAR size:self.font.pointSize];
}

@end

#pragma mark - UIBarButtonItem

@implementation UIBarButtonItem (Design)

+ (instancetype) initStyleBarButtonItemWithText:(NSString *) text leftImage:(UIImage *) image target:(id) target selector:(SEL) selector {
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
    [btn setImage:image forState:UIControlStateNormal];
    [btn setTitleColor:btn.titleLabel.textColor forState:UIControlStateNormal];
    [btn setTitle:text forState:UIControlStateNormal];
    [btn.titleLabel setFont:[UIFont fontWithDescriptor:btn.titleLabel.font.fontDescriptor size:btn.titleLabel.font.pointSize]];
    [btn setTitleEdgeInsets:UIEdgeInsetsMake(0, 10, 0, 0)];
    
    UIBarButtonItem *barButton = [[UIBarButtonItem alloc] initWithCustomView:btn];
    return barButton;
}

@end

#pragma mark - UINavigationController

@implementation UINavigationController (Design)

- (void) loadStyleNavigationControllerDefault {
    
}

@end

#pragma mark - UIViewController

@implementation UIViewController (Design)

- (void) loadStyleViewControllerDefault {
//    if (SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"7.0")) {
//        self.edgesForExtendedLayout = UIRectEdgeAll;
//        self.extendedLayoutIncludesOpaqueBars=NO;
//        [self setNeedsStatusBarAppearanceUpdate];
//    }
    
    if (self.navigationController) {
        [self.navigationController loadStyleNavigationControllerDefault];
    }
}

@end

#pragma mark - UITextView

@implementation UITextView (Design)

- (void) loadStyleTextViewDefault {
    self.textColor = self.textColor;
    self.font = self.font;
    self.backgroundColor = self.backgroundColor;
    self.editable = self.editable;
    self.selectable = self.selectable;
}

@end

#pragma mark - UISlider

@implementation UISlider (Design)

- (void) loadStyleSliderDefault {
    
}

@end

#pragma mark - UISwitch

@implementation UISwitch (Design)

- (void) loadStyleSwitchDefault {
    
}

@end

#pragma mark - UITableView

@implementation UITableView (Design)

- (void) loadStyleTableViewDefault {
    
}

@end

#pragma mark - UIImageView

@implementation UIImageView (Design)

- (void) loadStyleImageViewDefault {
    
}

@end

#pragma mark - UICollectionView

@implementation UICollectionView (Design)

- (void) loadStyleCollectionViewDefault {
    
}

@end

/*
#pragma mark - MKMapView

@implementation MKMapView (Design)

- (void) loadStyleMapViewDefault {
    
}

@end
*/

#pragma mark - UIToolbar

@implementation UIToolbar (Design)

- (void) loadStyleToolBarDefault {
    
}

@end

#pragma mark - UISearchBar

@implementation UISearchBar (Design)

- (void) loadStyleSearchBarDefault {
    
}

@end

#pragma mark - MDProgress

@implementation MDProgress (Design)

- (void) loaderCustomizationInitWithType:(NSString *) loaderType tag:(NSInteger) tag {
    switch (tag) {
        case LOADER_TAG_CUSTOMIZED_LOADER: {
            if ([loaderType isEqualToString: LoaderTypeIndeterminateCircular]) {
                self.progressColor = [UIColor greenColor];
                self.trackColor = [UIColor orangeColor];
                self.trackWidth = 20;
            }
        } break;
        default:
            break;
    }
}

@end

#pragma mark - MBProgressHUD

@implementation MBProgressHUD (Design)

- (void) loaderCustomizationInitWithType:(NSString *) loaderType tag:(NSInteger) tag {
    switch (tag) {
        case LOADER_TAG_CUSTOMIZED_LOADER: {
            if ([loaderType isEqualToString: LoaderTypeText]) {
                self.contentColor = [UIColor redColor];
                self.detailsLabel.text = @"Por favor, espere";
                self.animationType = MBProgressHUDAnimationZoomIn;
            } else if ([loaderType isEqualToString:LoaderTypeProgressBar]) {
                self.contentColor = [UIColor blueColor];
                self.detailsLabel.text = @"Por favor, espere";
                self.animationType = MBProgressHUDAnimationZoomOut;
            } else if ([loaderType isEqualToString:LoaderTypeProgressCircular]) {
                self.contentColor = [UIColor whiteColor];
                self.bezelView.backgroundColor = [UIColor blackColor];
                self.detailsLabel.text = @"Por favor, espere";
                self.animationType = MBProgressHUDAnimationZoom;
            }
        } break;
        default:
            break;
    }
}

@end

#pragma mark - M13ProgressViewRing

@implementation M13ProgressViewRing (Desing)

- (void) loaderCustomizationInitWithType:(NSString *) loaderType tag:(NSInteger) tag {
    switch (tag) {
        case LOADER_TAG_CUSTOMIZED_LOADER: {
            if ([loaderType isEqualToString: LoaderTypeProgressCircularWithProgress]) {
                self.backgroundRingWidth = 10;
                self.progressRingWidth = 10;
                self.showPercentage = NO;
                self.primaryColor = [UIColor blackColor];
                self.secondaryColor = [UIColor lightGrayColor];
            }
        } break;
        default:
            break;
    }
}

@end

#pragma mark - DGActivityIndicatorView

@implementation DGActivityIndicatorView (Desing)

- (void) loaderCustomizationInitWithType:(NSString *) loaderType tag:(NSInteger) tag {
    switch (tag) {
        case LOADER_TAG_CUSTOMIZED_LOADER: {
                [self setTintColor:[UIColor orangeColor]];
        } break;
        default:
            break;
    }
}

@end


