//
//  City.swift
//  Maps
//
//  Created by Leonardo Piovezan on 07/04/19.
//  Copyright © 2019 Leonardo Piovezan. All rights reserved.
//

struct City: Codable {
    let code: String
    let name: String
    let country_code: String
    let working_area: [String]
}
