//
//  LoaderManager.m
//
//  Copyright © 2018 SDOS. All rights reserved.
//

#undef CASE_LOADER
#undef SWITCH_LOADER
#undef DEFAULT_LOADER

#define CASE_LOADER(str)                       if ([__s__ isEqualToString:(str)])
#define SUBCASE_LOADER_START()                 if (
#define SUBCASE_LOADER(str)                    ([__s__ isEqualToString:(str)])
#define SUBCASE_LOADER_END()                   )
#define SWITCH_LOADER(s)                       for (NSString *__s__ = (s); ; )
#define DEFAULT_LOADER

#define LoaderDefaultSize CGSizeMake(50, 50)
#define LoaderDefaultLoaderText @"Cargando"

#import "LoaderManager.h"
#import "LoaderObjectPrivateInterface.h"

#import "SDOSLoaderProgress.h"
#import <MBProgressHUD/MBProgressHUD.h>
#import <M13ProgressSuite/M13ProgressViewRing.h>
#import <DGActivityIndicatorView/DGActivityIndicatorView.h>


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

+ (void) loadShowBlockWithLoaderObject:(LoaderObject *) loaderObject {
	
    UIView *loaderViewFinal;
	if ([loaderObject.loaderView isKindOfClass:[MBProgressHUD class]]) {
		MBProgressHUD *loaderView = (MBProgressHUD *)loaderObject.loaderView;
        loaderViewFinal = loaderView;
        loaderView.translatesAutoresizingMaskIntoConstraints = NO;
		[loaderObject.view addSubview:loaderView];
		[loaderView showAnimated:YES];
	} else if ([loaderObject.loaderView isKindOfClass:[M13ProgressViewRing class]]) {
		M13ProgressViewRing *loaderView = (M13ProgressViewRing *)loaderObject.loaderView;
        loaderViewFinal = loaderView;
        loaderView.translatesAutoresizingMaskIntoConstraints = NO;
		loaderView.alpha = 0;
		[loaderObject.view addSubview:loaderView];
        
		[UIView animateWithDuration:0.3 animations:^{
			loaderView.alpha = 1;
		}];
	} else if ([loaderObject.loaderView isKindOfClass:[SDOSLoaderProgress class]]) {
		SDOSLoaderProgress *loaderView = (SDOSLoaderProgress *)loaderObject.loaderView;
        loaderViewFinal = loaderView;
        loaderView.translatesAutoresizingMaskIntoConstraints = NO;
		loaderView.alpha = 0;
		[loaderObject.view addSubview:loaderView];
		[loaderView startAnimation];
		[UIView animateWithDuration:0.3 animations:^{
			loaderView.alpha = 1;
		}];
	} else if ([loaderObject.loaderView isKindOfClass:[DGActivityIndicatorView class]]) {
		DGActivityIndicatorView *loaderView = (DGActivityIndicatorView *)loaderObject.loaderView;
        loaderViewFinal = loaderView;
        loaderView.translatesAutoresizingMaskIntoConstraints = NO;
		loaderView.alpha = 0;
		[loaderObject.view addSubview:loaderView];
		[loaderView startAnimating];
		[UIView animateWithDuration:0.3 animations:^{
			loaderView.alpha = 1;
		}];
	}
    
    //Add constraints
    NSLayoutConstraint *centreHorizontallyConstraint = [NSLayoutConstraint
                                                        constraintWithItem:loaderViewFinal.superview
                                                        attribute:NSLayoutAttributeCenterX
                                                        relatedBy:NSLayoutRelationEqual
                                                        toItem:loaderViewFinal
                                                        attribute:NSLayoutAttributeCenterX
                                                        multiplier:1.0
                                                        constant:0];
    NSLayoutConstraint *centreVerticallyConstraint = [NSLayoutConstraint
                                                      constraintWithItem:loaderViewFinal.superview
                                                      attribute:NSLayoutAttributeCenterY
                                                      relatedBy:NSLayoutRelationEqual
                                                      toItem:loaderViewFinal
                                                      attribute:NSLayoutAttributeCenterY
                                                      multiplier:1.0
                                                      constant:0];
    NSLayoutConstraint *heightConstraint = [NSLayoutConstraint
                                            constraintWithItem:loaderViewFinal
                                            attribute:NSLayoutAttributeHeight
                                            relatedBy:NSLayoutRelationEqual
                                            toItem:nil
                                            attribute:NSLayoutAttributeNotAnAttribute
                                            multiplier:1.0
                                            constant:loaderViewFinal.frame.size.height];
    NSLayoutConstraint *widthConstraint = [NSLayoutConstraint
                                           constraintWithItem:loaderViewFinal
                                           attribute:NSLayoutAttributeWidth
                                           relatedBy:NSLayoutRelationEqual
                                           toItem:nil
                                           attribute:NSLayoutAttributeNotAnAttribute
                                           multiplier:1.0
                                           constant:loaderViewFinal.frame.size.width];
    
    [NSLayoutConstraint activateConstraints:@[centreVerticallyConstraint, centreHorizontallyConstraint, heightConstraint, widthConstraint]];
}

