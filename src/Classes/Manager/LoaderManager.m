//
//  LoaderFactory.m
//  BaseProject
//
//  Created by Rafael Fernandez Alvarez on 23/11/15.
//  Copyright © 2015 SDOS. All rights reserved.
//

#undef CASE_LOADER
#undef SWITCH_LOADER
#undef DEFAULT_LOADER

#define CASE_LOADER(str)                       if ([__s__ isEqualToString:(str)])
#define SWITCH_LOADER(s)                       for (NSString *__s__ = (s); ; )
#define DEFAULT_LOADER

#import <SDOSLocalizableString/SDOSLocalizableString.h>

#define LoaderDefaultSize CGSizeMake(50, 50)
#define LoaderDefaultLoaderText LS(@"coreiOS.cargando")

#import "LoaderManager.h"
#import "LoaderObjectPrivateInterface.h"

#import <MBProgressHUD/MBProgressHUD.h>
//#import <SDOSMaterialControlsCustom/SDOSMDProgress.h>
#import "SDOSMDProgress.h"
#import <PureLayout/PureLayout.h>

@interface LoaderManager ()

@property (nonatomic, strong) NSMutableDictionary *activeLoaders;

@end

@implementation LoaderManager

+ (LoaderObject *) loaderWithType:(LoaderType) loaderType {
    return [self loaderWithType:loaderType inView:nil];
}

+ (LoaderObject *) loaderWithType:(LoaderType) loaderType inView:(UIView *) view {
    return [self loaderWithType:loaderType inView:view tag:0];
}

+ (LoaderObject *) loaderWithType:(LoaderType) loaderType inView:(UIView *) view size:(CGSize) size {
    return [self loaderWithType:loaderType inView:view size:size tag:0];
}

+ (LoaderObject *) loaderWithType:(LoaderType) loaderType inView:(UIView *) view tag:(NSInteger)tag {
    return [self loaderWithType:loaderType inView:view size:CGSizeZero tag:tag];
}

+ (LoaderObject *) loaderWithType:(LoaderType) loaderType inView:(UIView *) view size:(CGSize) size tag:(NSInteger)tag {
    return [[LoaderManager sharedInstance] loaderWithType:loaderType inView:view size:size tag:tag];
}

+ (void) showLoader:(LoaderObject *) loaderObject {
    [self showLoader:loaderObject withDelay:0];
}

+ (void) showLoader:(LoaderObject *) loaderObject withDelay:(NSTimeInterval) delay {
    [[LoaderManager sharedInstance] showLoader:loaderObject withDelay:delay];
}

+ (void) changeProgress:(CGFloat) loaderProgress fromLoader:(LoaderObject *) loaderObject {
    [[LoaderManager sharedInstance] changeProgress:loaderProgress fromLoader:loaderObject];
}

+ (void) changeText:(NSString *) loaderText fromLoader:(LoaderObject *) loaderObject {
    [[LoaderManager sharedInstance] changeText:loaderText fromLoader:loaderObject];
}

+ (void) hideLoader:(LoaderObject *) loaderObject {
    [[LoaderManager sharedInstance] hideLoader:loaderObject];
}

+ (void) hideLoadersOfView:(UIView *) view {
    [[LoaderManager sharedInstance] hideLoadersOfView:view];
}

+ (NSArray *) getLoadersOfView:(UIView *) view {
    return [[LoaderManager sharedInstance] getLoadersOfView:view];
}

+ (void) hideAllLoaders {
    [[LoaderManager sharedInstance] hideAllLoaders];
}

#pragma mark - Implementation

+ (LoaderManager*)sharedInstance {
    
    static LoaderManager * sharedInstance;
    if(! sharedInstance) {
        static dispatch_once_t oncePredicate;
        dispatch_once(&oncePredicate, ^{
            sharedInstance = [[LoaderManager alloc] init];
            sharedInstance.activeLoaders = [NSMutableDictionary dictionary];
        });
    }
    
    return sharedInstance;
}

