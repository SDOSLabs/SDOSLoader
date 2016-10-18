//
//  AppDelegate.m
//  BaseProject
//
//  Created by Rafael Fernandez Alvarez on 16/11/15.
//  Copyright © 2015 SDOS. All rights reserved.
//

#import "AppDelegate.h"
#import <Octopush/Octopush.h>
#import <Google/Analytics.h>
#import "FabricConfiguration.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    [UIApplication loadCoreiOSWithValue:PREPROCESS_MACRO_VALUE(KZBDefaultEnv)];
    [FabricConfiguration configure];
    [self loadOctopush:launchOptions];
    [self configureAnalytics];
    
    self.window.rootViewController = [[BaseViewController alloc] init];
    [self.window makeKeyAndVisible];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    
//    [Octopush registerLocation];
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

#pragma mark Push Notifications Methods

- (void) loadOctopush:(NSDictionary *)launchOptions {
    
    //Configuramos los parámetros de Octopush
    [Octopush shared].userNotificationTypes = (UIUserNotificationTypeSound | UIUserNotificationTypeAlert | UIUserNotificationTypeBadge);
    //Configuración optional
    [Octopush shared].clearNotificationCenterToRead = YES; //Default YES
    [Octopush shared].registerLocation = YES; //Default YES
    [Octopush shared].timeRegisterLocation = OCTOPUSH_HORA * 12; //Default 12 Hour
    [Octopush shared].octopushMode = KZ_octopushMode;
    
#if !TARGET_OS_SIMULATOR
    //Cargamos la configuración de Octopush (Este paso es obligatorio)
    [Octopush loadConfigurationWithSuccessBlock:nil failure:nil];
#endif
    
    //Si hemos accedido a la aplicación pulsando una notificación, ésta vendrá en el parámetro launchOptions
    
    //Obtenemos la notificación
    OctopushNotification *octopusNotification = [Octopush getNotificacion:launchOptions];
    
    //La notificación no tiene por que venir, por lo que comprobamos si existe
    if (octopusNotification) {
        //Tratamos la notificación
        [self tratamientoOctopushNotification:octopusNotification fetchCompletionHandler:nil];
    }
}

- (void)application:(UIApplication *)application didRegisterUserNotificationSettings:(UIUserNotificationSettings *)notificationSettings
{
    //register to receive notifications
    [application registerForRemoteNotifications];
}

- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken
{
    //Para cambiar los usuarios
    //[Octopus shared].user = nil;
    [Octopush registerDevice:deviceToken success:nil failure:nil];
}

// Lo podemos comprobar en el simulador ya que en este no podemos probar las notificaciones Push
- (void)application:(UIApplication *)application didFailToRegisterForRemoteNotificationsWithError:(NSError *)error
{
    NSLog(@"Error al obtener el token. Error: %@", [error.userInfo objectForKey:NSLocalizedDescriptionKey]);
}

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo fetchCompletionHandler:(void (^)(UIBackgroundFetchResult))completionHandler {
    //Obtenemos la notificación
    OctopushNotification *octopusNotification = [Octopush getNotificacion:userInfo];
    
    //Tratamos la notificación
    [self tratamientoOctopushNotification:octopusNotification fetchCompletionHandler:completionHandler];
}

- (void) tratamientoOctopushNotification:(OctopushNotification *) octopusNotification fetchCompletionHandler:(void (^)(UIBackgroundFetchResult))completionHandler {
    
    //Mostramos la notificación
    [Octopush showNotification:octopusNotification];
    
    if (completionHandler != nil) {
        completionHandler(UIBackgroundFetchResultNewData);
    }
}

#pragma mark Google Analytics Methods

- (void) configureAnalytics {
// Create tracker instance.
//    [[GAI sharedInstance] setDefaultTracker:[[GAI sharedInstance] trackerWithTrackingId:KZ_googleAnalyticsKey]];
//    [[GAI sharedInstance].defaultTracker send:[[[GAIDictionaryBuilder createEventWithCategory:@"UX" action:@"appstart" label:nil value:nil] set:@"start" forKey:kGAISessionControl] build]];
//    [GAI sharedInstance].trackUncaughtExceptions = YES;  // report uncaught exceptions
//Modo depuración. Borrar o comentar antes de subir a pro
//    [GAI sharedInstance].logger.logLevel = kGAILogLevelVerbose;
}

@end
