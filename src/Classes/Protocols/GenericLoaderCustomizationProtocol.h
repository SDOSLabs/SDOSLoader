//
//  GenericLoaderCustomizationProtocol.h
//  BaseProject
//
//  Created by Rafael Fernandez Alvarez on 23/11/15.
//  Copyright © 2015 SDOS. All rights reserved.
//

@protocol GenericLoaderCustomizationProtocol <NSObject>

@optional

- (void) loaderCustomizationInitWithType:(NSString *) loaderType;

- (void) loaderCustomizationInitWithType:(NSString *) loaderType tag:(NSInteger) tag;

@end
