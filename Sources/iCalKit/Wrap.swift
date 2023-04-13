//
//  Wrap.swift
//  
//
//  Created by iferret's on 2023/4/13.
//

import Foundation
import libical

public struct Wrap<T>: Hashable where T: RawRepresentable<UInt32> {
    /// T
    internal let rawValue: T
    
    /// hash
    /// - Parameter hasher: Hasher
    public func hash(into hasher: inout Hasher) {
        hasher.combine(rawValue.rawValue)
    }
    
    /// `a == b` implies that `a != b` is `false`.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    public static func == (lhs: Self, rhs: Self) -> Bool {
        return lhs.hashValue == rhs.hashValue
    }
}

protocol icalValue {
    associatedtype T
    
    
}
