//
//  MapViewModel.swift
//  Maps
//
//  Created by Leonardo Piovezan on 13/04/19.
//  Copyright © 2019 Leonardo Piovezan. All rights reserved.
//

import RxCocoa
import CoreLocation

final class MapViewModel: MapViewModeling {
    var location: Driver<CLLocation>

    private let placeService: PlaceService
    private let geolocationService: GeolocationService

    init(placeService: PlaceService,
         geolocationService: GeolocationService) {
        self.placeService = placeService
        self.geolocationService = geolocationService
        self.location = self.geolocationService.location
        self.geolocationService.requestAuthorizationFromUser()

        self.placeService
//        self.geolocationService.autorized.drive(onNext: { isAutorized in
//            if isAutorized {
//                self.geolocationService.startUpdatingLocation()
//            } else {
//
//            }
//        })

    }
}
