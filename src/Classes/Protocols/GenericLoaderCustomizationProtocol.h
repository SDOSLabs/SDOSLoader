//
//  GenericLoaderCustomizationProtocol.h
//
//  Copyright © 2018 SDOS. All rights reserved.
//

@protocol GenericLoaderCustomizationProtocol <NSObject>

@optional

- (void) loaderCustomizationInitWithType:(NSString *) loaderType;

- (void) loaderCustomizationInitWithType:(NSString *) loaderType tag:(NSInteger) tag;

@end
