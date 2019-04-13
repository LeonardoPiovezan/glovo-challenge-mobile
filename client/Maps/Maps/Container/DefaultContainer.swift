//
//  DefaultContainer.swift
//  Maps
//
//  Created by Leonardo Piovezan on 07/04/19.
//  Copyright © 2019 Leonardo Piovezan. All rights reserved.
//

import Foundation
import Swinject

final class DefaultContainer {
    let container: Container

    init() {
        self.container = Container()
        self.registerRepositories()
        self.registerServices()
        self.registerViewModels()
        self.registerViews()
    }
}
