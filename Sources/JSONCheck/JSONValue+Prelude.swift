//
// This source file is part of Kombucha, an open source project by Wayfair
//
// Copyright (c) 2019 Wayfair, LLC.
// Licensed under the 2-Clause BSD License
//
// See LICENSE.md for license information
//

import JSONValue
import Prelude

public extension JSONValue {
    func fold<T: Monoid>(
        context: JSONContext,
        arrayCase: (JSONContext, [JSONValue]) -> T = { _, _ in .empty },
        boolCase: (JSONContext, Bool) -> T = { _, _ in .empty },
        doubleCase: (JSONContext, Double) -> T = { _, _ in .empty },
        nullCase: (JSONContext) -> T = { _ in .empty },
        objectCase: (JSONContext, [String: JSONValue]) -> T = { _, _ in .empty },
        stringCase: (JSONContext, String) -> T = { _, _ in .empty }) -> T {
        switch self {
        case .array(let arrayValue):
            let firstResult = arrayCase(context, arrayValue)
            let rest: T = arrayValue.enumerated().reduce(.empty) { acc, tuple in
                let (index, element) = tuple
                let nextContext = context.appending(.arrayIndex(index))
                return acc <> element.fold(
                    context: nextContext,
                    arrayCase: arrayCase,
                    boolCase: boolCase,
                    doubleCase: doubleCase,
                    nullCase: nullCase,
                    objectCase: objectCase,
                    stringCase: stringCase
                )
            }
            return firstResult <> rest
        case .bool(let boolValue):
            return boolCase(.empty, boolValue)
        case .double(let doubleValue):
            return doubleCase(.empty, doubleValue)
        case .null:
            return nullCase(.empty)
        case .object(let objectValue):
            let firstResult = objectCase(context, objectValue)
            let rest: T = objectValue.reduce(.empty) { acc, tuple in
                let (key, value) = tuple
                let nextContext = context.appending(.objectIndex(key))
                return acc <> value.fold(
                    context: nextContext,
                    arrayCase: arrayCase,
                    boolCase: boolCase,
                    doubleCase: doubleCase,
                    nullCase: nullCase,
                    objectCase: objectCase,
                    stringCase: stringCase
                )
            }
            return firstResult <> rest
        case .string(let stringValue):
            return stringCase(.empty, stringValue)
        }
    }
}
