//
//  Loader+M13ProgressSuite.swift
//  DGActivityIndicatorView
//
//  Created by Rafael Fernandez Alvarez on 25/04/2019.
//

import Foundation
import SDOSSwiftExtension
import M13ProgressSuite

//extension M13ProgressSuite: Stylable {
//    
//}
//
//extension M13ProgressSuite: Loadable {
//    public static func createLoader(loaderType: LoaderType, inView view: UIView, size: CGSize?) -> LoaderObject {
//        let realSize: CGSize
//        if let size = size {
//            realSize = size
//        } else {
//            realSize = CGSize(width: 100, height: 100)
//        }
//        let frame = CGRect(x: 0, y: 0, width: realSize.width, height: realSize.height);
//        
//        let loader = M13ProgressSuite(frame: frame, type: .Indeterminate)
//        loader.progressStyle = .Circular
//        loader.center = CGPoint(x: view.frame.size.width / 2, y: view.frame.size.height / 2)
//        loader.circularProgressDiameter = loader.frame.size.width / 2
//        
//        let loaderObject = LoaderObject(loaderType: loaderType, view: view, loaderView: loader)
//        return loaderObject
//    }
//    
//    public func show(loaderObject: LoaderObject, delay: TimeInterval) {
//        self.translatesAutoresizingMaskIntoConstraints = false
//        self.alpha = 0
//        loaderObject.view.addSubview(self)
//        makeConstraints(to: loaderObject.view)
//        self.startAnimation()
//        UIView.animate(withDuration: 0.3, animations: {
//            self.alpha = 1
//        })
//        
//    }
//    
//    public func setProgress(loaderObject: LoaderObject, value: Double) {
//        print("Not support")
//    }
//    
//    public func setText(loaderObject: LoaderObject, text: String) {
//        print("Not support")
//    }
//    
//    public func hide(loaderObject: LoaderObject) {
//        UIView.animate(withDuration: 0.3, animations: {
//            self.alpha = 0
//        })
//    }
//}
