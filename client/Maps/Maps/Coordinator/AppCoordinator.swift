//
//  AppCoordinator.swift
//  Maps
//
//  Created by Leonardo Piovezan on 07/04/19.
//  Copyright © 2019 Leonardo Piovezan. All rights reserved.
//

import Foundation
import UIKit

final class AppCoordinator: Coordinator {
    private unowned var window: UIWindow
    private unowned var container: DefaultContainer

    init(window: UIWindow,
         container: DefaultContainer) {
        self.window = window
        self.container = container
    }

    func start() {

        let mapView = self.container.container.resolve(MapView.self)!
        self.window.rootViewController = mapView
    }
}
