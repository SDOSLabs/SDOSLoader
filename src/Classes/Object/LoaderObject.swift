//
//  LoaderObject.swift
//  DGActivityIndicatorView
//
//  Created by Rafael Fernandez Alvarez on 25/04/2019.
//

import Foundation
import SDOSSwiftExtension

class WeakRef<T> where T: AnyObject {
    private(set) weak var value: T?
    
    init(value: T) {
        self.value = value
    }
    
    init?(value: T?) {
        if let value = value {
            self.value = value
        } else {
            return nil
        }
    }
}


extension Array where Element: WeakRef<AnyObject> {
    /// Removes the nil objects in the array.
    mutating func compact() -> Array<Element> {
        self = self.filter{ $0.value != nil }
        return self
    }
    
}

public enum LoaderActionType {
    /**
     *  Opción que indica que se va a mostrar el loader
     */
    case show
    /**
     *  Opción que indica que se va a ocultar el loader
     */
    case hide
    /**
     *  Ocpión que indica que se va a modificar el texto del loader
     */
    case changeText
    /**
     *  Opción que indica que se va a modificar el progreso del loader
     */
    case changeProgress
}


public class LoaderObject {
    public let uuid: String = UUID().uuidString
    public let loaderType: LoaderType
    public unowned let view: UIView
    public let loaderView: Loadable
    public let timeAnimation: TimeInterval
    
    private var disableUserInteractionViews: [WeakRef<UIView>]?
    private var hideViews: [WeakRef<UIView>]?
    private var disableControls: [WeakRef<UIControl>]?
    
    init(loaderType: LoaderType, view: UIView, loaderView: Loadable) {
        self.loaderType = loaderType
        self.view = view
        self.loaderView = loaderView
        timeAnimation = 0.3
    }
}

extension LoaderObject: Stylable {
    
}
