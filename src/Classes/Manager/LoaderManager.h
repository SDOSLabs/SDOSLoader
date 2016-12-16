//
//  LoaderFactory.h
//  BaseProject
//
//  Created by Rafael Fernandez Alvarez on 23/11/15.
//  Copyright © 2015 SDOS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GenericLoaderCustomizationProtocol.h"
#import "LoaderObject.h"

typedef NSString * LoaderType;

/**
 *  Loader simple con texto.
 *  Vista obligatoria
 */
static const LoaderType LoaderTypeText = @"LoaderTypeText";

/**
 *  Loader simple con texto y barra de progreso
 *  Vista obligatoria
 */
static const LoaderType LoaderTypeProgressBar = @"LoaderTypeProgressBar";

/**
 *  Loader simple con texto y anillo de progreso
 *  Vista obligatoria
 */
static const LoaderType LoaderTypeProgressCircular = @"LoaderTypeProgressCircular";

/**
 *  Loader de estilo Circular de Material Design.
 *  Vista obligatoria
 *  Tamaño personalizable. Por defecto tiene un tamaño de 50x50
 */
static const LoaderType LoaderTypeIndeterminateCircular = @"LoaderTypeIndeterminateCircular";

/**
 *  Clase encargada de manejar cualquier tipo de loader de la aplicación. Proporciona funcionalidades para mostrar y ocultar los loaders de forma controlada.
 *  Para añadir un nuevo loader es necesario sobrescribir el metodo de la inicialización para añadir el nuevo tipo (A través de categorías y sin perder la implementación original)
 *  Para el correcto funcionamiento, durante la inicialización es necesario asignar los bloques "showBlock" y "hideBlock" de forma obligatoria
 *  Opcionalmente se implementaría el bloque "progressBlock" para modificar el progreso y el bloque "changeTextBlock" para modificar el texto
 *  Los loaders se pueden personalizar con las propiedades que él mismo permita. Para ello se debe crear una categoría que responda al protocolo "GenericLoaderCustomizationProtocol". Normalmente esto se hará en el fichero de diseño del proyecto.
 */
@interface LoaderManager : NSObject

/**
 *  Crea un LoaderObject de un tipo especifico.
 *
 *  @param loaderType Tipo del loader.
 *
 *  @return Instancia del LoaderObject.
 */
+ (LoaderObject *) loaderWithType:(LoaderType) loaderType;

/**
 *  Crea un LoaderObject de un tipo especifico con una vista asociada.
 *
 *  @param loaderType Tipo del loader.
 *  @param view       vista donde se cargará el loader.
 *
 *  @return Instancia del LoaderObject.
 */
+ (LoaderObject *) loaderWithType:(LoaderType) loaderType inView:(UIView *) view;

/**
 *  Crea un LoaderObject de un tipo especifico con una vista asociada
 *
 *  @param loaderType Tipo del loader.
 *  @param view       vista donde se cargará el loader.
 *  @param size       Tamaño del loader. Sólo es valido para loaders compatibles
 *
 *  @return Instancia del LoaderObject.
 */
+ (LoaderObject *) loaderWithType:(LoaderType) loaderType inView:(UIView *) view size:(CGSize) size;

/**
 *  Crea un LoaderObject de un tipo especifico con una vista asociada
 *
 *  @param loaderType Tipo del loader.
 *  @param view       vista donde se cargará el loader.
 *  @param tag        Tag del loader. Se usa para poder identificar el loader de forma única. Se usa especialmente durante la personalización del diseño del mismo.
 *
 *  @return Instancia del LoaderObject.
 */
+ (LoaderObject *) loaderWithType:(LoaderType) loaderType inView:(UIView *) view tag:(NSInteger) tag;

/**
 *  Crea un LoaderObject de un tipo especifico con una vista asociada
 *
 *  @param loaderType Tipo del loader.
 *  @param view       vista donde se cargará el loader.
 *  @param size       Tamaño del loader. Sólo es valido para loaders compatibles
 *  @param tag        Tag del loader. Se usa para poder identificar el loader de forma única. Se usa especialmente durante la personalización del diseño del mismo.
 *
 *  @return Instancia del LoaderObject.
 */
+ (LoaderObject *) loaderWithType:(LoaderType) loaderType inView:(UIView *) view size:(CGSize) size tag:(NSInteger)tag;

/**
 *  Muestra un loader en pantalla
 *
 *  @param loaderObject loader a mostrar
 */
+ (void) showLoader:(LoaderObject *) loaderObject;

/**
 *  Muestra un loader en pantalla con un poco de retraso. Si se llama a la función para ocultarlo antes de que éste se haya mostrado no se mostrará
 *
 *  @param loaderObject loader a mostrar
 *  @param delay        retraso para mostrar el loader
 */
+ (void) showLoader:(LoaderObject *) loaderObject withDelay:(NSTimeInterval) delay;

/**
 *  Cambia el progreso del loader
 *
 *  @param loaderProgress nuevo progreso para el loader (entre 0 y 1)
 *  @param loaderObject   loader a modificar
 */
+ (void) changeProgress:(CGFloat) loaderProgress fromLoader:(LoaderObject *) loaderObject;

/**
 *  Cambia el texto del loader
 *
 *  @param loaderText   Texto a poner en el loader
 *  @param loaderObject loader a modificar
 */
+ (void) changeText:(NSString *) loaderText fromLoader:(LoaderObject *) loaderObject;

/**
 *  Oculta el loader
 *
 *  @param loaderObject loader a ocultar
 */
+ (void) hideLoader:(LoaderObject *) loaderObject;

/**
 *  Oculta todos los loaders de una vista
 *
 *  @param view Vista de la que se quiere ocultar los laoders
 */
+ (void) hideLoadersOfView:(UIView *) view;

/**
 *  Devuelve todos los loader que se estén mostrando en una vista
 *
 *  @param view Vista de la que se quiere obtener los loaders
 *
 *  @return Array con los loaders
 */
+ (NSArray *) getLoadersOfView:(UIView *) view;

/**
 *  Oculta todos los loaders que se estén mostrando
 */
+ (void) hideAllLoaders;

@end
