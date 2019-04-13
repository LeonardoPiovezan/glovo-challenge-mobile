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

final class GeolocationServiceImpl: NSObject, GeolocationService {
    var autorized: Driver<Bool>
    var location: Driver<CLLocationCoordinate2D>
    private let locationManager: CLLocationManager

    private let locationSubject = PublishSubject<CLLocationCoordinate2D>()
    private let autorizedSubject = PublishSubject<Bool>()

    override init() {
        self.locationManager = CLLocationManager()
        self.location = self.locationSubject.asDriver(onErrorJustReturn: CLLocationCoordinate2D(latitude: 0, longitude: 0))
        self.autorized = self.autorizedSubject.asDriver(onErrorJustReturn: false)
        super.init()
        self.locationManager.delegate = self
        self.locationManager.startUpdatingLocation()
    }
}

extension GeolocationServiceImpl: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = locations.last!
        self.locationSubject.onNext(location.coordinate)
    }
}
