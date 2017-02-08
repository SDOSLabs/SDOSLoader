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
 *  Loader con anillo de progreso y texto automática del progreso
 *  Vista obligatoria
 *  Tamaño personalizable. Por defecto tiene un tamaño de 50x50
 */
static const LoaderType LoaderTypeProgressCircularWithProgress = @"LoaderTypeProgressCircularWithProgress";

/**
 *  Loader de estilo Circular de Material Design.
 *  Vista obligatoria
 *  Tamaño personalizable. Por defecto tiene un tamaño de 50x50
 */
static const LoaderType LoaderTypeIndeterminateCircular = @"LoaderTypeIndeterminateCircular";

/**
 *  Loader con estilo de bolitas en una disposición 3x3 con efectos de crecimiento y decrecimiento individual por cada bolita
 *  Vista obligatoria
 *  Tamaño personalizable. Por defecto tiene un tamaño de 50x50
 */
static const LoaderType LoaderTypeNineDots = @"LoaderTypeNineDots";

/**
 *  Loader con estilo de triple pulsación de dentro hacia afuera con difuminado conforme llega al crecimiento máximo
 *  Vista obligatoria
 *  Tamaño personalizable. Por defecto tiene un tamaño de 50x50
 */
static const LoaderType LoaderTypeTriplePulse = @"LoaderTypeTriplePulse";

/**
 *  Loader con estilo de bolitas en una disposición de 3 arriba y 2 abajo, con movimiento vertical entre ellas
 *  Vista obligatoria
 *  Tamaño personalizable. Por defecto tiene un tamaño de 50x50
 */
static const LoaderType LoaderTypeFiveDots = @"LoaderTypeFiveDots";

/**
 *  Loader con estilo de cuadrados que se mueven formando un cuadrado imaginario y cambiando el tamaño de los cuadrados
 *  Vista obligatoria
 *  Tamaño personalizable. Por defecto tiene un tamaño de 50x50
 */
static const LoaderType LoaderTypeRotatingSquares = @"LoaderTypeRotatingSquares";

/**
 *  Loader con estilo de dos bolas que crecen y decrecen de forma alternada sobre el mismo centro
 *  Vista obligatoria
 *  Tamaño personalizable. Por defecto tiene un tamaño de 50x50
 */
static const LoaderType LoaderTypeDoubleBounce = @"LoaderTypeDoubleBounce";

/**
 *  Loader con estilo de dos bolas que crecen y decrecen de forma alternada sobre diferentes centros
 *  Vista obligatoria
 *  Tamaño personalizable. Por defecto tiene un tamaño de 50x50
 */
static const LoaderType LoaderTypeTwoDots = @"LoaderTypeTwoDots";

/**
 *  Loader con estilo de tres bolas que crecen y decrecen de forma al mismo tiempo sobre diferentes centros
 *  Vista obligatoria
 *  Tamaño personalizable. Por defecto tiene un tamaño de 50x50
 */
static const LoaderType LoaderTypeThreeDots = @"LoaderTypeThreeDots";

/**
 *  Loader con estilo de tres bolas que crecen y decrecen de forma alternada sobre diferentes centros
 *  Vista obligatoria
 *  Tamaño personalizable. Por defecto tiene un tamaño de 50x50
 */
static const LoaderType LoaderTypeBallPulse = @"LoaderTypeBallPulse";

/**
 *  Loader con estilo de anillo que crece y decrece
 *  Vista obligatoria
 *  Tamaño personalizable. Por defecto tiene un tamaño de 50x50
 */
static const LoaderType LoaderTypeBallClipRotate = @"LoaderTypeBallClipRotate";

/**
 *  Loader con estilo de semianillo que crece y decrece con una bola en la parte central
 *  Vista obligatoria
 *  Tamaño personalizable. Por defecto tiene un tamaño de 50x50
 */
static const LoaderType LoaderTypeBallClipRotatePulse = @"LoaderTypeBallClipRotatePulse";

/**
 *  Loader con estilo de seminanillo que crece y decrece, teniendo otro semi anillo que gira en el sentido opuesto
 *  Vista obligatoria
 *  Tamaño personalizable. Por defecto tiene un tamaño de 50x50
 */
static const LoaderType LoaderTypeBallClipRotateMultiple = @"LoaderTypeBallClipRotateMultiple";

/**
 *  Loader con estilo de tres bolas que crecen y decrecen de forma al mismo tiempo pivotando sobre la bola central
 *  Vista obligatoria
 *  Tamaño personalizable. Por defecto tiene un tamaño de 50x50
 */
static const LoaderType LoaderTypeBallRotate = @"LoaderTypeBallRotate";

/**
 *  Loader con estilo de dos bolas que describen una trayectoria de zig zag
 *  Vista obligatoria
 *  Tamaño personalizable. Por defecto tiene un tamaño de 50x50
 */
static const LoaderType LoaderTypeBallZigZag = @"LoaderTypeBallZigZag";

/**
 *  Loader con estilo de dos bolas que describen una trayectoria de zig zag, realizando solo la mitad de la animación
 *  Vista obligatoria
 *  Tamaño personalizable. Por defecto tiene un tamaño de 50x50
 */
static const LoaderType LoaderTypeBallZigZagDeflect = @"LoaderTypeBallZigZagDeflect";

/**
 *  Loader con estilo de tres bolas que describen la trayectoria de un triangulo imaginario
 *  Vista obligatoria
 *  Tamaño personalizable. Por defecto tiene un tamaño de 50x50
 */
static const LoaderType LoaderTypeBallTrianglePath = @"LoaderTypeBallTrianglePath";

