//
//  Loadable.swift
//
//  Copyright © 2019 SDOS. All rights reserved.
//

import Foundation
import SDOSSwiftExtension

internal protocol Loadable: UIView {
    static func createLoader(loaderType: LoaderType, inView view: UIView, size: CGSize?) -> LoaderObject
    func show(loaderObject: LoaderObject)
    func setProgress(loaderObject: LoaderObject, value: Float)
    func setText(loaderObject: LoaderObject, text: String?)
    func hide(loaderObject: LoaderObject)
}

internal protocol FixConstraints: UIView {
    func makeConstraints(to view: UIView)
}

internal extension FixConstraints {
    func makeConstraints(to view: UIView) {
        let centreHorizontallyConstraint = NSLayoutConstraint(item: self, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1, constant: 0)
        let centreVerticallyConstraint = NSLayoutConstraint(item: self, attribute: .centerY, relatedBy: .equal, toItem: view, attribute: .centerY, multiplier: 1, constant: 0)
        let heightConstraint = NSLayoutConstraint(item: self, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: self.frame.size.height)
        let widthConstraint = NSLayoutConstraint(item: self, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: self.frame.size.width)
        
        NSLayoutConstraint.activate([centreVerticallyConstraint, centreHorizontallyConstraint, heightConstraint, widthConstraint])
    }
}
