//
//  MapViewModel.swift
//  Maps
//
//  Created by Leonardo Piovezan on 13/04/19.
//  Copyright © 2019 Leonardo Piovezan. All rights reserved.
//

import Foundation

final class MapViewModel: MapViewModeling {
    private let placeService: PlaceService

    init(placeService: PlaceService) {
        self.placeService = placeService
    }
}
