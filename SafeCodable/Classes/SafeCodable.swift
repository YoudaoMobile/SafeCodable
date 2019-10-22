//
//  SafeCodable.swift
//  SafeCodable
//
//  Created by ximiao on 2019/9/12.
//

import UIKit

public typealias SafeCodable = SafeDecodable & SafeEncodable
public protocol SafeDecodable: Decodable {
    init(from decoder: Decoder) throws
}
public protocol SafeEncodable: Encodable {}


public extension KeyedDecodingContainer {
    public func decodeIfPresent(_ type: Bool.Type, forKey key: KeyedDecodingContainer<K>.Key) throws -> Bool? {
        return (try? decode(type, forKey: key)) ?? false
    }
}

//extension Array: SafeDecodable where Element: Decodable {}
//
//extension SafeDecodable where Self == Array<Element> {
//    public init(from decoder: Decoder) throws {
//        self.init()
//
//        var container = try decoder.unkeyedContainer()
//        while !container.isAtEnd {
//            guard let element = try? container.decode(Element.self) else {
//                assertionFailure("解析json，有数组元素解析失败)")
//                continue
//            }
//            self.append(element)
//        }
//    }
//}


extension Array: SafeDecodable where Element: SafeDecodable {
  /// Creates a new array by decoding from the given decoder.
  ///
  /// This initializer throws an error if reading from the decoder fails, or
  /// if the data read is corrupted or otherwise invalid.
  ///
  /// - Parameter decoder: The decoder to read data from.
  public init(from decoder: Decoder) throws {
    self.init()

    var container = try decoder.unkeyedContainer()
    while !container.isAtEnd {
        guard let element = try? container.decode(Element.self) else {
            assertionFailure("解析json，有数组元素解析失败)")
            continue
        }
        self.append(element)
    }
  }
    
    public init(with str: String) {
            self.init()
        }
    
    public func testIn() {
        
    }
}


