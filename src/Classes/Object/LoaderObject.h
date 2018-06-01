//
//  LoaderObject.h
//
//  Copyright © 2018 SDOS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GenericLoaderCustomizationProtocol.h"

/**
 *  Enumerador para las diferentes acciones que se pueden ejecutar sobre un loader
 */
typedef NS_ENUM(NSUInteger, LoaderActionType) {
    /**
     *  Opción que indica que se va a mostrar el loader
     */
    LoaderActionShow,
    /**
     *  Opción que indica que se va a ocultar el loader
     */
    LoaderActionHide,
    /**
     *  Ocpión que indica que se va a modificar el texto del loader
     */
    LoaderActionChangeText,
    /**
     *  Opción que indica que se va a modificar el progreso del loader
     */
    LoaderActionChangeProgress
};

@class LoaderObject;

typedef void (^LoaderShowBlock)(LoaderObject *loaderObject);
typedef void (^LoaderHideBlock)(LoaderObject *loaderObject);
typedef void (^LoaderChangeProgressBlock)(LoaderObject *loaderObject, CGFloat loaderProgress);
typedef void (^LoaderChangeTextBlock)(LoaderObject *loaderObject, NSString *loaderText);
typedef void (^LoaderExecuteActionBlock)(LoaderObject *loaderObject, LoaderActionType loaderAction);

/**
 *  Este objeto es el que tiene todas las propiedades necesarias para manejar un loader
 */
@interface LoaderObject : NSObject

/**
 *  Tipo de loader
 */
@property (nonatomic, strong, readonly) NSString *loaderType;

/**
 *  Identificador del loader. Es un valor que se usa para diferenciar loaders del mismo tipo de forma única. La asignación debe ser manual
 */
@property (nonatomic, assign, readonly) NSInteger tag;

/**
 *  Tamaño del loader
 */
@property (nonatomic, assign, readonly) CGSize size;

/**
 *  Vista donde se cargará el loader
 */
@property (nonatomic, strong, readonly) UIView *view;

/**
 *  Instancia del loader que se va a mostrar
 */
@property (nonatomic, strong, readonly) id<GenericLoaderCustomizationProtocol> loaderView;

/**
 *  Elementos para deshabilitar la interacción durante la presentación del loader. userInteractionEnabled = FALSE.
 *  Cuando se oculte el loader se habilitarán
 */
@property (nonatomic, strong) NSArray<UIView *> *disableUserInteractionViews;

/**
 *  Elementos para ocultar para la presentación del loader. alpha = 0
 *  Cuando se oculte el loader se mostrarán
 */
@property (nonatomic, strong) NSArray<UIView *> *hideViews;

/**
 *  Elementos para deshabilitar para la presentación del loader. enable = FALSE
 *  Cuando se oculte el loader se habilitarán
 */
@property (nonatomic, strong) NSArray<UIControl *> *disableControls;

/**
 *  Tiempo para las animaciones asociadas a disableUserInteractionViews, hideViews, disableControls
 */
@property (nonatomic) NSTimeInterval timeAnimation;

/**
 *  Bloque usado cada vez que ocurren una serie de eventos en el loader. El bloque tiene un parámetro que indica la acción que se ha ejecutado:
 *  Show: LoaderActionShow
 *  Hide: LoaderActionHide
 *  Change Text: LoaderActionChangeText
 *  Change Progress: LoaderActionChangeProgress
 */
@property (readwrite, copy) LoaderExecuteActionBlock executeActionBlock;

@end