/**
 *  Loader con estilo de pulsación de dentro hacia afuera con difuminado conforme llega al crecimiento máximo
 *  Vista obligatoria
 *  Tamaño personalizable. Por defecto tiene un tamaño de 50x50
 */
static const LoaderType LoaderTypeBallScale = @"LoaderTypeBallScale";

/**
 *  Loader con estilo de 5 líneas verticales que crecen con un efecto de ola
 *  Vista obligatoria
 *  Tamaño personalizable. Por defecto tiene un tamaño de 50x50
 */
static const LoaderType LoaderTypeLineScale = @"LoaderTypeLineScale";

/**
 *  Loader con estilo de 5 líneas verticales que crecen con un efecto asíncrono
 *  Vista obligatoria
 *  Tamaño personalizable. Por defecto tiene un tamaño de 50x50
 */
static const LoaderType LoaderTypeLineScaleParty = @"LoaderTypeLineScaleParty";

/**
 *  Loader con estilo de multiple pulsación de dentro hacia afuera con difuminado conforme llega al crecimiento máximo
 *  Vista obligatoria
 *  Tamaño personalizable. Por defecto tiene un tamaño de 50x50
 */
static const LoaderType LoaderTypeBallScaleMultiple = @"LoaderTypeBallScaleMultiple";

/**
 *  Loader con estilo de tres bolitas que tienen un efecto de ola
 *  Vista obligatoria
 *  Tamaño personalizable. Por defecto tiene un tamaño de 50x50
 */
static const LoaderType LoaderTypeBallPulseSync = @"LoaderTypeBallPulseSync";

/**
 *  Loader con estilo de tres bolitas que tienen un efecto de desaparición y aparición
 *  Vista obligatoria
 *  Tamaño personalizable. Por defecto tiene un tamaño de 50x50
 */
static const LoaderType LoaderTypeBallBeat = @"LoaderTypeBallBeat";

/**
 *  Loader con estilo de 5 líneas verticales que crecen con un efecto de ola de dentro a afuera
 *  Vista obligatoria
 *  Tamaño personalizable. Por defecto tiene un tamaño de 50x50
 */
static const LoaderType LoaderTypeLineScalePulseOut = @"LoaderTypeLineScalePulseOut";

/**
 *  Loader con estilo de 5 líneas verticales que crecen con un efecto de ola de dentro a afuera
 *  Vista obligatoria
 *  Tamaño personalizable. Por defecto tiene un tamaño de 50x50
 */
static const LoaderType LoaderTypeLineScalePulseOutRapid = @"LoaderTypeLineScalePulseOutRapid";

/**
 *  Loader con estilo de anillo de pulsación de dentro hacia afuera
 *  Vista obligatoria
 *  Tamaño personalizable. Por defecto tiene un tamaño de 50x50
 */
static const LoaderType LoaderTypeBallScaleRipple = @"LoaderTypeBallScaleRipple";

/**
 *  Loader con estilo de triple anillo de pulsación de dentro hacia afuera
 *  Vista obligatoria
 *  Tamaño personalizable. Por defecto tiene un tamaño de 50x50
 */
static const LoaderType LoaderTypeBallScaleRippleMultiple = @"LoaderTypeBallScaleRippleMultiple";

/**
 *  Loader con estilo de triangulo
 *  Vista obligatoria
 *  Tamaño personalizable. Por defecto tiene un tamaño de 50x50
 */
static const LoaderType LoaderTypeTriangleSkewSpin = @"LoaderTypeTriangleSkewSpin";

/**
 *  Loader con estilo de bolitas en una disposición 3x3 con efectos de desaparición y aparición por cada bolita
 *  Vista obligatoria
 *  Tamaño personalizable. Por defecto tiene un tamaño de 50x50
 */
static const LoaderType LoaderTypeBallGridBeat = @"LoaderTypeBallGridBeat";

/**
 *  Loader con estilo de bolitas en una disposición 3x3 con efectos de crecimiento y decrecimiento individual por cada bolita
 *  Vista obligatoria
 *  Tamaño personalizable. Por defecto tiene un tamaño de 50x50
 */
static const LoaderType LoaderTypeBallGridPulse = @"LoaderTypeBallGridPulse";

/**
 *  Loader con estilo de bolitas con un efecto en zig zag
 *  Vista obligatoria
 *  Tamaño personalizable. Por defecto tiene un tamaño de 50x50
 */
static const LoaderType LoaderTypeRotatingSandglass = @"LoaderTypeRotatingSandglass";

/**
 *  Loader con estilo de tres bolas que describen la trayectoria de un triangulo imaginario
 *  Vista obligatoria
 *  Tamaño personalizable. Por defecto tiene un tamaño de 50x50
 */
static const LoaderType LoaderTypeRotatingTrigons = @"LoaderTypeRotatingTrigons";

/**
 *  Loader con estilo de triple anillo de pulsación de dentro hacia afuera
 *  Vista obligatoria
 *  Tamaño personalizable. Por defecto tiene un tamaño de 50x50
 */
static const LoaderType LoaderTypeTripleRings = @"LoaderTypeTripleRings";

/**
 *  Loader con estilo de pacman
 *  Vista obligatoria
 *  Tamaño personalizable. Por defecto tiene un tamaño de 50x50
 */
static const LoaderType LoaderTypeCookieTerminator = @"LoaderTypeCookieTerminator";

/**
 *  Loader con estilo de spinner circular de bolitas
 *  Vista obligatoria
 *  Tamaño personalizable. Por defecto tiene un tamaño de 50x50
 */
static const LoaderType LoaderTypeBallSpinFadeLoader = @"LoaderTypeBallSpinFadeLoader";

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
