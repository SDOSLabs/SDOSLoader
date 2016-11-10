//
//  AppDelegate.h
//  BaseProject
//
//  Created by Rafael Fernandez Alvarez on 16/11/15.
//  Copyright © 2015 SDOS. All rights reserved.
//

#import <UIKit/UIKit.h>

#define SharedAppDelegate ((AppDelegate*)[[UIApplication sharedApplication] delegate])

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@end

