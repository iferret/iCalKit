//
//  Component.swift
//  
//
//  Created by iferret's on 2023/4/13.
//

import Foundation
import libical


/// Component
public class Component: NSObject {
    
    // MARK: 公开属性
    
    /// 类别
    public var kind: Kind {
        return .init(rawValue: icalcomponent_isa(rawValue))
    }
    
    /// [Component]
    public var components: [Component] {
        return Component.Kind.allCases.reduce([], { $0 + icalcomponent_get_components(from: rawValue, kind: $1.rawValue).map { .init(rawValue: $0) } })
    }
    
    /// [Property]
    public var properties: [Property] {
        return Property.Kind.allCases.reduce([], { $0 + icalcomponent_get_properties(from: rawValue, kind: $1.rawValue).map { .init(rawValue: $0) } })
    }
    
    /// description
    public override var description: String {
        if let value = icalcomponent_as_ical_string_r(rawValue) {
            return .init(cString: value)
        } else {
            return super.description
        }
    }
    
    // MARK: 私有属性
    
    /// icalcomponent
    internal let rawValue: icalcomponent
    
    // MARK: 生命周期
    
    /// 构建
    /// - Parameter rfc5545: String
    public convenience init(rfc5545: String) throws {
        guard let newValue = icalcomponent_new_from_string(rfc5545) else {
            throw icalerror.illegal(rfc5545)
        }
        self.init(rawValue: newValue)
    }
    
    /// 构建
    /// - Parameter kind: Kind
    public convenience init(kind: Kind) {
        self.init(rawValue: icalcomponent_new(kind.rawValue))
    }
    
    /// 构建
    /// - Parameter other: Component
    public convenience init(other: Component) throws {
        guard let newValue = icalcomponent_new_clone(other.rawValue) else {
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
        // icalcomponent_free
        icalcomponent_free(rawValue)
    }
}

extension Component {
    
    /// add component
    /// - Parameter cmpt: Component
    public func add(_ cmpt: Component) {
        icalcomponent_add_component(rawValue, cmpt.rawValue)
    }
    
    /// remove component
    /// - Parameter cmpt: Component
    public func remove(_ cmpt: Component) {
        icalcomponent_remove_component(rawValue, cmpt.rawValue)
    }
    
    /// add property
    /// - Parameter property: Property
    public func add(_ property: Property) {
        icalcomponent_add_property(rawValue, property.rawValue)
    }
    
    /// remove property
    /// - Parameter property: Property
    public func remove(_ property: Property) {
        icalcomponent_remove_property(rawValue, property.rawValue)
    }
    
    /// toRFC5545
    /// - Returns: String
    public func toRFC5545() -> String {
        if let value = icalcomponent_as_ical_string_r(rawValue) {
            return .init(cString: value)
        } else {
            return ""
        }
    }
}
