//
//  DefaultContainer+Views.swift
//  Maps
//
//  Created by Leonardo Piovezan on 07/04/19.
//  Copyright © 2019 Leonardo Piovezan. All rights reserved.
//

import Foundation

extension DefaultContainer {

    func registerViews() {
        self.container.register(MapView.self) { _ in
            return MapView()
        }
    }
}
