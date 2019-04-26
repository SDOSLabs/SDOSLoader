//
//  ProjectLoaderManager.swift
//  SDOSLoaderSample
//
//  Created by Rafael Fernandez Alvarez on 26/04/2019.
//  Copyright © 2019 SDOS. All rights reserved.
//

import Foundation
import SDOSLoader

@objc class ProjectLoaderManager: NSObject {
    
    var loaderObject: LoaderObject?
    
    @objc func isShowing() -> Bool {
        return loaderObject == nil ? false : true
    }
    
    @objc func showLoader(type: String, view: UIView, size: CGSize, text: String?, disable: [UIView]?, applyStyle: Bool) {
        var loaderType: LoaderType?
        
        if type == LoaderTypeText {
            loaderType = .text((applyStyle) ? LoaderObject.style.styleMBProgressHUDText : nil)
        } else if type == LoaderTypeProgressBar {
            loaderType = .progressBar((applyStyle) ? LoaderObject.style.styleMBProgressHUDBar : nil)
        } else if type == LoaderTypeProgressCircular {
            loaderType = .progressCircular((applyStyle) ? LoaderObject.style.styleMBProgressHUDCircular : nil)
        } else if type == LoaderTypeProgressCircularWithProgress {
            loaderType = .progressCircularWithProgress((applyStyle) ? LoaderObject.style.styleM13ProgressViewRing : nil)
        } else if type == LoaderTypeIndeterminateCircular {
            loaderType = .indeterminateCircular((applyStyle) ? LoaderObject.style.styleSDOSLoaderProgress : nil)
        } else if type == LoaderTypeNineDots {
            loaderType = .nineDots((applyStyle) ? LoaderObject.style.styleDGActivityIndicatorView : nil)
        } else if type == LoaderTypeTriplePulse {
            loaderType = .triplePulse((applyStyle) ? LoaderObject.style.styleDGActivityIndicatorView : nil)
        } else if type == LoaderTypeFiveDots {
            loaderType = .fiveDots((applyStyle) ? LoaderObject.style.styleDGActivityIndicatorView : nil)
        } else if type == LoaderTypeRotatingSquares {
            loaderType = .rotatingSquares((applyStyle) ? LoaderObject.style.styleDGActivityIndicatorView : nil)
        } else if type == LoaderTypeDoubleBounce {
            loaderType = .doubleBounce((applyStyle) ? LoaderObject.style.styleDGActivityIndicatorView : nil)
        } else if type == LoaderTypeTwoDots {
            loaderType = .twoDots((applyStyle) ? LoaderObject.style.styleDGActivityIndicatorView : nil)
        } else if type == LoaderTypeThreeDots {
            loaderType = .threeDots((applyStyle) ? LoaderObject.style.styleDGActivityIndicatorView : nil)
        } else if type == LoaderTypeBallPulse {
            loaderType = .ballPulse((applyStyle) ? LoaderObject.style.styleDGActivityIndicatorView : nil)
        } else if type == LoaderTypeBallClipRotate {
            loaderType = .ballClipRotate((applyStyle) ? LoaderObject.style.styleDGActivityIndicatorView : nil)
        } else if type == LoaderTypeBallClipRotatePulse {
            loaderType = .ballClipRotatePulse((applyStyle) ? LoaderObject.style.styleDGActivityIndicatorView : nil)
        } else if type == LoaderTypeBallClipRotateMultiple {
            loaderType = .ballClipRotateMultiple((applyStyle) ? LoaderObject.style.styleDGActivityIndicatorView : nil)
        } else if type == LoaderTypeBallRotate {
            loaderType = .ballRotate((applyStyle) ? LoaderObject.style.styleDGActivityIndicatorView : nil)
        } else if type == LoaderTypeBallZigZag {
            loaderType = .ballZigZag((applyStyle) ? LoaderObject.style.styleDGActivityIndicatorView : nil)
        } else if type == LoaderTypeBallZigZagDeflect {
            loaderType = .ballZigZagDeflect((applyStyle) ? LoaderObject.style.styleDGActivityIndicatorView : nil)
        } else if type == LoaderTypeBallTrianglePath {
            loaderType = .ballTrianglePath((applyStyle) ? LoaderObject.style.styleDGActivityIndicatorView : nil)
        } else if type == LoaderTypeBallScale {
            loaderType = .ballScale((applyStyle) ? LoaderObject.style.styleDGActivityIndicatorView : nil)
        } else if type == LoaderTypeLineScale {
            loaderType = .lineScale((applyStyle) ? LoaderObject.style.styleDGActivityIndicatorView : nil)
        } else if type == LoaderTypeLineScaleParty {
            loaderType = .lineScaleParty((applyStyle) ? LoaderObject.style.styleDGActivityIndicatorView : nil)
        } else if type == LoaderTypeBallScaleMultiple {
            loaderType = .ballScaleMultiple((applyStyle) ? LoaderObject.style.styleDGActivityIndicatorView : nil)
        } else if type == LoaderTypeBallPulseSync {
            loaderType = .ballPulseSync((applyStyle) ? LoaderObject.style.styleDGActivityIndicatorView : nil)
        } else if type == LoaderTypeBallBeat {
            loaderType = .ballBeat((applyStyle) ? LoaderObject.style.styleDGActivityIndicatorView : nil)
        } else if type == LoaderTypeLineScalePulseOut {
            loaderType = .lineScalePulseOut((applyStyle) ? LoaderObject.style.styleDGActivityIndicatorView : nil)
        } else if type == LoaderTypeLineScalePulseOutRapid {
            loaderType = .lineScalePulseOutRapid((applyStyle) ? LoaderObject.style.styleDGActivityIndicatorView : nil)
        } else if type == LoaderTypeBallScaleRipple {
            loaderType = .ballScaleRipple((applyStyle) ? LoaderObject.style.styleDGActivityIndicatorView : nil)
        } else if type == LoaderTypeBallScaleRippleMultiple {
            loaderType = .ballScaleRippleMultiple((applyStyle) ? LoaderObject.style.styleDGActivityIndicatorView : nil)
        } else if type == LoaderTypeTriangleSkewSpin {
            loaderType = .triangleSkewSpin((applyStyle) ? LoaderObject.style.styleDGActivityIndicatorView : nil)
        } else if type == LoaderTypeBallGridBeat {
            loaderType = .ballGridBeat((applyStyle) ? LoaderObject.style.styleDGActivityIndicatorView : nil)
        } else if type == LoaderTypeBallGridPulse {
            loaderType = .ballGridPulse((applyStyle) ? LoaderObject.style.styleDGActivityIndicatorView : nil)
        } else if type == LoaderTypeRotatingSandglass {
            loaderType = .rotatingSandglass((applyStyle) ? LoaderObject.style.styleDGActivityIndicatorView : nil)
        } else if type == LoaderTypeRotatingTrigons {
            loaderType = .rotatingTrigons((applyStyle) ? LoaderObject.style.styleDGActivityIndicatorView : nil)
        } else if type == LoaderTypeTripleRings {
            loaderType = .tripleRings((applyStyle) ? LoaderObject.style.styleDGActivityIndicatorView : nil)
        } else if type == LoaderTypeCookieTerminator {
            loaderType = .cookieTerminator((applyStyle) ? LoaderObject.style.styleDGActivityIndicatorView : nil)
        } else if type == LoaderTypeBallSpinFadeLoader {
            loaderType = .ballSpinFadeLoader((applyStyle) ? LoaderObject.style.styleDGActivityIndicatorView : nil)
        }
        if let loaderType = loaderType {
            loaderObject = LoaderManager.loader(loaderType: loaderType, inView: view, size: size)
            LoaderManager.changeText(text, loaderObject: loaderObject)
            LoaderManager.showLoader(loaderObject)
        }
    }
    
    @objc func setProgress(value: Float) {
        LoaderManager.changeProgress(newValue: value, loaderObject: loaderObject)
    }
    
    @objc func hideLoader() {
        LoaderManager.hideLoader(loaderObject)
        loaderObject = nil
    }
    
}
