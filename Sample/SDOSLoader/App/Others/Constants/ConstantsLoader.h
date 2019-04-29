//
//  ConstantsLoader.h
//  SDOSLoader
//
//  Created by Antonio Jesús Pallares on 7/11/16.
//  Copyright © 2016 SDOS. All rights reserved.
//

#define LOADER_TAG_CUSTOMIZED_LOADER 1
#define LOADER_TAG_DEFAULT_APPEARANCE_LOADER 0


/**
 *  Loader simple con texto.
 *  Vista obligatoria
 */
static const NSString * LoaderTypeText = @"LoaderTypeText";

/**
 *  Loader simple con texto y barra de progreso
 *  Vista obligatoria
 */
static const NSString * LoaderTypeProgressBar = @"LoaderTypeProgressBar";

/**
 *  Loader simple con texto y anillo de progreso
 *  Vista obligatoria
 */
static const NSString * LoaderTypeProgressCircular = @"LoaderTypeProgressCircular";

/**
 *  Loader con anillo de progreso y texto automática del progreso
 *  Vista obligatoria
 *  Tamaño personalizable. Por defecto tiene un tamaño de 50x50
 */
static const NSString * LoaderTypeProgressCircularWithProgress = @"LoaderTypeProgressCircularWithProgress";

/**
 *  Loader de estilo Circular de Material Design.
 *  Vista obligatoria
 *  Tamaño personalizable. Por defecto tiene un tamaño de 50x50
 */
static const NSString * LoaderTypeIndeterminateCircular = @"LoaderTypeIndeterminateCircular";


static const NSString * LoaderTypeIndeterminateLinear = @"LoaderTypeIndeterminateLinear";
static const NSString * LoaderTypeDeterminateCircular = @"LoaderTypeDeterminateCircular";
static const NSString * LoaderTypeDeterminateLinear = @"LoaderTypeDeterminateLinear";

/**
 *  Loader con estilo de bolitas en una disposición 3x3 con efectos de crecimiento y decrecimiento individual por cada bolita
 *  Vista obligatoria
 *  Tamaño personalizable. Por defecto tiene un tamaño de 50x50
 */
static const NSString * LoaderTypeNineDots = @"LoaderTypeNineDots";

/**
 *  Loader con estilo de triple pulsación de dentro hacia afuera con difuminado conforme llega al crecimiento máximo
 *  Vista obligatoria
 *  Tamaño personalizable. Por defecto tiene un tamaño de 50x50
 */
static const NSString * LoaderTypeTriplePulse = @"LoaderTypeTriplePulse";

/**
 *  Loader con estilo de bolitas en una disposición de 3 arriba y 2 abajo, con movimiento vertical entre ellas
 *  Vista obligatoria
 *  Tamaño personalizable. Por defecto tiene un tamaño de 50x50
 */
static const NSString * LoaderTypeFiveDots = @"LoaderTypeFiveDots";

/**
 *  Loader con estilo de cuadrados que se mueven formando un cuadrado imaginario y cambiando el tamaño de los cuadrados
 *  Vista obligatoria
 *  Tamaño personalizable. Por defecto tiene un tamaño de 50x50
 */
static const NSString * LoaderTypeRotatingSquares = @"LoaderTypeRotatingSquares";

/**
 *  Loader con estilo de dos bolas que crecen y decrecen de forma alternada sobre el mismo centro
 *  Vista obligatoria
 *  Tamaño personalizable. Por defecto tiene un tamaño de 50x50
 */
static const NSString * LoaderTypeDoubleBounce = @"LoaderTypeDoubleBounce";

/**
 *  Loader con estilo de dos bolas que crecen y decrecen de forma alternada sobre diferentes centros
 *  Vista obligatoria
 *  Tamaño personalizable. Por defecto tiene un tamaño de 50x50
 */
static const NSString * LoaderTypeTwoDots = @"LoaderTypeTwoDots";

/**
 *  Loader con estilo de tres bolas que crecen y decrecen de forma al mismo tiempo sobre diferentes centros
 *  Vista obligatoria
 *  Tamaño personalizable. Por defecto tiene un tamaño de 50x50
 */
