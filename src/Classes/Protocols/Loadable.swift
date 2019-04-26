//
//  Loadable.swift
//  SDOSLoader
//
//  Created by Rafael Fernandez Alvarez on 25/04/2019.
//

import Foundation
import SDOSSwiftExtension

public protocol Loadable: UIView {
    static func createLoader(loaderType: LoaderType, inView view: UIView, size: CGSize?) -> LoaderObject
    func show(loaderObject: LoaderObject, delay: TimeInterval)
    func setProgress(loaderObject: LoaderObject, value: Float)
    func setText(loaderObject: LoaderObject, text: String)
    func hide(loaderObject: LoaderObject)
    
    func makeConstraints(to view: UIView)
}

public extension Loadable {
    func makeConstraints(to view: UIView) {
        let centreHorizontallyConstraint = NSLayoutConstraint(item: self, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1, constant: 0)
        let centreVerticallyConstraint = NSLayoutConstraint(item: self, attribute: .centerY, relatedBy: .equal, toItem: view, attribute: .centerY, multiplier: 1, constant: 0)
        let heightConstraint = NSLayoutConstraint(item: self, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: self.frame.size.height)
        let widthConstraint = NSLayoutConstraint(item: self, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: self.frame.size.width)
        
        NSLayoutConstraint.activate([centreVerticallyConstraint, centreHorizontallyConstraint, heightConstraint, widthConstraint])
    }
}
