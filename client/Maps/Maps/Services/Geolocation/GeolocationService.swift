//
//  GeolocationService.swift
//  Maps
//
//  Created by Leonardo Piovezan on 07/04/19.
//  Copyright © 2019 Leonardo Piovezan. All rights reserved.
//

import Foundation
import RxCocoa
import CoreLocation

protocol GeolocationService {
    var autorized: Driver<Bool> { get }
    var location: Driver<CLLocation> { get }
    func requestAuthorizationFromUser()
    func startUpdatingLocation()
    func stopUpdatingLocation()
    func requestLocation()
}
