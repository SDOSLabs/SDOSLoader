//
//  Loader+MBProgressHUD.swift
//  DGActivityIndicatorView
//
//  Created by Rafael Fernandez Alvarez on 25/04/2019.
//

import Foundation
import SDOSSwiftExtension
import MBProgressHUD

extension MBProgressHUD: Stylable {
    
}

extension MBProgressHUD: Loadable {
    public static func createLoader(loaderType: LoaderType, inView view: UIView, size: CGSize?) -> LoaderObject {
        let loader = MBProgressHUD(view: view)
        loader.removeFromSuperViewOnHide = true
        loader.label.text = nil
        switch loaderType {
        case .text(_):
            loader.mode = MBProgressHUDMode.text
        case .progressCircular(_):
            loader.mode = MBProgressHUDMode.annularDeterminate
        case .progressBar(_):
            loader.mode = MBProgressHUDMode.determinateHorizontalBar
        default:
            loader.mode = MBProgressHUDMode.text
        }
        let loaderObject = LoaderObject(loaderType: loaderType, view: view, loaderView: loader)
        return loaderObject
    }
    
    public func show(loaderObject: LoaderObject, delay: TimeInterval) {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.alpha = 0
        loaderObject.view.addSubview(self)
        makeConstraints(to: loaderObject.view)
        self.show(animated: true)
        UIView.animate(withDuration: 0.3, animations: {
            self.alpha = 1
        })
        
    }
    
    public func setProgress(loaderObject: LoaderObject, value: Float) {
        self.progress = value
    }
    
    public func setText(loaderObject: LoaderObject, text: String) {
        self.label.text = text
    }
    
    public func hide(loaderObject: LoaderObject) {
        self.hide(animated: true)
    }
}
