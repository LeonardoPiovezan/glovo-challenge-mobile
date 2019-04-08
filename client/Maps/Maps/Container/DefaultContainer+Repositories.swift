//
//  DefaultContainer+Repositories.swift
//  Maps
//
//  Created by Leonardo Piovezan on 07/04/19.
//  Copyright © 2019 Leonardo Piovezan. All rights reserved.
//

import Foundation
import Moya

extension DefaultContainer {
    func registerRepositories() {
        self.container.register(PlaceRepository.self) { _ in
            let provider = MoyaProvider<PlaceRouter>()
            return PlaceRepositoryImpl(provider: provider)
        }
    }
}
