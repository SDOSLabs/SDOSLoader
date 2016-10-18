//
//  FabricConfiguration.m
//  RocaApp
//
//  Created by Rafael Fernandez Alvarez on 1/9/16.
//  Copyright © 2016 SDOS. All rights reserved.
//

#import "FabricConfiguration.h"

#ifdef PREPRODUCTION
#import <Fabric/Fabric.h>
#import <Crashlytics/Crashlytics.h>
#endif

@implementation FabricConfiguration

+ (void)configure {
#ifdef PREPRODUCTION
    [Fabric with:@[CrashlyticsKit]];
#endif
}

@end
