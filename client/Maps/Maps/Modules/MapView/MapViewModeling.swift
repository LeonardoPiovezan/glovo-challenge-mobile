//
//  MapViewModeling.swift
//  Maps
//
//  Created by Leonardo Piovezan on 13/04/19.
//  Copyright © 2019 Leonardo Piovezan. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa
import CoreLocation

protocol MapViewModeling {
    var location: Driver<CLLocation> { get }
}