- (LoaderObject *) loaderWithType:(LoaderType) loaderType inView:(UIView *) view size:(CGSize) size tag:(NSInteger)tag {
    LoaderObject *loaderObject = [LoaderObject new];
    [loaderObject setLoaderType:loaderType view:view size:size tag:tag];
    id<GenericLoaderCustomizationProtocol> loaderView;
    
    SWITCH_LOADER (loaderType) {
        CASE_LOADER (LoaderTypeText) {
            //Inicialización
            MBProgressHUD *hud = [self loadMBProgressHUD:view];
            hud.mode = MBProgressHUDModeText;
            loaderView = (MBProgressHUD<GenericLoaderCustomizationProtocol> *)hud;
            
            //Bloque para mostrar
            loaderObject.showBlock = ^(LoaderObject *loaderObject){
                MBProgressHUD *loaderView = (MBProgressHUD *)loaderObject.loaderView;
                [loaderObject.view addSubview:loaderView];
                [loaderView autoCenterInSuperview];
                [loaderView autoSetDimension:ALDimensionHeight toSize:loaderView.frame.size.height];
                [loaderView autoSetDimension:ALDimensionWidth toSize:loaderView.frame.size.width];
                [loaderView show:YES];
            };
            
            //Bloque para ocultar
            loaderObject.hideBlock = ^(LoaderObject *loaderObject){
                MBProgressHUD *loaderView = (MBProgressHUD *)loaderObject.loaderView;
                [loaderView hide:YES];
            };
            
            //Bloque para modificar el texto
            loaderObject.changeTextBlock = ^(LoaderObject *loaderObject, NSString *loaderText){
                MBProgressHUD *loaderView = (MBProgressHUD *)loaderObject.loaderView;
                loaderView.labelText = loaderText;
            };
            
            break;
        }
        CASE_LOADER (LoaderTypeProgressCircular) {
            //Inicialización
            MBProgressHUD *hud = [self loadMBProgressHUD:view];
            hud.mode = MBProgressHUDModeAnnularDeterminate;
            loaderView = (MBProgressHUD<GenericLoaderCustomizationProtocol> *)hud;
            
            //Bloque para mostrar
            loaderObject.showBlock = ^(LoaderObject *loaderObject){
                MBProgressHUD *loaderView = (MBProgressHUD *)loaderObject.loaderView;
                [loaderObject.view addSubview:loaderView];
                [loaderView autoCenterInSuperview];
                [loaderView autoSetDimension:ALDimensionHeight toSize:loaderView.frame.size.height];
                [loaderView autoSetDimension:ALDimensionWidth toSize:loaderView.frame.size.width];
                [loaderView show:YES];
            };
            
            //Bloque para ocultar
            loaderObject.hideBlock = ^(LoaderObject *loaderObject){
                MBProgressHUD *loaderView = (MBProgressHUD *)loaderObject.loaderView;
                [loaderView hide:YES];
            };
            
            //Bloque para modificar el texto
            loaderObject.changeTextBlock = ^(LoaderObject *loaderObject, NSString *loaderText){
                MBProgressHUD *loaderView = (MBProgressHUD *)loaderObject.loaderView;
                loaderView.labelText = loaderText;
            };
            
            //Bloque para modficar el progreso
            loaderObject.changeProgressBlock = ^(LoaderObject *loaderObject, CGFloat progress){
                MBProgressHUD *loaderView = (MBProgressHUD *)loaderObject.loaderView;
                [loaderView setProgress:progress];
            };
            
            break;
        }
        CASE_LOADER (LoaderTypeProgressBar) {
            //Inicialización
            MBProgressHUD *hud = [self loadMBProgressHUD:view];
            hud.mode = MBProgressHUDModeDeterminateHorizontalBar;
            loaderView = (MBProgressHUD<GenericLoaderCustomizationProtocol> *)hud;
            
            //Bloque para mostrar
            loaderObject.showBlock = ^(LoaderObject *loaderObject){
                MBProgressHUD *loaderView = (MBProgressHUD *)loaderObject.loaderView;
                [loaderObject.view addSubview:loaderView];
                [loaderView autoCenterInSuperview];
                [loaderView autoSetDimension:ALDimensionHeight toSize:loaderView.frame.size.height];
                [loaderView autoSetDimension:ALDimensionWidth toSize:loaderView.frame.size.width];
                [loaderView show:YES];
            };
            
            //Bloque para ocultar
            loaderObject.hideBlock = ^(LoaderObject *loaderObject){
                MBProgressHUD *loaderView = (MBProgressHUD *)loaderObject.loaderView;
                [loaderView hide:YES];
            };
            
            //Bloque para modificar el texto
            loaderObject.changeTextBlock = ^(LoaderObject *loaderObject, NSString *loaderText){
                MBProgressHUD *loaderView = (MBProgressHUD *)loaderObject.loaderView;
                loaderView.labelText = loaderText;
            };
            
            //Bloque para modficar el progreso
            loaderObject.changeProgressBlock = ^(LoaderObject *loaderObject, CGFloat progress){
                MBProgressHUD *loaderView = (MBProgressHUD *)loaderObject.loaderView;
                [loaderView setProgress:progress];
            };
            break;
        }
        CASE_LOADER (LoaderTypeIndeterminateCircular) {
            NSAssert((view), @"Es necesario un view para este tipo de loader");
            
            CGRect frame;
            if (CGSizeEqualToSize(size, CGSizeZero)) {
                frame = CGRectMake(0, 0, LoaderDefaultSize.width, LoaderDefaultSize.height);
            } else {
                frame = CGRectMake(0, 0, size.width, size.height);
            }
            
            NSLog(@"Loader \"%@\" con tamaño: %@", loaderType, NSStringFromCGSize(frame.size));
            
            SDOSMDProgress *mdProgress = [[SDOSMDProgress alloc] initWithFrame:frame type:Indeterminate];
            mdProgress.progressStyle = Circular;
            mdProgress.center = CGPointMake(view.frame.size.width / 2, view.frame.size.height / 2);
            mdProgress.circularProgressDiameter = mdProgress.frame.size.width;
            
            //Asignación del loader
            loaderView = (id<GenericLoaderCustomizationProtocol>) mdProgress;
            
            //Bloque para mostrar
            loaderObject.showBlock = ^(LoaderObject *loaderObject){
                SDOSMDProgress *loaderView = (SDOSMDProgress *)loaderObject.loaderView;
                loaderView.alpha = 0;
                [loaderObject.view addSubview:loaderView];
                [loaderView autoCenterInSuperview];
                [loaderView autoSetDimension:ALDimensionHeight toSize:loaderView.frame.size.height];
                [loaderView autoSetDimension:ALDimensionWidth toSize:loaderView.frame.size.width];
                [loaderView startAnimation];
                [UIView animateWithDuration:0.3 animations:^{
                    loaderView.alpha = 1;
                }];
            };
            
            //Bloque para ocultar
            loaderObject.hideBlock = ^(LoaderObject *loaderObject){
                SDOSMDProgress *loaderView = (SDOSMDProgress *)loaderObject.loaderView;
                [UIView animateWithDuration:0.3 animations:^{
                    loaderView.alpha = 0;
                } completion:^(BOOL finished) {
                    [loaderView stopAnimation];
                    [loaderView removeFromSuperview];
                }];
            };
            break;
        }
        DEFAULT_LOADER {
            NSLog(@"El loader \"%@\" no ha podico inicializarse", loaderType);
            loaderObject = nil;
            break;
        }
    }
    
    if (loaderView) {
        //Protocolo para la peronalización del estilo
        if ([loaderView respondsToSelector:@selector(loaderCustomizationInitWithType:)]) {
            [loaderView loaderCustomizationInitWithType:loaderObject.loaderType];
        }
        if ([loaderView respondsToSelector:@selector(loaderCustomizationInitWithType:tag:)]) {
            [loaderView loaderCustomizationInitWithType:loaderObject.loaderType tag:loaderObject.tag];
        }
    }
    
    if (loaderObject) {
        [loaderObject setLoaderView:loaderView];
    }
    
    return loaderObject;
}

