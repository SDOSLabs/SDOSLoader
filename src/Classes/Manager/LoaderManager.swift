//
//  LoaderManager.swift
//
//  Copyright © 2019 SDOS. All rights reserved.
//

import Foundation
import UIKit
import SDOSSwiftExtension
import SDOSCustomLoader
import MBProgressHUD
import M13ProgressSuite
import DGActivityIndicatorView

public class LoaderManager: NSObject {
    
    private static let shared = LoaderManager()
    private var activeLoaders = [String: LoaderObject]()
    private var queueLoaders = [String: LoaderObject]()
    
    private override init() { }
    
    /// Crea un LoaderObject de un tipo especifico. El loader se centrará automáticamente en la vista indicada.
    ///
    /// - Parameters:
    ///   - loaderType: Tipo del loader a crear
    ///   - view: Vista donde se mostrará el loader
    ///   - size: Tamaño del loader
    /// - Returns: Objeto loader listo para mostrarse
    public class func loader(loaderType: LoaderType, inView view: UIView, size: CGSize?) -> LoaderObject {
        switch loaderType {
        case .indeterminateCircular(let style),
             .indeterminateLinear(let style),
             .determinateCircular(let style),
             .determinateLinear(let style):
            let loaderObject = SDOSLoaderProgress.createLoader(loaderType: loaderType, inView: view, size: size)
            style?.apply(to: loaderObject.view as? SDOSLoaderProgress)
            return loaderObject
        case .text(let style), .progressBar(let style), .progressCircular(let style):
            let loaderObject = MBProgressHUD.createLoader(loaderType: loaderType, inView: view, size: size)
            style?.apply(to: loaderObject.view as? MBProgressHUD)
            return loaderObject
        case .progressCircularWithProgress(let style):
            let loaderObject = M13ProgressViewRing.createLoader(loaderType: loaderType, inView: view, size: size)
            style?.apply(to: loaderObject.view as? M13ProgressViewRing)
            return loaderObject
        case .nineDots(let style),
            .triplePulse(let style),
            .fiveDots(let style),
            .rotatingSquares(let style),
            .doubleBounce(let style),
            .twoDots(let style),
            .threeDots(let style),
            .ballPulse(let style),
            .ballClipRotate(let style),
            .ballClipRotatePulse(let style),
            .ballClipRotateMultiple(let style),
            .ballRotate(let style),
            .ballZigZag(let style),
            .ballZigZagDeflect(let style),
            .ballTrianglePath(let style),
            .ballScale(let style),
            .lineScale(let style),
            .lineScaleParty(let style),
            .ballScaleMultiple(let style),
            .ballPulseSync(let style),
            .ballBeat(let style),
            .lineScalePulseOut(let style),
            .lineScalePulseOutRapid(let style),
            .ballScaleRipple(let style),
            .ballScaleRippleMultiple(let style),
            .triangleSkewSpin(let style),
            .ballGridBeat(let style),
            .ballGridPulse(let style),
            .rotatingSandglass(let style),
            .rotatingTrigons(let style),
            .tripleRings(let style),
            .cookieTerminator(let style),
            .ballSpinFadeLoader(let style):
            let loaderObject = DGActivityIndicatorView.createLoader(loaderType: loaderType, inView: view, size: size)
            style?.apply(to: loaderObject.view as? DGActivityIndicatorView)
            return loaderObject
        }
    }
    
    /// Muestra un loader en pantalla
    ///
    /// - Parameters:
    ///   - loaderObject: Loader a mostrar
    ///   - delay: Tiempo de retraso que tardará el loader en mostrarse. Esto es útil para no mostrar el loader en llamadas a servicios muy cortas.
    public class func showLoader(_ loaderObject: LoaderObject?, delay: TimeInterval = 0) {
        if let loaderObject = loaderObject {
            loaderObject.needShowDate = Date()
            shared.queueLoaders[loaderObject.uuid] = loaderObject
            if delay > 0 {
                self.perform(#selector(_showLoader(_:)), with: loaderObject, afterDelay: delay)
            } else {
                self._showLoader(loaderObject)
            }
        }
    }
    
    @objc private class func _showLoader(_ loaderObject: LoaderObject) {
        DispatchQueue.main.async {
            guard !shared.activeLoaders.keys.contains(loaderObject.uuid) else { return }
            let needShowDateTime = loaderObject.needShowDate?.timeIntervalSince1970 ?? 0
            let lastHideDateTime = loaderObject.lastHideDate?.timeIntervalSince1970 ?? -1
            if needShowDateTime > lastHideDateTime {
                loaderObject.lastShowDate = Date()
                loaderObject._view.show(loaderObject: loaderObject)
                shared.activeLoaders[loaderObject.uuid] = loaderObject
                if shared.queueLoaders.keys.contains(loaderObject.uuid) {
                    shared.queueLoaders.removeValue(forKey: loaderObject.uuid)
                }
                
                let timeAnimation = loaderObject.startTimeAnimation ?? loaderObject.timeAnimation
                if timeAnimation <= 0 {
                    self.showControls(loaderObject)
                    loaderObject.needShowDate = nil
                } else {
                    UIView.animate(withDuration: timeAnimation) {
                        self.showControls(loaderObject)
                    } completion: { _ in
                        loaderObject.needShowDate = nil
                    }
                }
            }
        }
    }
    
