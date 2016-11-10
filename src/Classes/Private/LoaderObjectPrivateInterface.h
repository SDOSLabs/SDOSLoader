//
//  LoaderObjectPrivateInterface.h
//  BaseProject
//
//  Created by Rafael Fernandez Alvarez on 24/11/15.
//  Copyright © 2015 SDOS. All rights reserved.
//

/**
 *  Interfaz privada del LoaderObject. Sólo se debe importar en la clase de la inicialización
 */
typedef NSString * LoaderType;
@interface LoaderObject ()

- (void) setLoaderType:(LoaderType) loaderType view:(UIView *) view size:(CGSize) size tag:(NSInteger) tag;

- (void) setLoaderView:(id<GenericLoaderCustomizationProtocol>) loaderView;

/**
 *  Bloque usado para mostrar el loader
 */
@property (readwrite, copy) LoaderShowBlock showBlock;

/**
 *  Bloque usado para ocultar el loader
 */
@property (readwrite, copy) LoaderHideBlock hideBlock;

/**
 *  Bloque usado para modificar el progreso del loader
 */
@property (readwrite, copy) LoaderChangeProgressBlock changeProgressBlock;

/**
 *  Bloque usado para modificar el texto del loader
 */
@property (readwrite, copy) LoaderChangeTextBlock changeTextBlock;

@end
