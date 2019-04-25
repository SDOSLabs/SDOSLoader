//
//  LoaderTypes.swift
//  DGActivityIndicatorView
//
//  Created by Rafael Fernandez Alvarez on 25/04/2019.
//

import Foundation
import SDOSSwiftExtension
import SDOSCustomLoader
import MBProgressHUD
import M13ProgressSuite
import DGActivityIndicatorView

public enum LoaderType {
    /**
     *  Loader simple con texto.
     *  Vista obligatoria
     */
    case text(_ style: Style<MBProgressHUD>?)
    
    /**
     *  Loader simple con texto y barra de progreso
     *  Vista obligatoria
     */
    case progressBar(_ style: Style<MBProgressHUD>?)
    
    /**
     *  Loader simple con texto y anillo de progreso
     *  Vista obligatoria
     */
    case progressCircular(_ style: Style<MBProgressHUD>?)
    
    /**
     *  Loader con anillo de progreso y texto automática del progreso
     *  Vista obligatoria
     *  Tamaño personalizable. Por defecto tiene un tamaño de 50x50
     */
    case progressCircularWithProgress(_ style: Style<SDOSLoaderProgress>?)
    
    /**
     *  Loader de estilo Circular de Material Design.
     *  Vista obligatoria
     *  Tamaño personalizable. Por defecto tiene un tamaño de 50x50
     */
    case indeterminateCircular(_ style: Style<SDOSLoaderProgress>?)
    
    /**
     *  Loader con estilo de bolitas en una disposición 3x3 con efectos de crecimiento y decrecimiento individual por cada bolita
     *  Vista obligatoria
     *  Tamaño personalizable. Por defecto tiene un tamaño de 50x50
     */
    case nineDots(_ style: Style<SDOSLoaderProgress>?)
    
    /**
     *  Loader con estilo de triple pulsación de dentro hacia afuera con difuminado conforme llega al crecimiento máximo
     *  Vista obligatoria
     *  Tamaño personalizable. Por defecto tiene un tamaño de 50x50
     */
    case triplePulse(_ style: Style<SDOSLoaderProgress>?)
    
    /**
     *  Loader con estilo de bolitas en una disposición de 3 arriba y 2 abajo, con movimiento vertical entre ellas
     *  Vista obligatoria
     *  Tamaño personalizable. Por defecto tiene un tamaño de 50x50
     */
    case fiveDots(_ style: Style<SDOSLoaderProgress>?)
    
    /**
     *  Loader con estilo de cuadrados que se mueven formando un cuadrado imaginario y cambiando el tamaño de los cuadrados
     *  Vista obligatoria
     *  Tamaño personalizable. Por defecto tiene un tamaño de 50x50
     */
    case rotatingSquares(_ style: Style<SDOSLoaderProgress>?)
    
    /**
     *  Loader con estilo de dos bolas que crecen y decrecen de forma alternada sobre el mismo centro
     *  Vista obligatoria
     *  Tamaño personalizable. Por defecto tiene un tamaño de 50x50
     */
    case doubleBounce(_ style: Style<SDOSLoaderProgress>?)
    
    /**
     *  Loader con estilo de dos bolas que crecen y decrecen de forma alternada sobre diferentes centros
     *  Vista obligatoria
     *  Tamaño personalizable. Por defecto tiene un tamaño de 50x50
     */
    case twoDots(_ style: Style<SDOSLoaderProgress>?)
    
    /**
     *  Loader con estilo de tres bolas que crecen y decrecen de forma al mismo tiempo sobre diferentes centros
     *  Vista obligatoria
     *  Tamaño personalizable. Por defecto tiene un tamaño de 50x50
     */
    case threeDots(_ style: Style<SDOSLoaderProgress>?)
    
