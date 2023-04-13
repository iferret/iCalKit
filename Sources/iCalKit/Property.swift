//
//  Property.swift
//  
//
//  Created by iferret's on 2023/4/13.
//

import Foundation
import libical

public class Property: NSObject {
    
    // MARK: 公开属性
    
    /// Kind
    public var kind: Kind {
        return .init(rawValue: icalproperty_isa(rawValue))
    }
    
    /// [Parameter]
    public var parameters: [Parameter] {
        return Parameter.Kind.allCases.reduce([], { $0 + icalproperty_get_parameters(from: rawValue, kind: $1.rawValue).map { .init(rawValue: $0) } })
    }
    
    // MARK: 私有属性
    
    /// icalproperty
    internal let rawValue: icalproperty
    
    // MARK: 生命周期
    
    /// 构建
    /// - Parameter rfc5545: String
    public convenience init(rfc5545: String) throws {
        guard let newValue = icalproperty_new_from_string(rfc5545) else {
            throw icalerror.illegal(rfc5545)
        }
        self.init(rawValue: newValue)
    }
    
    /// 构建
    /// - Parameter kind: Kind
    public convenience init(kind: Kind) {
        self.init(rawValue: icalproperty_new(kind.rawValue))
    }
    
    /// 构建
    /// - Parameter other: Property
    public convenience init(other: Property) throws {
        guard let newValue = icalproperty_new_clone(other.rawValue) else {
            throw icalerror.notwork("icalcomponent_new_clone")
        }
        self.init(rawValue: newValue)
    }
    
    /// 构建
    /// - Parameter rawValue: icalcomponent
    internal init(rawValue: icalcomponent) {
        self.rawValue = rawValue
        super.init()
    }
    
    deinit {
        // icalproperty_free
        icalproperty_free(rawValue)
    }
}

extension Property {
    
    /// add parameter
    /// - Parameter parameter: Parameter
    public func add(_ parameter: Parameter) {
        icalproperty_add_parameter(rawValue, parameter.rawValue)
    }
    
    /// remove parameter
    /// - Parameter parameter: Parameter
    public func remove(_ parameter: Parameter) {
        icalproperty_remove_parameter_by_ref(rawValue, parameter.rawValue)
    }
    
    /// removeAll by kind
    /// - Parameter kind: Kind
    public func removeAll(kind: Parameter.Kind) {
        icalproperty_remove_parameter_by_kind(rawValue, kind.rawValue)
    }
    
    /// removeAll by name
    /// - Parameter name: String
    public func removeAll(name: String) {
        icalproperty_remove_parameter_by_name(rawValue, name)
    }
}