- (MBProgressHUD *) loadMBProgressHUD:(UIView *) view {
    NSAssert((view), @"Es necesario un view para este tipo de loader");
    MBProgressHUD *hud = [[MBProgressHUD alloc] initWithView:view];
    hud.removeFromSuperViewOnHide = YES;
    hud.labelText = LoaderDefaultLoaderText;
    
    return hud;
}

- (void) _showLoader:(LoaderObject *) loaderObject {
    if (!loaderObject.showBlock) {
        NSLog(@"No se ha podido mostrar el loader porque el bloque \"showBlock\" no ha sido inicializado");
        return;
    }
    [self.activeLoaders setObject:loaderObject forKey:loaderObject.description];
    if (loaderObject.executeActionBlock) {
        NSLog(@"Ejecutando bloque \"executeActionBlock(LoaderActionShow)\"");
        loaderObject.executeActionBlock(loaderObject, LoaderActionShow);
    }
    loaderObject.showBlock(loaderObject);
    [UIView animateWithDuration:loaderObject.timeAnimation animations:^{
        for (UIControl *control in loaderObject.disableControls) {
            if ([control respondsToSelector:@selector(setEnabled:)]) {
                control.enabled = NO;
            }
        }
        for (UIView *view in loaderObject.hideViews) {
            if ([view respondsToSelector:@selector(setAlpha:)]) {
                view.alpha = 0;
            }
        }
        for (UIView *view in loaderObject.disableUserInteractionViews) {
            if ([view respondsToSelector:@selector(setUserInteractionEnabled:)]) {
                view.userInteractionEnabled = NO;
            }
        }
    }];
}

