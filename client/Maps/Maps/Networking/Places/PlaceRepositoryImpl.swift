//
//  PlaceRepositoryImpl.swift
//  Maps
//
//  Created by Leonardo Piovezan on 07/04/19.
//  Copyright © 2019 Leonardo Piovezan. All rights reserved.
//

import RxSwift
import Moya

class PlaceRepositoryImpl: PlaceRepository {

    private let provider: MoyaProvider<PlaceRouter>

    init(provider: MoyaProvider<PlaceRouter>) {
        self.provider = provider
    }

    func getCities() -> Single<Response> {
        return self.provider.rx.request(.cities)
    }

    func getCountries() -> Single<Response> {
        return self.provider.rx.request(.countries)
    }
}