static const NSString * LoaderTypeThreeDots = @"LoaderTypeThreeDots";

/**
 *  Loader con estilo de tres bolas que crecen y decrecen de forma alternada sobre diferentes centros
 *  Vista obligatoria
 *  Tamaño personalizable. Por defecto tiene un tamaño de 50x50
 */
static const NSString * LoaderTypeBallPulse = @"LoaderTypeBallPulse";

/**
 *  Loader con estilo de anillo que crece y decrece
 *  Vista obligatoria
 *  Tamaño personalizable. Por defecto tiene un tamaño de 50x50
 */
static const NSString * LoaderTypeBallClipRotate = @"LoaderTypeBallClipRotate";

/**
 *  Loader con estilo de semianillo que crece y decrece con una bola en la parte central
 *  Vista obligatoria
 *  Tamaño personalizable. Por defecto tiene un tamaño de 50x50
 */
static const NSString * LoaderTypeBallClipRotatePulse = @"LoaderTypeBallClipRotatePulse";

/**
 *  Loader con estilo de seminanillo que crece y decrece, teniendo otro semi anillo que gira en el sentido opuesto
 *  Vista obligatoria
 *  Tamaño personalizable. Por defecto tiene un tamaño de 50x50
 */
static const NSString * LoaderTypeBallClipRotateMultiple = @"LoaderTypeBallClipRotateMultiple";

/**
 *  Loader con estilo de tres bolas que crecen y decrecen de forma al mismo tiempo pivotando sobre la bola central
 *  Vista obligatoria
 *  Tamaño personalizable. Por defecto tiene un tamaño de 50x50
 */
static const NSString * LoaderTypeBallRotate = @"LoaderTypeBallRotate";

/**
 *  Loader con estilo de dos bolas que describen una trayectoria de zig zag
 *  Vista obligatoria
 *  Tamaño personalizable. Por defecto tiene un tamaño de 50x50
 */
static const NSString * LoaderTypeBallZigZag = @"LoaderTypeBallZigZag";

/**
 *  Loader con estilo de dos bolas que describen una trayectoria de zig zag, realizando solo la mitad de la animación
 *  Vista obligatoria
 *  Tamaño personalizable. Por defecto tiene un tamaño de 50x50
 */
static const NSString * LoaderTypeBallZigZagDeflect = @"LoaderTypeBallZigZagDeflect";

/**
 *  Loader con estilo de tres bolas que describen la trayectoria de un triangulo imaginario
 *  Vista obligatoria
 *  Tamaño personalizable. Por defecto tiene un tamaño de 50x50
 */
static const NSString * LoaderTypeBallTrianglePath = @"LoaderTypeBallTrianglePath";

/**
 *  Loader con estilo de pulsación de dentro hacia afuera con difuminado conforme llega al crecimiento máximo
 *  Vista obligatoria
 *  Tamaño personalizable. Por defecto tiene un tamaño de 50x50
 */
static const NSString * LoaderTypeBallScale = @"LoaderTypeBallScale";

/**
 *  Loader con estilo de 5 líneas verticales que crecen con un efecto de ola
 *  Vista obligatoria
 *  Tamaño personalizable. Por defecto tiene un tamaño de 50x50
 */
static const NSString * LoaderTypeLineScale = @"LoaderTypeLineScale";

/**
 *  Loader con estilo de 5 líneas verticales que crecen con un efecto asíncrono
 *  Vista obligatoria
 *  Tamaño personalizable. Por defecto tiene un tamaño de 50x50
 */
static const NSString * LoaderTypeLineScaleParty = @"LoaderTypeLineScaleParty";

/**
 *  Loader con estilo de multiple pulsación de dentro hacia afuera con difuminado conforme llega al crecimiento máximo
 *  Vista obligatoria
 *  Tamaño personalizable. Por defecto tiene un tamaño de 50x50
 */
static const NSString * LoaderTypeBallScaleMultiple = @"LoaderTypeBallScaleMultiple";

/**
 *  Loader con estilo de tres bolitas que tienen un efecto de ola
 *  Vista obligatoria
 *  Tamaño personalizable. Por defecto tiene un tamaño de 50x50
 */
