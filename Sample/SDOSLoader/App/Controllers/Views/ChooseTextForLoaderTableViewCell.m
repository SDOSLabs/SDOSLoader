//
//  ChooseTextForLoaderTableViewCell.m
//  SDOSLoader
//
//  Created by Antonio Jesús Pallares on 3/11/16.
//  Copyright © 2016 SDOS. All rights reserved.
//


#define PLACEHOLDER_TEXT_LOADER NSLocalizedString(@"Example.changeTextForLoader", @"")
#define PLACEHOLDER_TEXT_NOT_SUPPORTED_BY_LOADER NSLocalizedString(@"Example.textNotSupportedByLoader", @"")


#import "ChooseTextForLoaderTableViewCell.h"

@interface ChooseTextForLoaderTableViewCell () <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *textField;

@property (strong, nonatomic) id<ChooseTextForLoaderDelegate> delegate;

@end

@implementation ChooseTextForLoaderTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    [self configureTextField];
    
    [self updateText:YES];
}

-(void) configureTextField {
    self.textField.delegate = self;
    self.textField.placeholder = PLACEHOLDER_TEXT_LOADER;
    self.textField.textAlignment = NSTextAlignmentCenter;
    self.textField.autocorrectionType = UITextAutocorrectionTypeNo;
}

- (void)setChooseTextForLoaderDelegate:(id<ChooseTextForLoaderDelegate>)delegate {
    self.delegate = delegate;
    self.textField.text = @"Cargando";
    [self.delegate didChangeTextForLoader:nil];
}

- (void)updateText:(BOOL) supported {
    
    self.textField.placeholder = supported ? PLACEHOLDER_TEXT_LOADER : PLACEHOLDER_TEXT_NOT_SUPPORTED_BY_LOADER;
    if (!supported) {
        self.textField.text = nil;
    }
}

#pragma mark - UITextFieldDelegate 


- (IBAction)textDidChange:(UITextField *)sender {
    NSString *trimmedText = [sender.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    if (trimmedText.length <= 0) {
        trimmedText = nil;
    }
    
    [self.delegate didChangeTextForLoader:trimmedText];
}


#pragma mark - LoaderAttributeModifier

-(void)loaderSupportsAttribute:(BOOL)supported {
    
    [self updateText:supported];
    [self.textField setEnabled:supported];
    [self.delegate didChangeTextForLoader:self.textField.text];
}

@end
