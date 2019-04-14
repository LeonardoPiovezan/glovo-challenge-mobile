//
//  DefaultContainer+ViewModels.swift
//  Maps
//
//  Created by Leonardo Piovezan on 13/04/19.
//  Copyright © 2019 Leonardo Piovezan. All rights reserved.
//

import Foundation

extension DefaultContainer {
    func registerViewModels() {
        self.container.register(MapViewModeling.self) { resolver in
            let placeService = resolver.resolve(PlaceService.self)!
            return MapViewModel(placeService: placeService)
        }
    }
}