    private class func showControls(_ loaderObject: LoaderObject) {
        loaderObject.disableControls?.forEach { $0.isEnabled = false }
        loaderObject.hideViews?.forEach { $0.alpha = 0 }
        loaderObject.disableUserInteractionViews?.forEach { $0.isUserInteractionEnabled = false }
    }
    
    /// Cambia el progreso del loader
    ///
    /// - Parameters:
    ///   - value: Nuevo valor para el progreso. El valor debe estar comprendido entre 0 (0%) y 1 (100%)
    ///   - loaderObject: Loader al que afectará
    public class func changeProgress(newValue value: Float, loaderObject: LoaderObject?) {
        if let loaderObject = loaderObject {
            DispatchQueue.main.async {
                loaderObject._view.setProgress(loaderObject: loaderObject, value: value)
            }
        }
    }
    
    /// Cambia el texto que se muestra en el loader
    ///
    /// - Parameters:
    ///   - text: Nuevo texto a mostrar
    ///   - loaderObject: Loader al que afectará
    public class func changeText(_ text: String?, loaderObject: LoaderObject?) {
        if let loaderObject = loaderObject {
            DispatchQueue.main.async {
                loaderObject._view.setText(loaderObject: loaderObject, text: text)
            }
        }
    }
    
    public class func hideLoader(_ loaderObject: LoaderObject?) {
        if let loaderObject = loaderObject {
            let needShowDateTime = loaderObject.needShowDate?.timeIntervalSince1970 ?? 0
            let animation = needShowDateTime + loaderObject.timeAnimation - Date().timeIntervalSince1970
            if animation > 0 {
                self.perform(#selector(_hideLoader(_:)), with: loaderObject, afterDelay: animation)
            } else {
                self._hideLoader(loaderObject)
            }
        }
    }
    
    /// Oculta el loader. Para ocultar el loader deberá haber sido mostrado previamente con el método showLoader del LoaderManager
    ///
    /// - Parameter loaderObject: Loader a ocultar
    @objc private class func _hideLoader(_ loaderObject: LoaderObject?) {
        if let loaderObject = loaderObject {
            NSObject.cancelPreviousPerformRequests(withTarget: self, selector: #selector(_showLoader(_:)), object: loaderObject)
            
            DispatchQueue.main.async {
                loaderObject.lastHideDate = Date()
                if shared.activeLoaders.keys.contains(loaderObject.uuid) {
                    loaderObject._view.hide(loaderObject: loaderObject)
                    shared.activeLoaders.removeValue(forKey: loaderObject.uuid)
                }
                let timeAnimation = loaderObject.finishTimeAnimation ?? loaderObject.timeAnimation
                if timeAnimation <= 0 {
                    self.hideControls(loaderObject)
                } else {
                    UIView.animate(withDuration: timeAnimation) {
                        self.hideControls(loaderObject)
                    }
                }
            }
        }
    }
    
    private class func hideControls(_ loaderObject: LoaderObject) {
        loaderObject.disableControls?.forEach { $0.isEnabled = true }
        loaderObject.hideViews?.forEach { $0.alpha = 1 }
        loaderObject.disableUserInteractionViews?.forEach { $0.isUserInteractionEnabled = true }
    }
    
    /// Oculta todos los loader de la vista indicada
    ///
    /// - Parameter view: Vista de la que se deberán ocultar los loaders
    public class func hideLoaderOfView(_ view: UIView) {
        for loaderObject in shared.activeLoaders.values {
            if view === loaderObject.parentView {
                hideLoader(loaderObject)
            }
        }
        
        for loaderObject in shared.queueLoaders.values {
            if view === loaderObject.parentView {
                hideLoader(loaderObject)
            }
        }
    }
    
    /// Devuelve todos los loaders de la vista indicada
    ///
    /// - Parameter view: Vista de que contiene los loaders
    /// - Returns: Array con todos los loaders asociados a la vista
    public static func loaderOfView(_ view: UIView) -> [LoaderObject]? {
        var result = [LoaderObject]()
        for loaderObject in shared.activeLoaders.values {
            if view === loaderObject.parentView {
                result.append(loaderObject)
            }
        }
        for loaderObject in shared.queueLoaders.values {
            if view === loaderObject.parentView {
                result.append(loaderObject)
            }
        }
        return result
    }
    
    /// Oculta todos los loaders mostrados con el LoaderManager
    public static func hideAllLoaders() {
        for loaderObject in shared.activeLoaders.values {
            hideLoader(loaderObject)
        }
        for loaderObject in shared.queueLoaders.values {
            hideLoader(loaderObject)
        }
    }
}
