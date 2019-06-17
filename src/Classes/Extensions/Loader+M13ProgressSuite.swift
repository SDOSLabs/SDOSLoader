//
//  Loader+M13ProgressSuite.swift
//
//  Copyright © 2019 SDOS. All rights reserved.
//

import Foundation
import M13ProgressSuite

extension M13ProgressViewRing: Loadable, FixConstraints {
    public static func createLoader(loaderType: LoaderType, inView view: UIView, size: CGSize?) -> LoaderObject {
        let realSize: CGSize
        if let size = size {
            realSize = size
        } else {
            realSize = CGSize(width: 100, height: 100)
        }
        let frame = CGRect(x: 0, y: 0, width: realSize.width, height: realSize.height);
        
        let loader = M13ProgressViewRing(frame: frame)
        loader.center = CGPoint(x: view.frame.size.width / 2, y: view.frame.size.height / 2)
        
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
        UIView.animate(withDuration: 0.3, animations: {
            self.alpha = 1
        })
        
    }
    
    public func setProgress(loaderObject: LoaderObject, value: Float) {
        self.setProgress(CGFloat(value), animated: true)
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
