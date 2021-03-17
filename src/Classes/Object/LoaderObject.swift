//
//  LoaderObject.swift
//
//  Copyright © 2019 SDOS. All rights reserved.
//

import Foundation
import UIKit
import SDOSSwiftExtension

/// Objeto que contiene toda la información referente a un loader
@objc public class LoaderObject: NSObject {
    
    enum State {
        case willShow
        case didShow
        case willHide
        case didHide
    }
    
    var lasState: State = .didHide
    
    var needShowDate: Date?
    var lastShowDate: Date?
    var lastHideDate: Date?
    
    /// Identificador único
    public let uuid: String = UUID().uuidString
    
    /// Tipo de loader a cargar
    public let type: LoaderType
    
    /// Vista donde se mostrará el loader
    public weak var parentView: UIView?
    
    /// Vista del propio loader que se mostrará
    public var view: UIView {
        get {
            return _view
        }
    }
    
    internal let _view: Loadable
    
    /// Tiempo de animación para mostrar y ocultar los elementos asociados al loader (hideViews, disableUserInteractionViews, disableControls)
    public var timeAnimation: TimeInterval = 0.3
    
    /// Tiempo de animación para mostrar los elementos asociados al loader (hideViews, disableUserInteractionViews, disableControls). Se tiene en cuenta antes que `timeAnimation`
    public var startTimeAnimation: TimeInterval? = nil
    
    /// Tiempo de animación para ocultar los elementos asociados al loader (hideViews, disableUserInteractionViews, disableControls). Se tiene en cuenta antes que `timeAnimation`
    public var finishTimeAnimation: TimeInterval? = nil
    
    /// Vistas que se deshabilitarán (isUserInteractionEnabled = false) cuando se muestre el loader. Cuando se oculten se volverán a habilitar
    public var disableUserInteractionViews: [UIView]? {
        get {
            return _disableUserInteractionViews?.compactMap { $0.value }
        }
        set {
            _disableUserInteractionViews = newValue?.map { LoaderWeakRef(value: $0) }
        }
    }
    
    /// Vistas que se ocultarán (alpha = 0) cuando se muestre el loader. Cuando el loader se oculte se volverán a mostrar las vistas
    public var hideViews: [UIView]? {
        get {
            return _hideViews?.compactMap { $0.value }
        }
        set {
            _hideViews = newValue?.map { LoaderWeakRef(value: $0) }
        }
    }
    
    /// Elementos que se deshabilitarán (isEnabled = false) cuando se muestre el loader. Cuando se oculten se volverán a habilitar
    public var disableControls: [UIControl]? {
        get {
            return _disableControls?.compactMap { $0.value }
        }
        set {
            _disableControls = newValue?.map { LoaderWeakRef(value: $0) }
        }
    }
    
    private var _disableUserInteractionViews: [LoaderWeakRef<UIView>]?
    private var _hideViews: [LoaderWeakRef<UIView>]?
    private var _disableControls: [LoaderWeakRef<UIControl>]?
    
    internal init(loaderType: LoaderType, parentView: UIView, loaderView view: Loadable) {
        self.type = loaderType
        self.parentView = parentView
        self._view = view
    }
}

/// Extensión que indica que se le pueden aplicar estilos
extension LoaderObject: Stylable {
    
}
