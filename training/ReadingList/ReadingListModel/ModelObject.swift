//
// Copyright (C) 2017 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this example's licensing information.
//
import Foundation

open class ModelObject: NSObject
{
    open class var keys: [String] { return [] }
    
    public required init(dictionary: [String: Any]) {
        super.init()
        self.setValuesForKeys(dictionary)
    }
    
    open func dictionaryRepresentation() -> [String: Any] {
        return self.dictionaryWithValues(forKeys: type(of: self).keys) as [String : Any]
    }
}
