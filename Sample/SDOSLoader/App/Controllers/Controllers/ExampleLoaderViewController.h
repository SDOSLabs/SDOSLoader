//
//  ExampleLoaderViewController.h
//  SDOSLoader
//
//  Created by Antonio Jesús Pallares on 3/11/16.
//  Copyright © 2016 SDOS. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol LoaderAttributeModifier <NSObject>

-(void)loaderSupportsAttribute:(BOOL)supported;

@end

@interface ExampleLoaderViewController : UIViewController

@end