    /**
     *  Loader con estilo de tres bolas que crecen y decrecen de forma alternada sobre diferentes centros
     *  Vista obligatoria
     *  Tamaño personalizable. Por defecto tiene un tamaño de 50x50
     */
    case ballPulse(_ style: Style<SDOSLoaderProgress>?)
    
    /**
     *  Loader con estilo de anillo que crece y decrece
     *  Vista obligatoria
     *  Tamaño personalizable. Por defecto tiene un tamaño de 50x50
     */
    case ballClipRotate(_ style: Style<SDOSLoaderProgress>?)
    
    /**
     *  Loader con estilo de semianillo que crece y decrece con una bola en la parte central
     *  Vista obligatoria
     *  Tamaño personalizable. Por defecto tiene un tamaño de 50x50
     */
    case ballClipRotatePulse(_ style: Style<SDOSLoaderProgress>?)
    
    /**
     *  Loader con estilo de seminanillo que crece y decrece, teniendo otro semi anillo que gira en el sentido opuesto
     *  Vista obligatoria
     *  Tamaño personalizable. Por defecto tiene un tamaño de 50x50
     */
    case ballClipRotateMultiple(_ style: Style<SDOSLoaderProgress>?)
    
    /**
     *  Loader con estilo de tres bolas que crecen y decrecen de forma al mismo tiempo pivotando sobre la bola central
     *  Vista obligatoria
     *  Tamaño personalizable. Por defecto tiene un tamaño de 50x50
     */
    case ballRotate(_ style: Style<SDOSLoaderProgress>?)
    
    /**
     *  Loader con estilo de dos bolas que describen una trayectoria de zig zag
     *  Vista obligatoria
     *  Tamaño personalizable. Por defecto tiene un tamaño de 50x50
     */
    case ballZigZag(_ style: Style<SDOSLoaderProgress>?)
    
    /**
     *  Loader con estilo de dos bolas que describen una trayectoria de zig zag, realizando solo la mitad de la animación
     *  Vista obligatoria
     *  Tamaño personalizable. Por defecto tiene un tamaño de 50x50
     */
    case ballZigZagDeflect(_ style: Style<SDOSLoaderProgress>?)
    
    /**
     *  Loader con estilo de tres bolas que describen la trayectoria de un triangulo imaginario
     *  Vista obligatoria
     *  Tamaño personalizable. Por defecto tiene un tamaño de 50x50
     */
    case ballTrianglePath(_ style: Style<SDOSLoaderProgress>?)
    
    /**
     *  Loader con estilo de pulsación de dentro hacia afuera con difuminado conforme llega al crecimiento máximo
     *  Vista obligatoria
     *  Tamaño personalizable. Por defecto tiene un tamaño de 50x50
     */
    case ballScale(_ style: Style<SDOSLoaderProgress>?)
    
    /**
     *  Loader con estilo de 5 líneas verticales que crecen con un efecto de ola
     *  Vista obligatoria
     *  Tamaño personalizable. Por defecto tiene un tamaño de 50x50
     */
    case lineScale(_ style: Style<SDOSLoaderProgress>?)
    
    /**
     *  Loader con estilo de 5 líneas verticales que crecen con un efecto asíncrono
     *  Vista obligatoria
     *  Tamaño personalizable. Por defecto tiene un tamaño de 50x50
     */
    case lineScaleParty(_ style: Style<SDOSLoaderProgress>?)
    
    /**
     *  Loader con estilo de multiple pulsación de dentro hacia afuera con difuminado conforme llega al crecimiento máximo
     *  Vista obligatoria
     *  Tamaño personalizable. Por defecto tiene un tamaño de 50x50
     */
    case ballScaleMultiple(_ style: Style<SDOSLoaderProgress>?)
    
    /**
     *  Loader con estilo de tres bolitas que tienen un efecto de ola
     *  Vista obligatoria
     *  Tamaño personalizable. Por defecto tiene un tamaño de 50x50
     */
    case ballPulseSync(_ style: Style<SDOSLoaderProgress>?)
    
