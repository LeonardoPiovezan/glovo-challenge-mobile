//
//  DefaultContainer+Services.swift
//  Maps
//
//  Created by Leonardo Piovezan on 07/04/19.
//  Copyright © 2019 Leonardo Piovezan. All rights reserved.
//

import Foundation

extension DefaultContainer {
    func registerServices() {
        self.container.register(PlaceService.self) { resolver in
            let repository = resolver.resolve(PlaceRepository.self)!
            return PlaceServiceImpl(repository: repository)
        }

        self.container.register(GeolocationService.self) { _ in
            GeolocationServiceImpl()
        }
    }
}
