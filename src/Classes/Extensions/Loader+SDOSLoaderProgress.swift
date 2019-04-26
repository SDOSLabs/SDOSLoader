//
//  Loader+SDOSLoaderProgress.swift
//  SDOSLoader
//
//  Created by Rafael Fernandez Alvarez on 25/04/2019.
//

import Foundation
import SDOSCustomLoader
import SDOSSwiftExtension

extension SDOSLoaderProgress: Stylable {
    
}

extension SDOSLoaderProgress: Loadable {
    public static func createLoader(loaderType: LoaderType, inView view: UIView, size: CGSize?) -> LoaderObject {
        let realSize: CGSize
        if let size = size {
            realSize = size
        } else {
            realSize = CGSize(width: 100, height: 100)
        }
        let frame = CGRect(x: 0, y: 0, width: realSize.width, height: realSize.height);
        
        let loader = SDOSLoaderProgress(frame: frame, type: .Indeterminate)
        loader.progressStyle = .Circular
        loader.center = CGPoint(x: view.frame.size.width / 2, y: view.frame.size.height / 2)
        loader.circularProgressDiameter = loader.frame.size.width / 2
        loader.trackWidth = 3
        
        let loaderObject = LoaderObject(loaderType: loaderType, view: view, loaderView: loader)
        return loaderObject
    }
    
    public func show(loaderObject: LoaderObject, delay: TimeInterval) {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.alpha = 0
        loaderObject.view.addSubview(self)
        makeConstraints(to: loaderObject.view)
        self.startAnimation()
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
            self.removeFromSuperview()
        }
    }
}