    /**
     *  Loader con estilo de tres bolitas que tienen un efecto de desaparición y aparición
     *  Vista obligatoria
     *  Tamaño personalizable. Por defecto tiene un tamaño de 50x50
     */
    case ballBeat(_ style: Style<SDOSLoaderProgress>?)
    
    /**
     *  Loader con estilo de 5 líneas verticales que crecen con un efecto de ola de dentro a afuera
     *  Vista obligatoria
     *  Tamaño personalizable. Por defecto tiene un tamaño de 50x50
     */
    case lineScalePulseOut(_ style: Style<SDOSLoaderProgress>?)
    
    /**
     *  Loader con estilo de 5 líneas verticales que crecen con un efecto de ola de dentro a afuera
     *  Vista obligatoria
     *  Tamaño personalizable. Por defecto tiene un tamaño de 50x50
     */
    case lineScalePulseOutRapid(_ style: Style<SDOSLoaderProgress>?)
    
    /**
     *  Loader con estilo de anillo de pulsación de dentro hacia afuera
     *  Vista obligatoria
     *  Tamaño personalizable. Por defecto tiene un tamaño de 50x50
     */
    case ballScaleRipple(_ style: Style<SDOSLoaderProgress>?)
    
    /**
     *  Loader con estilo de triple anillo de pulsación de dentro hacia afuera
     *  Vista obligatoria
     *  Tamaño personalizable. Por defecto tiene un tamaño de 50x50
     */
    case ballScaleRippleMultiple(_ style: Style<SDOSLoaderProgress>?)
    
    /**
     *  Loader con estilo de triangulo
     *  Vista obligatoria
     *  Tamaño personalizable. Por defecto tiene un tamaño de 50x50
     */
    case triangleSkewSpin(_ style: Style<SDOSLoaderProgress>?)
    
    /**
     *  Loader con estilo de bolitas en una disposición 3x3 con efectos de desaparición y aparición por cada bolita
     *  Vista obligatoria
     *  Tamaño personalizable. Por defecto tiene un tamaño de 50x50
     */
    case ballGridBeat(_ style: Style<SDOSLoaderProgress>?)
    
    /**
     *  Loader con estilo de bolitas en una disposición 3x3 con efectos de crecimiento y decrecimiento individual por cada bolita
     *  Vista obligatoria
     *  Tamaño personalizable. Por defecto tiene un tamaño de 50x50
     */
    case ballGridPulse(_ style: Style<SDOSLoaderProgress>?)
    
    /**
     *  Loader con estilo de bolitas con un efecto en zig zag
     *  Vista obligatoria
     *  Tamaño personalizable. Por defecto tiene un tamaño de 50x50
     */
    case rotatingSandglass(_ style: Style<SDOSLoaderProgress>?)
    
    /**
     *  Loader con estilo de tres bolas que describen la trayectoria de un triangulo imaginario
     *  Vista obligatoria
     *  Tamaño personalizable. Por defecto tiene un tamaño de 50x50
     */
    case rotatingTrigons(_ style: Style<SDOSLoaderProgress>?)
    
    /**
     *  Loader con estilo de triple anillo de pulsación de dentro hacia afuera
     *  Vista obligatoria
     *  Tamaño personalizable. Por defecto tiene un tamaño de 50x50
     */
    case tripleRings(_ style: Style<SDOSLoaderProgress>?)
    
    /**
     *  Loader con estilo de pacman
     *  Vista obligatoria
     *  Tamaño personalizable. Por defecto tiene un tamaño de 50x50
     */
    case cookieTerminator(_ style: Style<SDOSLoaderProgress>?)
    
    /**
     *  Loader con estilo de spinner circular de bolitas
     *  Vista obligatoria
     *  Tamaño personalizable. Por defecto tiene un tamaño de 50x50
     */
    case ballSpinFadeLoader(_ style: Style<SDOSLoaderProgress>?)
}