static const NSString * LoaderTypeBallPulseSync = @"LoaderTypeBallPulseSync";

/**
 *  Loader con estilo de tres bolitas que tienen un efecto de desaparición y aparición
 *  Vista obligatoria
 *  Tamaño personalizable. Por defecto tiene un tamaño de 50x50
 */
static const NSString * LoaderTypeBallBeat = @"LoaderTypeBallBeat";

/**
 *  Loader con estilo de 5 líneas verticales que crecen con un efecto de ola de dentro a afuera
 *  Vista obligatoria
 *  Tamaño personalizable. Por defecto tiene un tamaño de 50x50
 */
static const NSString * LoaderTypeLineScalePulseOut = @"LoaderTypeLineScalePulseOut";

/**
 *  Loader con estilo de 5 líneas verticales que crecen con un efecto de ola de dentro a afuera
 *  Vista obligatoria
 *  Tamaño personalizable. Por defecto tiene un tamaño de 50x50
 */
static const NSString * LoaderTypeLineScalePulseOutRapid = @"LoaderTypeLineScalePulseOutRapid";

/**
 *  Loader con estilo de anillo de pulsación de dentro hacia afuera
 *  Vista obligatoria
 *  Tamaño personalizable. Por defecto tiene un tamaño de 50x50
 */
static const NSString * LoaderTypeBallScaleRipple = @"LoaderTypeBallScaleRipple";

/**
 *  Loader con estilo de triple anillo de pulsación de dentro hacia afuera
 *  Vista obligatoria
 *  Tamaño personalizable. Por defecto tiene un tamaño de 50x50
 */
static const NSString * LoaderTypeBallScaleRippleMultiple = @"LoaderTypeBallScaleRippleMultiple";

/**
 *  Loader con estilo de triangulo
 *  Vista obligatoria
 *  Tamaño personalizable. Por defecto tiene un tamaño de 50x50
 */
static const NSString * LoaderTypeTriangleSkewSpin = @"LoaderTypeTriangleSkewSpin";

/**
 *  Loader con estilo de bolitas en una disposición 3x3 con efectos de desaparición y aparición por cada bolita
 *  Vista obligatoria
 *  Tamaño personalizable. Por defecto tiene un tamaño de 50x50
 */
static const NSString * LoaderTypeBallGridBeat = @"LoaderTypeBallGridBeat";

/**
 *  Loader con estilo de bolitas en una disposición 3x3 con efectos de crecimiento y decrecimiento individual por cada bolita
 *  Vista obligatoria
 *  Tamaño personalizable. Por defecto tiene un tamaño de 50x50
 */
static const NSString * LoaderTypeBallGridPulse = @"LoaderTypeBallGridPulse";

/**
 *  Loader con estilo de bolitas con un efecto en zig zag
 *  Vista obligatoria
 *  Tamaño personalizable. Por defecto tiene un tamaño de 50x50
 */
static const NSString * LoaderTypeRotatingSandglass = @"LoaderTypeRotatingSandglass";

/**
 *  Loader con estilo de tres bolas que describen la trayectoria de un triangulo imaginario
 *  Vista obligatoria
 *  Tamaño personalizable. Por defecto tiene un tamaño de 50x50
 */
static const NSString * LoaderTypeRotatingTrigons = @"LoaderTypeRotatingTrigons";

/**
 *  Loader con estilo de triple anillo de pulsación de dentro hacia afuera
 *  Vista obligatoria
 *  Tamaño personalizable. Por defecto tiene un tamaño de 50x50
 */
static const NSString * LoaderTypeTripleRings = @"LoaderTypeTripleRings";

/**
 *  Loader con estilo de pacman
 *  Vista obligatoria
 *  Tamaño personalizable. Por defecto tiene un tamaño de 50x50
 */
static const NSString * LoaderTypeCookieTerminator = @"LoaderTypeCookieTerminator";

/**
 *  Loader con estilo de spinner circular de bolitas
 *  Vista obligatoria
 *  Tamaño personalizable. Por defecto tiene un tamaño de 50x50
 */
static const NSString * LoaderTypeBallSpinFadeLoader = @"LoaderTypeBallSpinFadeLoader";
