//
//  LoaderManager.swift
//
//  Copyright © 2019 SDOS. All rights reserved.
//

import Foundation
import SDOSSwiftExtension
import SDOSCustomLoader
import MBProgressHUD
import M13ProgressSuite
import DGActivityIndicatorView


public class LoaderManager: NSObject {
    
    private static let shared = LoaderManager()
    private var activeLoaders = [String: LoaderObject]()
    
    private override init() { }
    
    public class func loader(loaderType: LoaderType, inView view: UIView? = nil, size: CGSize?) -> LoaderObject {
        switch loaderType {
        case .indeterminateCircular(let style):
            let loaderObject = SDOSLoaderProgress.createLoader(loaderType: loaderType, inView: view!, size: size)
            style?.apply(to: loaderObject.loaderView as? SDOSLoaderProgress)
            return loaderObject
        case .text(let style), .progressBar(let style), .progressCircular(let style):
            let loaderObject = MBProgressHUD.createLoader(loaderType: loaderType, inView: view!, size: size)
            style?.apply(to: loaderObject.loaderView as? MBProgressHUD)
            return loaderObject
        case .progressCircularWithProgress(let style):
            let loaderObject = M13ProgressViewRing.createLoader(loaderType: loaderType, inView: view!, size: size)
            style?.apply(to: loaderObject.loaderView as? M13ProgressViewRing)
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
            let loaderObject = DGActivityIndicatorView.createLoader(loaderType: loaderType, inView: view!, size: size)
            style?.apply(to: loaderObject.loaderView as? DGActivityIndicatorView)
            return loaderObject
        }
    }
    
    public class func showLoader(_ loaderObject: LoaderObject?, delay: TimeInterval = 0) {
        if let loaderObject = loaderObject {
            NSObject.cancelPreviousPerformRequests(withTarget: self, selector: #selector(_showLoader(_:)), object: loaderObject)
            self.perform(#selector(_showLoader(_:)), with: loaderObject, afterDelay: delay)
        }
    }
    
    @objc class func _showLoader(_ loaderObject: LoaderObject) {
        DispatchQueue.main.async {
            loaderObject.loaderView.show(loaderObject: loaderObject)
            shared.activeLoaders[loaderObject.uuid] = loaderObject
            
            UIView.animate(withDuration: loaderObject.timeAnimation) {
                if let disableControls = loaderObject.disableControls {
                    for control in disableControls {
                        control.isEnabled = false
                    }
                }
                if let hideViews = loaderObject.hideViews {
                    for view in hideViews {
                        view.alpha = 0
                    }
                }
                if let disableUserInteractionViews = loaderObject.disableUserInteractionViews {
                    for view in disableUserInteractionViews {
                        view.isUserInteractionEnabled = false
                    }
                }
            }
        }
    }
    
    public class func changeProgress(newValue value: Float, loaderObject: LoaderObject?) {
        if let loaderObject = loaderObject {
            DispatchQueue.main.async {
                loaderObject.loaderView.setProgress(loaderObject: loaderObject, value: value)
            }
        }
    }
    
    public class func changeText(_ text: String?, loaderObject: LoaderObject?) {
        if let loaderObject = loaderObject {
            DispatchQueue.main.async {
                loaderObject.loaderView.setText(loaderObject: loaderObject, text: text)
            }
        }
    }
    
    public class func hideLoader(_ loaderObject: LoaderObject?) {
        if let loaderObject = loaderObject {
            NSObject.cancelPreviousPerformRequests(withTarget: self, selector: #selector(_showLoader(_:)), object: loaderObject)
            
            DispatchQueue.main.async {
                loaderObject.loaderView.hide(loaderObject: loaderObject)
                shared.activeLoaders.removeValue(forKey: loaderObject.uuid)
                
                UIView.animate(withDuration: loaderObject.timeAnimation) {
                    if let disableControls = loaderObject.disableControls {
                        for control in disableControls {
                            control.isEnabled = true
                        }
                    }
                    if let hideViews = loaderObject.hideViews {
                        for view in hideViews {
                            view.alpha = 1
                        }
                    }
                    if let disableUserInteractionViews = loaderObject.disableUserInteractionViews {
                        for view in disableUserInteractionViews {
                            view.isUserInteractionEnabled = true
                        }
                    }
                }
            }
        }
    }
    
    public class func hideLoaderOfView(_ view: UIView) {
        for loaderObject in shared.activeLoaders.values {
            if view === loaderObject.view {
                hideLoader(loaderObject)
            }
        }
    }
    
    public static func loaderOfView(_ view: UIView) -> [LoaderObject]? {
        var result = [LoaderObject]()
        for loaderObject in shared.activeLoaders.values {
            if view === loaderObject.view {
                result.append(loaderObject)
            }
        }
        return result
    }
    
    public static func hideAllLoaders() {
        for loaderObject in shared.activeLoaders.values {
            hideLoader(loaderObject)
        }
    }
}
