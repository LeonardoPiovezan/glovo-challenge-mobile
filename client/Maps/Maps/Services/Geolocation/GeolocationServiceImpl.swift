//
//  GeolocationServiceImpl.swift
//  Maps
//
//  Created by Leonardo Piovezan on 07/04/19.
//  Copyright © 2019 Leonardo Piovezan. All rights reserved.
//
import RxCocoa
import CoreLocation
import RxSwift
import RxCoreLocation

final class GeolocationServiceImpl: GeolocationService {
    var autorized: Driver<Bool>
    var location: Driver<CLLocation>
    private let locationManager: CLLocationManager

    init() {
        self.locationManager = CLLocationManager()
        self.locationManager.startUpdatingLocation()
        self.autorized = self.locationManager.rx.status.map { authorization -> Bool in
            switch authorization {
            case .authorizedAlways, .authorizedWhenInUse:
                return true
            default:
                return false
            }
            }.asDriver(onErrorJustReturn: false)

        self.location = self.locationManager
            .rx
            .location
            .unwrap()
            .asDriver(onErrorJustReturn: CLLocation(latitude: 0, longitude: 0))
    }

    func requestAuthorizationFromUser() {
        self.locationManager.requestAlwaysAuthorization()
    }

    func startUpdatingLocation() {
        self.locationManager.startUpdatingLocation()
    }

    func stopUpdatingLocation() {
        self.locationManager.stopUpdatingLocation()
    }

    func requestLocation() {
        self.locationManager.requestLocation()
    }
}