+ (void) loadHideBlockWithLoaderObject:(LoaderObject *) loaderObject {
	if ([loaderObject.loaderView isKindOfClass:[MBProgressHUD class]]) {
		MBProgressHUD *loaderView = (MBProgressHUD *)loaderObject.loaderView;
		[loaderView hideAnimated:YES];
	} else if ([loaderObject.loaderView isKindOfClass:[M13ProgressViewRing class]]) {
		M13ProgressViewRing *loaderView = (M13ProgressViewRing *)loaderObject.loaderView;
		[UIView animateWithDuration:0.3 animations:^{
			loaderView.alpha = 0;
		} completion:^(BOOL finished) {
			[loaderView removeFromSuperview];
		}];
	} else if ([loaderObject.loaderView isKindOfClass:[SDOSLoaderProgress class]]) {
		SDOSLoaderProgress *loaderView = (SDOSLoaderProgress *)loaderObject.loaderView;
		[UIView animateWithDuration:0.3 animations:^{
			loaderView.alpha = 0;
		} completion:^(BOOL finished) {
			[loaderView stopAnimation];
			[loaderView removeFromSuperview];
		}];
	} else if ([loaderObject.loaderView isKindOfClass:[DGActivityIndicatorView class]]) {
		DGActivityIndicatorView *loaderView = (DGActivityIndicatorView *)loaderObject.loaderView;
		[UIView animateWithDuration:0.3 animations:^{
			loaderView.alpha = 0;
		} completion:^(BOOL finished) {
			[loaderView stopAnimating];
			[loaderView removeFromSuperview];
		}];
	}
}

+ (void) loadChangeTextBlockWithLoaderObject:(LoaderObject *) loaderObject loaderText:(NSString *) loaderText{
	if ([loaderObject.loaderView isKindOfClass:[MBProgressHUD class]]) {
		MBProgressHUD *loaderView = (MBProgressHUD *)loaderObject.loaderView;
		loaderView.label.text = loaderText;
	}
}

