//
//  Loader+SDOSLoaderProgress.swift
//
//  Copyright © 2019 SDOS. All rights reserved.
//

import Foundation
import SDOSCustomLoader

extension SDOSLoaderProgress: Loadable, FixConstraints {
    public static func createLoader(loaderType: LoaderType, inView view: UIView, size: CGSize?) -> LoaderObject {
        let realSize: CGSize
        if let size = size {
            realSize = size
        } else {
            realSize = CGSize(width: 100, height: 100)
        }
        let frame = CGRect(x: 0, y: 0, width: realSize.width, height: realSize.height);
        
        let progressType: SDOSLoaderProgressType
        let progressStyle: SDOSLoaderProgressStyle
        switch loaderType {
        case .indeterminateLinear(_):
            progressType = .Indeterminate
            progressStyle = .Linear
        case .indeterminateCircular(_):
            progressType = .Indeterminate
            progressStyle = .Circular
        case .determinateLinear(_):
            progressType = .Determinate
            progressStyle = .Linear
        case .determinateCircular(_):
            progressType = .Determinate
            progressStyle = .Circular
        default:
            progressType = .Indeterminate
            progressStyle = .Circular
        }
        
        let loader = SDOSLoaderProgress(frame: frame, type: progressType)
        loader.progressStyle = progressStyle
        loader.center = CGPoint(x: view.frame.size.width / 2, y: view.frame.size.height / 2)
        loader.circularProgressDiameter = loader.frame.size.width / 2
        loader.trackWidth = 3
        
        let loaderObject = LoaderObject(loaderType: loaderType, parentView: view, loaderView: loader)
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
        self.startAnimation()
        UIView.animate(withDuration: 0.3, animations: {
            self.alpha = 1
        })
        
    }
    
    public func setProgress(loaderObject: LoaderObject, value: Float) {
        switch loaderObject.type {
        case .determinateLinear(_),
             .determinateCircular(_):
            self.progress = value
        default:
            print("Not support")
        }
    }
    
    public func setText(loaderObject: LoaderObject, text: String?) {
        print("Not support")
    }
    
    public func hide(loaderObject: LoaderObject) {
        UIView.animate(withDuration: 0.3, animations: {
            self.alpha = 0
        }) { (finished) in
            self.removeFromSuperview()
        }
    }
}
