//
//  FailableDecodable.swift
//  Moovie
//
//  Created by Luiz Henrique de Sousa on 04/12/19.
//  Copyright © 2019 Luiz Henrique. All rights reserved.
//

fileprivate struct DummyCodable: Codable {}

extension UnkeyedDecodingContainer {

    public mutating func decodeArray<T>(_ type: T.Type) throws -> [T] where T : Decodable {

        var array = [T]()
        while !self.isAtEnd {
            do {
                let item = try self.decode(T.self)
                array.append(item)
            } catch let error {
                print("error: \(error)")

                // hack to increment currentIndex
                _ = try self.decode(DummyCodable.self)
            }
        }
        return array
    }
}
extension KeyedDecodingContainerProtocol {
    public func decodeArray<T>(_ type: T.Type, forKey key: Self.Key) throws -> [T] where T : Decodable {
        var unkeyedContainer = try self.nestedUnkeyedContainer(forKey: key)
        return try unkeyedContainer.decodeArray(type)
    }
}
