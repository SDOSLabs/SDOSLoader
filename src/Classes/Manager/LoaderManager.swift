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
        default:
            let loaderObject = SDOSLoaderProgress.createLoader(loaderType: loaderType, inView: view!, size: size)
            return loaderObject
        }
    }
    
    public class func showLoader(_ loaderObject: LoaderObject?, delay: TimeInterval = 0) {
        if let loaderObject = loaderObject {
            loaderObject.loaderView.show(loaderObject: loaderObject, delay: delay)
            shared.activeLoaders[loaderObject.uuid] = loaderObject
        }
    }
    
    public class func changeProgress(newValue value: Double, loaderObject: LoaderObject?) {
        if let loaderObject = loaderObject {
            loaderObject.loaderView.setProgress(loaderObject: loaderObject, value: value)
        }
    }
    
    public class func changeText(_ text: String, loaderObject: LoaderObject?) {
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
