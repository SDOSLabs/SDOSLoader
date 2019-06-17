//
//  Loader+DGActivityIndicatorView.swift
//
//  Copyright © 2019 SDOS. All rights reserved.
//

import Foundation
import DGActivityIndicatorView

extension DGActivityIndicatorView: Loadable, FixConstraints {
    public static func createLoader(loaderType: LoaderType, inView view: UIView, size: CGSize?) -> LoaderObject {
        let realSize: CGSize
        if let size = size {
            realSize = size
        } else {
            realSize = CGSize(width: 100, height: 100)
        }
        let frame = CGRect(x: 0, y: 0, width: realSize.width, height: realSize.height);
        
        let type: DGActivityIndicatorAnimationType
        switch loaderType {
        case .nineDots(_):
            type = .nineDots
        case .triplePulse(_):
            type = .triplePulse
        case .fiveDots(_):
            type = .fiveDots
        case .rotatingSquares(_):
            type = .rotatingSquares
        case .doubleBounce(_):
            type = .doubleBounce
        case .twoDots(_):
            type = .twoDots
        case .threeDots(_):
            type = .threeDots
        case .ballPulse(_):
            type = .ballPulse
        case .ballClipRotate(_):
            type = .ballClipRotate
        case .ballClipRotatePulse(_):
            type = .ballClipRotatePulse
        case .ballClipRotateMultiple(_):
            type = .ballClipRotateMultiple
        case .ballRotate(_):
            type = .ballRotate
        case .ballZigZag(_):
            type = .ballZigZag
        case .ballZigZagDeflect(_):
            type = .ballZigZagDeflect
        case .ballTrianglePath(_):
            type = .ballTrianglePath
        case .ballScale(_):
            type = .ballScale
        case .lineScale(_):
            type = .lineScale
        case .lineScaleParty(_):
            type = .lineScaleParty
        case .ballScaleMultiple(_):
            type = .ballScaleMultiple
        case .ballPulseSync(_):
            type = .ballPulseSync
        case .ballBeat(_):
            type = .ballBeat
        case .lineScalePulseOut(_):
            type = .lineScalePulseOut
        case .lineScalePulseOutRapid(_):
            type = .lineScalePulseOutRapid
        case .ballScaleRipple(_):
            type = .ballScaleRipple
        case .ballScaleRippleMultiple(_):
            type = .ballScaleRippleMultiple
        case .triangleSkewSpin(_):
            type = .triangleSkewSpin
        case .ballGridBeat(_):
            type = .ballGridBeat
        case .ballGridPulse(_):
            type = .ballGridPulse
        case .rotatingSandglass(_):
            type = .rotatingSandglass
        case .rotatingTrigons(_):
            type = .rotatingTrigons
        case .tripleRings(_):
            type = .tripleRings
        case .cookieTerminator(_):
            type = .cookieTerminator
        case .ballSpinFadeLoader(_):
            type = .ballSpinFadeLoader
        default:
            type = .nineDots
        }
        let loader = DGActivityIndicatorView(type: type, tintColor: UIColor(red: 31.0/255.0, green: 155.0/255.0, blue: 222.0/255.0, alpha: 1), size: realSize.height)
        loader?.frame = frame
        
        let loaderObject = LoaderObject(loaderType: loaderType, parentView: view, loaderView: loader!)
        return loaderObject
    }
    
    public func show(loaderObject: LoaderObject) {
        guard let parentView = loaderObject.parentView else {
            return
        }
        
        self.translatesAutoresizingMaskIntoConstraints = false
        self.alpha = 0
        parentView.addSubview(self)
        makeConstraints(to: parentView)
        self.startAnimating()
        UIView.animate(withDuration: 0.3, animations: {
            self.alpha = 1
        })
        
    }
    
    public func setProgress(loaderObject: LoaderObject, value: Float) {
        print("Not support")
    }
    
    public func setText(loaderObject: LoaderObject, text: String?) {
        print("Not support")
    }
    
    public func hide(loaderObject: LoaderObject) {
        UIView.animate(withDuration: 0.3, animations: {
            self.alpha = 0
        }) { (finished) in
            self.stopAnimating()
            self.removeFromSuperview()
        }
    }
}
