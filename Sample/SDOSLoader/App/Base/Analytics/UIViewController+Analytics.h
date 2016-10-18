//
//  UIViewController+CoreiOS.h
//  BaseProject
//
//  Created by Rafael Fernandez Alvarez on 19/11/15.
//  Copyright © 2015 SDOS. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UIViewController (Analytics)

/**
 *  Nombre de la pantalla para Google Analytics (Por defecto: Nombre del controlador)
 */
@property (nonatomic, strong) NSString *screenName;

/**
 *  Indica si la variable se debe trackear en Google analytics de forma automática (Por defecto: true)
 */
@property (nonatomic, assign) BOOL canTrackGAI;


@end
