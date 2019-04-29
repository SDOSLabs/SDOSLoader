//
//  UtilLoader.swift
//
//  Copyright © 2019 SDOS. All rights reserved.
//

import Foundation

class LoaderWeakRef<T> where T: AnyObject {
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

extension Array where Element: LoaderWeakRef<AnyObject> {
    /// Removes the nil objects in the array.
    mutating func compact() -> Array<Element> {
        self = self.filter{ $0.value != nil }
        return self
    }
    
}