+ (void) loadChangeProgressBlockWithLoaderObject:(LoaderObject *) loaderObject progress:(CGFloat) progress {
	if ([loaderObject.loaderView isKindOfClass:[MBProgressHUD class]]) {
		MBProgressHUD *loaderView = (MBProgressHUD *)loaderObject.loaderView;
		[loaderView setProgress:progress];
	} else if ([loaderObject.loaderView isKindOfClass:[M13ProgressViewRing class]]) {
		M13ProgressViewRing *loaderView = (M13ProgressViewRing *)loaderObject.loaderView;
		[loaderView setProgress:progress animated:YES];
	}
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
				[self.class loadShowBlockWithLoaderObject:loaderObject];
            };
            
            //Bloque para ocultar
            loaderObject.hideBlock = ^(LoaderObject *loaderObject){
                [self.class loadHideBlockWithLoaderObject:loaderObject];
            };
            
            //Bloque para modificar el texto
            loaderObject.changeTextBlock = ^(LoaderObject *loaderObject, NSString *loaderText){
                [self.class loadChangeTextBlockWithLoaderObject:loaderObject loaderText:loaderText];
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
				[self.class loadShowBlockWithLoaderObject:loaderObject];
			};
			
			//Bloque para ocultar
			loaderObject.hideBlock = ^(LoaderObject *loaderObject){
				[self.class loadHideBlockWithLoaderObject:loaderObject];
			};
			
			//Bloque para modificar el texto
			loaderObject.changeTextBlock = ^(LoaderObject *loaderObject, NSString *loaderText){
				[self.class loadChangeTextBlockWithLoaderObject:loaderObject loaderText:loaderText];
			};
			
            //Bloque para modficar el progreso
            loaderObject.changeProgressBlock = ^(LoaderObject *loaderObject, CGFloat progress){
				[self.class loadChangeProgressBlockWithLoaderObject:loaderObject progress:progress];
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
				[self.class loadShowBlockWithLoaderObject:loaderObject];
			};
			
			//Bloque para ocultar
			loaderObject.hideBlock = ^(LoaderObject *loaderObject){
				[self.class loadHideBlockWithLoaderObject:loaderObject];
			};
			
			//Bloque para modificar el texto
			loaderObject.changeTextBlock = ^(LoaderObject *loaderObject, NSString *loaderText){
				[self.class loadChangeTextBlockWithLoaderObject:loaderObject loaderText:loaderText];
			};
			
			//Bloque para modficar el progreso
			loaderObject.changeProgressBlock = ^(LoaderObject *loaderObject, CGFloat progress){
				[self.class loadChangeProgressBlockWithLoaderObject:loaderObject progress:progress];
			};
            break;
        }
        CASE_LOADER (LoaderTypeProgressCircularWithProgress) {
            //Inicialización
            NSAssert((view), @"Es necesario un view para este tipo de loader");
            CGRect frame;
            if (CGSizeEqualToSize(size, CGSizeZero)) {
                frame = CGRectMake(0, 0, LoaderDefaultSize.width, LoaderDefaultSize.height);
            } else {
                frame = CGRectMake(0, 0, size.width, size.height);
            }
            
            NSLog(@"Loader \"%@\" con tamaño: %@", loaderType, NSStringFromCGSize(frame.size));
            
            M13ProgressViewRing *ring = [[M13ProgressViewRing alloc] initWithFrame:frame];
            ring.center = CGPointMake(view.frame.size.width / 2, view.frame.size.height / 2);
            
            loaderView = (id<GenericLoaderCustomizationProtocol>)ring;
			
			//Bloque para mostrar
			loaderObject.showBlock = ^(LoaderObject *loaderObject){
				[self.class loadShowBlockWithLoaderObject:loaderObject];
			};
			
			//Bloque para ocultar
			loaderObject.hideBlock = ^(LoaderObject *loaderObject){
				[self.class loadHideBlockWithLoaderObject:loaderObject];
			};
			
			//Bloque para modficar el progreso
			loaderObject.changeProgressBlock = ^(LoaderObject *loaderObject, CGFloat progress){
				[self.class loadChangeProgressBlockWithLoaderObject:loaderObject progress:progress];
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
            
            SDOSLoaderProgress *mdProgress = [[SDOSLoaderProgress alloc] initWithFrame:frame type:Indeterminate];
            mdProgress.progressStyle = Circular;
            mdProgress.center = CGPointMake(view.frame.size.width / 2, view.frame.size.height / 2);
            mdProgress.circularProgressDiameter = mdProgress.frame.size.width;
            
            //Asignación del loader
            loaderView = (id<GenericLoaderCustomizationProtocol>) mdProgress;
			
			//Bloque para mostrar
			loaderObject.showBlock = ^(LoaderObject *loaderObject){
				[self.class loadShowBlockWithLoaderObject:loaderObject];
			};
			
			//Bloque para ocultar
			loaderObject.hideBlock = ^(LoaderObject *loaderObject){
				[self.class loadHideBlockWithLoaderObject:loaderObject];
			};
			
            break;
        }
		SUBCASE_LOADER_START()
        SUBCASE_LOADER (LoaderTypeNineDots) ||
		SUBCASE_LOADER (LoaderTypeTriplePulse) ||
		SUBCASE_LOADER (LoaderTypeFiveDots) ||
		SUBCASE_LOADER (LoaderTypeRotatingSquares) ||
		SUBCASE_LOADER (LoaderTypeDoubleBounce) ||
		SUBCASE_LOADER (LoaderTypeTwoDots) ||
		SUBCASE_LOADER (LoaderTypeThreeDots) ||
		SUBCASE_LOADER (LoaderTypeBallPulse) ||
		SUBCASE_LOADER (LoaderTypeBallClipRotate) ||
		SUBCASE_LOADER (LoaderTypeBallClipRotatePulse) ||
		SUBCASE_LOADER (LoaderTypeBallClipRotateMultiple) ||
		SUBCASE_LOADER (LoaderTypeBallRotate) ||
		SUBCASE_LOADER (LoaderTypeBallZigZag) ||
		SUBCASE_LOADER (LoaderTypeBallZigZagDeflect) ||
		SUBCASE_LOADER (LoaderTypeBallTrianglePath) ||
		SUBCASE_LOADER (LoaderTypeBallScale) ||
		SUBCASE_LOADER (LoaderTypeLineScale) ||
		SUBCASE_LOADER (LoaderTypeLineScaleParty) ||
		SUBCASE_LOADER (LoaderTypeBallScaleMultiple) ||
		SUBCASE_LOADER (LoaderTypeBallPulseSync) ||
		SUBCASE_LOADER (LoaderTypeBallBeat) ||
		SUBCASE_LOADER (LoaderTypeLineScalePulseOut) ||
		SUBCASE_LOADER (LoaderTypeLineScalePulseOutRapid) ||
		SUBCASE_LOADER (LoaderTypeBallScaleRipple) ||
		SUBCASE_LOADER (LoaderTypeBallScaleRippleMultiple) ||
		SUBCASE_LOADER (LoaderTypeTriangleSkewSpin) ||
		SUBCASE_LOADER (LoaderTypeBallGridBeat) ||
		SUBCASE_LOADER (LoaderTypeBallGridPulse) ||
		SUBCASE_LOADER (LoaderTypeRotatingSandglass) ||
		SUBCASE_LOADER (LoaderTypeRotatingTrigons) ||
		SUBCASE_LOADER (LoaderTypeTripleRings) ||
		SUBCASE_LOADER (LoaderTypeCookieTerminator) ||
		SUBCASE_LOADER (LoaderTypeBallSpinFadeLoader)
		SUBCASE_LOADER_END()
		{
            NSAssert((view), @"Es necesario un view para este tipo de loader");
            
            CGRect frame;
            if (CGSizeEqualToSize(size, CGSizeZero)) {
                frame = CGRectMake(0, 0, LoaderDefaultSize.width, LoaderDefaultSize.height);
            } else {
                frame = CGRectMake(0, 0, size.width, size.height);
            }
            
            NSLog(@"Loader \"%@\" con tamaño: %@", loaderType, NSStringFromCGSize(frame.size));
            
			
			DGActivityIndicatorView *activityIndicatorView;
			SWITCH_LOADER(loaderType) {
				CASE_LOADER(LoaderTypeNineDots) {
					activityIndicatorView = [self loadDGActivityIndicatorViewWithView:view frame:frame type:DGActivityIndicatorAnimationTypeNineDots];
					break;
				}
				CASE_LOADER (LoaderTypeTriplePulse) {
					activityIndicatorView = [self loadDGActivityIndicatorViewWithView:view frame:frame type:DGActivityIndicatorAnimationTypeTriplePulse];
					break;
				}
				CASE_LOADER (LoaderTypeFiveDots) {
					activityIndicatorView = [self loadDGActivityIndicatorViewWithView:view frame:frame type:DGActivityIndicatorAnimationTypeFiveDots];
					break;
				}
				CASE_LOADER (LoaderTypeRotatingSquares) {
					activityIndicatorView = [self loadDGActivityIndicatorViewWithView:view frame:frame type:DGActivityIndicatorAnimationTypeRotatingSquares];
					break;
				}
				CASE_LOADER (LoaderTypeDoubleBounce) {
					activityIndicatorView = [self loadDGActivityIndicatorViewWithView:view frame:frame type:DGActivityIndicatorAnimationTypeDoubleBounce];
					break;
				}
				CASE_LOADER (LoaderTypeTwoDots) {
					activityIndicatorView = [self loadDGActivityIndicatorViewWithView:view frame:frame type:DGActivityIndicatorAnimationTypeTwoDots];
					break;
				}
				CASE_LOADER (LoaderTypeThreeDots) {
					activityIndicatorView = [self loadDGActivityIndicatorViewWithView:view frame:frame type:DGActivityIndicatorAnimationTypeThreeDots];
					break;
				}
				CASE_LOADER (LoaderTypeBallPulse) {
					activityIndicatorView = [self loadDGActivityIndicatorViewWithView:view frame:frame type:DGActivityIndicatorAnimationTypeBallPulse];
					break;
				}
				CASE_LOADER (LoaderTypeBallClipRotate) {
					activityIndicatorView = [self loadDGActivityIndicatorViewWithView:view frame:frame type:DGActivityIndicatorAnimationTypeBallClipRotate];
					break;
				}
				CASE_LOADER (LoaderTypeBallClipRotatePulse) {
					activityIndicatorView = [self loadDGActivityIndicatorViewWithView:view frame:frame type:DGActivityIndicatorAnimationTypeBallClipRotatePulse];
					break;
				}
				CASE_LOADER (LoaderTypeBallClipRotateMultiple) {
					activityIndicatorView = [self loadDGActivityIndicatorViewWithView:view frame:frame type:DGActivityIndicatorAnimationTypeBallClipRotateMultiple];
					break;
				}
				CASE_LOADER (LoaderTypeBallRotate) {
					activityIndicatorView = [self loadDGActivityIndicatorViewWithView:view frame:frame type:DGActivityIndicatorAnimationTypeBallRotate];
					break;
				}
				CASE_LOADER (LoaderTypeBallZigZag) {
					activityIndicatorView = [self loadDGActivityIndicatorViewWithView:view frame:frame type:DGActivityIndicatorAnimationTypeBallZigZag];
					break;
				}
				CASE_LOADER (LoaderTypeBallZigZagDeflect) {
					activityIndicatorView = [self loadDGActivityIndicatorViewWithView:view frame:frame type:DGActivityIndicatorAnimationTypeBallZigZagDeflect];
					break;
				}
				CASE_LOADER (LoaderTypeBallTrianglePath) {
					activityIndicatorView = [self loadDGActivityIndicatorViewWithView:view frame:frame type:DGActivityIndicatorAnimationTypeBallTrianglePath];
					break;
				}
				CASE_LOADER (LoaderTypeBallScale) {
					activityIndicatorView = [self loadDGActivityIndicatorViewWithView:view frame:frame type:DGActivityIndicatorAnimationTypeBallScale];
					break;
				}
				CASE_LOADER (LoaderTypeLineScale) {
					activityIndicatorView = [self loadDGActivityIndicatorViewWithView:view frame:frame type:DGActivityIndicatorAnimationTypeLineScale];
					break;
				}
				CASE_LOADER (LoaderTypeLineScaleParty) {
					activityIndicatorView = [self loadDGActivityIndicatorViewWithView:view frame:frame type:DGActivityIndicatorAnimationTypeLineScaleParty];
					break;
				}
				CASE_LOADER (LoaderTypeBallScaleMultiple) {
					activityIndicatorView = [self loadDGActivityIndicatorViewWithView:view frame:frame type:DGActivityIndicatorAnimationTypeBallScaleMultiple];
					break;
				}
				CASE_LOADER (LoaderTypeBallPulseSync) {
					activityIndicatorView = [self loadDGActivityIndicatorViewWithView:view frame:frame type:DGActivityIndicatorAnimationTypeBallPulseSync];
					break;
				}
				CASE_LOADER (LoaderTypeBallBeat) {
					activityIndicatorView = [self loadDGActivityIndicatorViewWithView:view frame:frame type:DGActivityIndicatorAnimationTypeBallBeat];
					break;
				}
				CASE_LOADER (LoaderTypeLineScalePulseOut) {
					activityIndicatorView = [self loadDGActivityIndicatorViewWithView:view frame:frame type:DGActivityIndicatorAnimationTypeLineScalePulseOut];
					break;
				}
				CASE_LOADER (LoaderTypeLineScalePulseOutRapid) {
					activityIndicatorView = [self loadDGActivityIndicatorViewWithView:view frame:frame type:DGActivityIndicatorAnimationTypeLineScalePulseOutRapid];
					break;
				}
				CASE_LOADER (LoaderTypeBallScaleRipple) {
					activityIndicatorView = [self loadDGActivityIndicatorViewWithView:view frame:frame type:DGActivityIndicatorAnimationTypeBallScaleRipple];
					break;
				}
				CASE_LOADER (LoaderTypeBallScaleRippleMultiple) {
					activityIndicatorView = [self loadDGActivityIndicatorViewWithView:view frame:frame type:DGActivityIndicatorAnimationTypeBallScaleRippleMultiple];
					break;
				}
				CASE_LOADER (LoaderTypeTriangleSkewSpin) {
					activityIndicatorView = [self loadDGActivityIndicatorViewWithView:view frame:frame type:DGActivityIndicatorAnimationTypeTriangleSkewSpin];
					break;
				}
				CASE_LOADER (LoaderTypeBallGridBeat) {
					activityIndicatorView = [self loadDGActivityIndicatorViewWithView:view frame:frame type:DGActivityIndicatorAnimationTypeBallGridBeat];
					break;
				}
				CASE_LOADER (LoaderTypeBallGridPulse) {
					activityIndicatorView = [self loadDGActivityIndicatorViewWithView:view frame:frame type:DGActivityIndicatorAnimationTypeBallGridPulse];
					break;
				}
				CASE_LOADER (LoaderTypeRotatingSandglass) {
					activityIndicatorView = [self loadDGActivityIndicatorViewWithView:view frame:frame type:DGActivityIndicatorAnimationTypeRotatingSandglass];
					break;
				}
				CASE_LOADER (LoaderTypeRotatingTrigons) {
					activityIndicatorView = [self loadDGActivityIndicatorViewWithView:view frame:frame type:DGActivityIndicatorAnimationTypeRotatingTrigons];
					break;
				}
				CASE_LOADER (LoaderTypeTripleRings) {
					activityIndicatorView = [self loadDGActivityIndicatorViewWithView:view frame:frame type:DGActivityIndicatorAnimationTypeTripleRings];
					break;
				}
				CASE_LOADER (LoaderTypeCookieTerminator) {
					activityIndicatorView = [self loadDGActivityIndicatorViewWithView:view frame:frame type:DGActivityIndicatorAnimationTypeCookieTerminator];
					break;
				}
				CASE_LOADER (LoaderTypeBallSpinFadeLoader) {
					activityIndicatorView = [self loadDGActivityIndicatorViewWithView:view frame:frame type:DGActivityIndicatorAnimationTypeBallSpinFadeLoader];
					break;
				}
			}
				
            loaderView = (id<GenericLoaderCustomizationProtocol>) activityIndicatorView;
			
			//Bloque para mostrar
			loaderObject.showBlock = ^(LoaderObject *loaderObject){
				[self.class loadShowBlockWithLoaderObject:loaderObject];
			};
			
			//Bloque para ocultar
			loaderObject.hideBlock = ^(LoaderObject *loaderObject){
				[self.class loadHideBlockWithLoaderObject:loaderObject];
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
    hud.label.text = LoaderDefaultLoaderText;
    
    return hud;
}

- (DGActivityIndicatorView *) loadDGActivityIndicatorViewWithView:(UIView *) view frame:(CGRect) frame type:(DGActivityIndicatorAnimationType) type {
	DGActivityIndicatorView *activityIndicatorView = [[DGActivityIndicatorView alloc] initWithType:type tintColor:[UIColor colorWithRed:31.0f/255.0f green:155.0f/255.0f blue:222.0f/255.0f alpha:1]];
	[activityIndicatorView setFrame:frame];
	[activityIndicatorView setSize:frame.size.height];
	
	return activityIndicatorView;
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
