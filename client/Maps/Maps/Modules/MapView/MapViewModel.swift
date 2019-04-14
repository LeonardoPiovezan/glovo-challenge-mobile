//
//  MapViewModel.swift
//  Maps
//
//  Created by Leonardo Piovezan on 13/04/19.
//  Copyright © 2019 Leonardo Piovezan. All rights reserved.
//

import RxCocoa
import CoreLocation
import RxSwift
import GoogleMaps

final class MapViewModel: BaseViewModel {
    struct Input {
        let getCitiesTrigger: Driver<Void>
//        let trigger: Driver<Void>
//        let createPostTrigger: Driver<Void>
//        let selection: Driver<IndexPath>
    }
    struct Output {
        let cities: Driver<[City]>
        let polylines: Driver<[GMSPolyline]>
//        let fetching: Driver<Bool>
//        let posts: Driver<[PostItemViewModel]>
//        let createPost: Driver<Void>
//        let selectedPost: Driver<Post>
//        let error: Driver<Error>
    }

    var location: Driver<CLLocation>

    private let placeService: PlaceService
    private let geolocationService: GeolocationService

    init(placeService: PlaceService,
         geolocationService: GeolocationService) {
        self.placeService = placeService
        self.geolocationService = geolocationService
        self.location = self.geolocationService.location
        self.geolocationService.requestAuthorizationFromUser()
//        self.geolocationService.autorized.drive(onNext: { isAutorized in
//            if isAutorized {
//                self.geolocationService.startUpdatingLocation()
//            } else {
//
//            }
//        })

    }

    func transform(input: MapViewModel.Input) -> MapViewModel.Output {

        let citiesResult = input.getCitiesTrigger.flatMapLatest { _ in
            return self.placeService.getCities().asDriver(onErrorRecover: { _ in
                return Driver.empty()
            })

        }

        let cities = citiesResult.map { (test) -> [City] in
            switch test {
            case .success(let cities):
                return cities
            case .failure:
                return []
            }
        }

        let polylines = cities.map { (cities) in
            return cities.map({ city -> GMSPolyline in
                let path = GMSPath(fromEncodedPath: city.working_area.first ?? "")
                let polyline = GMSPolyline(path: path)
                polyline.strokeColor = .red
                return polyline
            })
        }
        
        return Output(cities: cities,
                      polylines: polylines)
    }
}
