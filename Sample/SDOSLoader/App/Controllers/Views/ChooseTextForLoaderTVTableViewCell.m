//
//  ChooseTextForLoaderTVTableViewCell.m
//  SDOSLoader
//
//  Created by José Manuel Velázquez on 19/12/16.
//  Copyright © 2016 SDOS. All rights reserved.
//

#define PLACEHOLDER_TEXT_LOADER NSLocalizedString(@"Example.changeTextForLoader", @"")
#define PLACEHOLDER_TEXT_NOT_SUPPORTED_BY_LOADER NSLocalizedString(@"Example.textNotSupportedByLoader", @"")

#import "ChooseTextForLoaderTVTableViewCell.h"

@interface ChooseTextForLoaderTVTableViewCell () <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *textField;

@property (strong, nonatomic) id<ChooseTextForLoaderTVDelegate> delegate;

@end

@implementation ChooseTextForLoaderTVTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    [self configureTextField];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void) configureTextField {
    self.textField.delegate = self;
    self.textField.placeholder = PLACEHOLDER_TEXT_LOADER;
    self.textField.textAlignment = NSTextAlignmentCenter;
    self.textField.autocorrectionType = UITextAutocorrectionTypeNo;
}

- (void)setChooseTextForLoaderDelegate:(id<ChooseTextForLoaderTVDelegate>)delegate {
    self.delegate = delegate;
    self.textField.text = nil;
    [self.delegate didChangeTextForLoader:nil];
}

- (IBAction)textFieldDidChange:(UITextField*)sender {
    
    NSString *trimmedText = [sender.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    if (trimmedText.length <= 0) {
        trimmedText = nil;
    }
    
    [self.delegate didChangeTextForLoader:trimmedText];
}



@end
