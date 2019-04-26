//
//  LoaderObject.swift
//
//  Copyright © 2019 SDOS. All rights reserved.
//

import Foundation
import SDOSSwiftExtension

@objc public class LoaderObject: NSObject {
    public let uuid: String = UUID().uuidString
    public let loaderType: LoaderType
    public unowned let view: UIView
    public let loaderView: Loadable
    public let timeAnimation: TimeInterval
    public var disableUserInteractionViews: [UIView]? {
        get {
            var result: [UIView]?
            if let _disableUserInteractionViews = _disableUserInteractionViews {
                result = [UIView]()
                for item in _disableUserInteractionViews {
                    if let item = item.value {
                        result?.append(item)
                    }
                }
            }
            return result
        }
        set {
            var result: [LoaderWeakRef<UIView>]?
            if let newValue = newValue {
                result = [LoaderWeakRef<UIView>]()
                for item in newValue {
                    result?.append(LoaderWeakRef(value: item))
                }
            }
            _disableUserInteractionViews = result
        }
    }
    public var hideViews: [UIView]? {
        get {
            var result: [UIView]?
            if let _hideViews = _hideViews {
                result = [UIView]()
                for item in _hideViews {
                    if let item = item.value {
                        result?.append(item)
                    }
                }
            }
            return result
        }
        set {
            var result: [LoaderWeakRef<UIView>]?
            if let newValue = newValue {
                result = [LoaderWeakRef<UIView>]()
                for item in newValue {
                    result?.append(LoaderWeakRef(value: item))
                }
            }
            _hideViews = result
        }
    }
    public var disableControls: [UIControl]? {
        get {
            var result: [UIControl]?
            if let _disableControls = _disableControls {
                result = [UIControl]()
                for item in _disableControls {
                    if let item = item.value {
                        result?.append(item)
                    }
                }
            }
            return result
        }
        set {
            var result: [LoaderWeakRef<UIControl>]?
            if let newValue = newValue {
                result = [LoaderWeakRef<UIControl>]()
                for item in newValue {
                    result?.append(LoaderWeakRef(value: item))
                }
            }
            _disableControls = result
        }
    }
    
    private var _disableUserInteractionViews: [LoaderWeakRef<UIView>]?
    private var _hideViews: [LoaderWeakRef<UIView>]?
    private var _disableControls: [LoaderWeakRef<UIControl>]?
    
    internal init(loaderType: LoaderType, view: UIView, loaderView: Loadable) {
        self.loaderType = loaderType
        self.view = view
        self.loaderView = loaderView
        timeAnimation = 0.3
    }
}

extension LoaderObject: Stylable {
    
}