- (void) showLoader:(LoaderObject *) loaderObject withDelay:(NSTimeInterval) delay {
    if (delay == 0) {
        [self _showLoader:loaderObject];
    } else {
        [self performSelector:@selector(_showLoader:) withObject:loaderObject afterDelay:delay];
    }
}

- (void) changeProgress:(CGFloat) progress fromLoader:(LoaderObject *) loaderObject {
    if (!loaderObject.changeProgressBlock) {
        NSLog(@"No se ha podido actualizar el progreso del loader porque el bloque \"changeProgressBlock\" no ha sido inicializado");
        return;
    }
    if (loaderObject.executeActionBlock) {
        NSLog(@"Ejecutando bloque \"executeActionBlock(LoaderActionChangeProgress)\"");
        loaderObject.executeActionBlock(loaderObject, LoaderActionChangeProgress);
    }
    loaderObject.changeProgressBlock(loaderObject, progress);
}

- (void) changeText:(NSString *) loaderText fromLoader:(LoaderObject *) loaderObject {
    if (!loaderObject.changeTextBlock) {
        NSLog(@"No se ha podido actualizar el progreso del loader porque el bloque \"changeTextBlock\" no ha sido inicializado");
        return;
    }
    if (loaderObject.executeActionBlock) {
        NSLog(@"Ejecutando bloque \"executeActionBlock(LoaderActionChangeText)\"");
        loaderObject.executeActionBlock(loaderObject, LoaderActionChangeText);
    }
    loaderObject.changeTextBlock(loaderObject, loaderText);
}

- (void) hideLoader:(LoaderObject *) loaderObject {
    //Cancelamos las ejecuciones con delay si existieran
    [NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(_showLoader:) object: loaderObject];
    
    if (!loaderObject.hideBlock) {
        NSLog(@"No se ha podido ocultar el loader porque el bloque \"hideBlock\" no ha sido inicializado");
        return;
    }
    [self.activeLoaders removeObjectForKey:loaderObject.description];
    
    if (loaderObject.executeActionBlock) {
        NSLog(@"Ejecutando bloque \"executeActionBlock(LoaderActionHide)\"");
        loaderObject.executeActionBlock(loaderObject, LoaderActionHide);
    }
    loaderObject.hideBlock(loaderObject);
    [UIView animateWithDuration:loaderObject.timeAnimation animations:^{
        for (UIControl *control in loaderObject.disableControls) {
            if ([control respondsToSelector:@selector(setEnabled:)]) {
                control.enabled = YES;
            }
        }
        for (UIView *view in loaderObject.hideViews) {
            if ([view respondsToSelector:@selector(setAlpha:)]) {
                view.alpha = 1;
            }
        }
        for (UIView *view in loaderObject.disableUserInteractionViews) {
            if ([view respondsToSelector:@selector(setUserInteractionEnabled:)]) {
                view.userInteractionEnabled = YES;
            }
        }
    }];
}

- (void) hideLoadersOfView:(UIView *) view {
    for (NSString *key in [self.activeLoaders allKeys]) {
        LoaderObject *loaderObject = self.activeLoaders[key];
        if ([loaderObject.view.description isEqualToString:view.description]) {
            [LoaderManager hideLoader:loaderObject];
        }
    }
}

- (NSArray *) getLoadersOfView:(UIView *) view {
    NSMutableArray *array = [NSMutableArray array];
    for (NSString *key in [self.activeLoaders allKeys]) {
        LoaderObject *loaderObject = self.activeLoaders[key];
        if ([loaderObject.view.description isEqualToString:view.description]) {
            [array addObject:self.activeLoaders[key]];
        }
    }
    return [NSArray arrayWithArray:array];
}

- (void) hideAllLoaders {
    for (NSString *key in [self.activeLoaders allKeys]) {
        LoaderObject *loaderObject = self.activeLoaders[key];
        [LoaderManager hideLoader:loaderObject];
    }
}

@end
