//
//  LoaderObject.swift
//
//  Copyright © 2019 SDOS. All rights reserved.
//

import Foundation
import SDOSSwiftExtension

/// Objeto que contiene toda la información referente a un loader
@objc public class LoaderObject: NSObject {
    
    /// Identificador único
    public let uuid: String = UUID().uuidString
    
    /// Tipo de loader a cargar
    public let loaderType: LoaderType
    
    /// Vista donde se mostrará el loader
    public unowned let parentView: UIView
    
    /// Vista del propio loader que se mostrará
    public let view: Loadable
    
    /// Tiempo de animación para mostrar y ocultar los elementos asociados al loader (hideViews)
    public let timeAnimation: TimeInterval
    
    /// Vistas que se deshabilitarán (isUserInteractionEnabled = false) cuando se muestre el loader. Cuando se oculten se volverán a habilitar
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
    
    /// Vistas que se ocultarán (alpha = 0) cuando se muestre el loader. Cuando el loader se oculte se volverán a mostrar las vistas
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
    
    /// Elementos que se deshabilitarán (isEnabled = false) cuando se muestre el loader. Cuando se oculten se volverán a habilitar
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
    
    internal init(loaderType: LoaderType, parentView: UIView, loaderView view: Loadable) {
        self.loaderType = loaderType
        self.parentView = parentView
        self.view = view
        timeAnimation = 0.3
    }
}

/// Extensión que indica que se le pueden aplicar estilos
extension LoaderObject: Stylable {
    
}
