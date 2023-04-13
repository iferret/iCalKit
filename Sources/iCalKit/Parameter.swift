//
//  Parameter.swift
//  
//
//  Created by iferret's on 2023/4/13.
//

import Foundation
import libical

public class Parameter: NSObject {
    // MARK: 公开属性
    
    /// Kind
    public var kind: Kind {
        return .init(rawValue: icalparameter_isa(rawValue))
    }
  
    // MARK: 私有属性
    
    /// icalparameter
    internal let rawValue: icalparameter
    
    // MARK: 生命周期
    
    /// 构建
    /// - Parameter rfc5545: String
    public convenience init(rfc5545: String) throws {
        guard let newValue = icalparameter_new_from_string(rfc5545) else {
            throw icalerror.illegal(rfc5545)
        }
        self.init(rawValue: newValue)
    }
    
    /// 构建
    /// - Parameter kind: Kind
    public convenience init(kind: Kind, value: String? = nil) {
        if let value = value {
            self.init(rawValue: icalparameter_new_from_value_string(kind.rawValue, value))
        } else {
            self.init(rawValue: icalparameter_new(kind.rawValue))
        }
    }
    
    /// 构建
    /// - Parameter other: Parameter
    public convenience init(other: Parameter) throws {
        guard let newValue = icalparameter_new_clone(other.rawValue) else {
            throw icalerror.notwork("icalcomponent_new_clone")
        }
        self.init(rawValue: newValue)
    }
    
    /// 构建
    /// - Parameter rawValue: icalparameter
    internal init(rawValue: icalparameter) {
        self.rawValue = rawValue
        super.init()
    }
    
    deinit {
        // icalparameter_free
        icalparameter_free(rawValue)
    }
}

