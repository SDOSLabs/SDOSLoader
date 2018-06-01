//
//  LoaderObject.m
//
//  Copyright © 2018 SDOS. All rights reserved.
//

#import "LoaderObject.h"
#import "LoaderObjectPrivateInterface.h"

@implementation LoaderObject

- (void) setLoaderType:(LoaderType) loaderType view:(UIView *) view size:(CGSize) size tag:(NSInteger) tag {
    _loaderType = loaderType;
    _view = view;
    _size = size;
    _tag = tag;
    _timeAnimation = 0.3;
}

- (void) setLoaderView:(id<GenericLoaderCustomizationProtocol>) loaderView {
    _loaderView = loaderView;
}

@end
