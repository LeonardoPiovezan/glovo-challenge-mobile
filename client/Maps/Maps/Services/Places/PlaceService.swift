//
//  PlaceService.swift
//  Maps
//
//  Created by Leonardo Piovezan on 07/04/19.
//  Copyright © 2019 Leonardo Piovezan. All rights reserved.
//

import RxSwift
import Foundation

protocol PlaceService {
    func getCities() -> Single<Result<[City], PlaceError>>
    func getCountries() -> Single<Result<[Country], PlaceError>>
}
