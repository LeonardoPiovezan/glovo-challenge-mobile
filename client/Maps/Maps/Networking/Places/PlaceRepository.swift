//
//  PlaceRepository.swift
//  Maps
//
//  Created by Leonardo Piovezan on 07/04/19.
//  Copyright © 2019 Leonardo Piovezan. All rights reserved.
//

import RxSwift
import Moya

protocol PlaceRepository {
    func getCities() -> Single<Response>
    func getCountries() -> Single<Response>
}
