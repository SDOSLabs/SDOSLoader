//
//  LoaderFactory+BaseiOS.m
//  BaseProject
//
//  Created by Rafael Fernandez Alvarez on 24/11/15.
//  Copyright © 2015 SDOS. All rights reserved.
//
#define CASE(str)                       if ([__s__ isEqualToString:(str)])
#define SWITCH(s)                       for (NSString *__s__ = (s); ; )
#define DEFAULT

#define LoaderDefaultSize CGSizeMake(50, 50)

#import "LoaderManager+BaseiOS.h"
#import "LoaderObjectPrivateInterface.h"

static const NSString *suffix_selector = @"SDOS_";

@implementation LoaderManager (BaseiOS)

/**
 *  Intercambiamos la implementación del método de creación de nuevos loaders.
 */
//+ (void)load {
//    NSArray *arrayInstanceSelectors = @[NSStringFromSelector(@selector(loaderWithType:inView:size:tag:))];
//    
//    for (NSString *strSelector in arrayInstanceSelectors) {
//        SEL sel1 = NSSelectorFromString(strSelector);
//        SEL sel2 = NSSelectorFromString([NSString stringWithFormat:@"%@%@", suffix_selector, strSelector]);
//        method_exchangeImplementations(class_getInstanceMethod(self, sel1), class_getInstanceMethod(self, sel2));
//    }
//}

/**
 *  Al reimplementar este método tenemos que seguir el siguiente proceso:
 *  1. Intentamos crear un loader propio del proyecto
 *  2. En caso de que el loader ya este configurado desde Generic, llamamos a este mismo método, que realmente es una llamada a la implementación nativa de Generic
 */
//- (LoaderObject *) SDOS_loaderWithType:(LoaderType) loaderType inView:(UIView *) view size:(CGSize) size tag:(NSInteger)tag {
//    LoaderObject *loaderObject = [LoaderObject new];
//    id<GenericLoaderCustomizationProtocol> loaderView;
//    
//    SWITCH (loaderType) {
//        CASE (<#Nuevo tipo de loader#>) {
//            <#Inicialización del loader genérico (Función por si hay variantes del mismo loader)#>
//            
//            <#Asignación de propiedades especificas del loader#>
//            
//            //Asignación del loader
//            //loaderObject.loaderObject = (id<GenericLoaderCustomizationProtocol> *)loader;
//            
//            //Asignación de bloques
//            
//            //Bloque para mostrar
//            loaderObject.showBlock = ^(LoaderObject *loaderObject){
//                <#Funcionalidad para mostrar el loader#>
//            };
//            
//            //Bloque para ocultar
//            loaderObject.hideBlock = ^(LoaderObject *loaderObject){
//                <#Funcionalidad para ocultar el loader#>
//            };
//            
//            /*
//            //Bloque para modificar el texto
//            loaderObject.changeTextBlock = ^(LoaderObject *loaderObject, NSString *loaderText){
//                <#Funcionalidad para modificar el texto del loader#>
//            };
//            */
//            
//            /*
//            //Bloque para modficar el progreso
//            loaderObject.changeProgressBlock = ^(LoaderObject *loaderObject, CGFloat progress){
//                <#Funcionalidad para modificar el progreso del loader#>
//            };
//            */
//            break;
//        }
//        DEFAULT {
//            loaderObject = [self SDOS_loaderWithType:loaderType inView:view size:size tag:tag];
//            break;
//        }
//    }
//    //Esto indica que el loader se ha inicializado aquí
//    if (loaderView) {
//        [loaderObject setLoaderView:loaderView loaderType:loaderType view:view size:size tag:tag];
//    }
//    
//    return loaderObject;
//}

@end
