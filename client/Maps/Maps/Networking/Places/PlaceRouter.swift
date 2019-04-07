//
//  PlaceRouter.swift
//  Maps
//
//  Created by Leonardo Piovezan on 07/04/19.
//  Copyright © 2019 Leonardo Piovezan. All rights reserved.
//

import Foundation
import Moya

enum PlaceRouter {
    case cities
    case countries
}

extension PlaceRouter: TargetType {
    var baseURL: URL {
        return URL(string: Constants.Network.baseURL)!
    }

    var path: String {
        switch self {
        case .cities:
            return "cities"
        case .countries:
            return "countries"
        }
    }

    var method: Moya.Method {
        return .get
    }

    var sampleData: Data {
        return Data()
    }

    var task: Task {
        return .requestPlain
    }

    var headers: [String : String]? {
        return nil
    }
}
