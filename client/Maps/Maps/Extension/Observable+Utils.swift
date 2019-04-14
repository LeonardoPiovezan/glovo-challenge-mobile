//
//  Observable+Utils.swift
//  Maps
//
//  Created by Leonardo Piovezan on 13/04/19.
//  Copyright © 2019 Leonardo Piovezan. All rights reserved.
//

import RxSwift

extension Observable where Element: OptionalType {
    func unwrap() -> Observable<Element.Wrapped> {
        return self.filter { $0.asOptional != nil }.map { $0.asOptional! }
    }
}

protocol OptionalType {
    associatedtype Wrapped
    var asOptional:  Wrapped? { get }
}

extension Optional: OptionalType {
    var asOptional: Wrapped? { return self }
}
