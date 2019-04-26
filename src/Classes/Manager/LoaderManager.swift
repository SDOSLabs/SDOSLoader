//
//  LoaderManager.swift
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


public class LoaderManager {
    
    private static let shared = LoaderManager()
    private var activeLoaders = [String: LoaderObject]()
    
    private init() { }
    
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
            loaderObject.loaderView.show(loaderObject: loaderObject, delay: delay)
            shared.activeLoaders[loaderObject.uuid] = loaderObject
        }
    }
    
    public class func changeProgress(newValue value: Float, loaderObject: LoaderObject?) {
        if let loaderObject = loaderObject {
            loaderObject.loaderView.setProgress(loaderObject: loaderObject, value: value)
        }
    }
    
    public class func changeText(_ text: String?, loaderObject: LoaderObject?) {
        if let loaderObject = loaderObject {
            loaderObject.loaderView.setText(loaderObject: loaderObject, text: text)
        }
    }
    
    public class func hideLoader(_ loaderObject: LoaderObject?) {
        if let loaderObject = loaderObject {
            loaderObject.loaderView.hide(loaderObject: loaderObject)
            shared.activeLoaders.removeValue(forKey: loaderObject.uuid)
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
