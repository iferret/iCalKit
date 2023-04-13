// The Swift Programming Language
// https://docs.swift.org/swift-book

import libical

/// OpaquePointer
typealias icalcomponent = OpaquePointer
/// OpaquePointer
typealias icalproperty = OpaquePointer
/// OpaquePointer
typealias icalparameter = OpaquePointer

/// icalcomponent_get_components
/// - Parameters:
///   - cmpt: icalcomponent
///   - kind: icalcomponent_kind
/// - Returns: [icalcomponent]
func icalcomponent_get_components(from cmpt: icalcomponent, kind: icalcomponent_kind) -> [icalcomponent] {
    var elements: [icalcomponent] = []
    if let first = icalcomponent_get_first_component(cmpt, kind) {
        elements.append(first)
    }
    while let next = icalcomponent_get_next_component(cmpt, kind) {
        elements.append(next)
    }
    return elements
}

/// icalcomponent_get_properties
/// - Parameters:
///   - cmpt: icalcomponent
///   - kind: icalproperty_kind
/// - Returns: [icalproperty]
func icalcomponent_get_properties(from cmpt: icalcomponent, kind: icalproperty_kind) -> [icalproperty] {
    var elements: [icalproperty] = []
    if let first = icalcomponent_get_first_property(cmpt, kind) {
        elements.append(first)
    }
    while let next = icalcomponent_get_next_property(cmpt, kind) {
        elements.append(next)
    }
    return elements
}

/// icalproperty_get_parameters
/// - Parameters:
///   - property: icalproperty
///   - kind: icalparameter_kind
/// - Returns: [icalparameter]
func icalproperty_get_parameters(from property: icalproperty, kind: icalparameter_kind) -> [icalparameter] {
    var elements: [icalparameter] = []
    if let first = icalproperty_get_first_parameter(property, kind) {
        elements.append(first)
    }
    while let next = icalproperty_get_next_parameter(property, kind) {
        elements.append(next)
    }
    return elements
}

// MARK: - icalerror

/// icalerror
public enum icalerror: Error {
    /// illegal
    case illegal(_ value: Any)
    /// notwork
    case notwork(_ value: Any)
    /// notfound
    case notfound(_ value: Any)
    
    /// String
    public var localizedDescription: String {
        switch self {
        case .illegal(let value):   return "illegal => \(value)"
        case .notwork(let value):   return "notwork => \(value)"
        case .notfound(let value):  return "notfound => \(value)"
        }
    }
}
