//
//  PlaceServiceImpl.swift
//  Maps
//
//  Created by Leonardo Piovezan on 07/04/19.
//  Copyright © 2019 Leonardo Piovezan. All rights reserved.
//

import RxSwift

final class PlaceServiceImpl: PlaceService {
    private let repository: PlaceRepository

    init(repository: PlaceRepository) {
        self.repository = repository
    }
    
    func getCities() -> Single<Result<[City], PlaceError>> {
        return self.repository.getCities()
            .map { response in
                let statusCode = response.statusCode
                if 200...299 ~= statusCode {
                    do {
                        let countries = try response.map([City].self)
                        return Result.success(countries)
                    } catch {
                        return Result.failure(PlaceError.decodeError)
                    }
                }
                return Result.failure(PlaceError.apiError)
        }

    }

    func getCountries() -> Single<Result<[Country], PlaceError>> {
        return self.repository.getCountries()
            .map { response in
                let statusCode = response.statusCode
                if 200...299 ~= statusCode {
                    do {
                        let countries = try response.map([Country].self)
                        return Result.success(countries)
                    } catch {
                        return Result.failure(PlaceError.decodeError)
                    }
                }
                return Result.failure(PlaceError.apiError)
        }
    }
}
